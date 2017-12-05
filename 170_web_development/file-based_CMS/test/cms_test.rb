# cms_test.rb
ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative "../cms"

class CmsTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    yaml_file_path = File.expand_path("#{data_path}/../users.yml", __FILE__)
    password = "$2a$10$Y5u/46AuIFNU4dQvZAJcSOy43vgZW74pSjTPCEE.fqe1YYc3v15cu"

    # Removes users added in "sign up" test
    File.write(yaml_file_path, "admin: #{password}") if File.read(yaml_file_path).include?('gwyn')

    FileUtils.rm_rf(data_path)
  end

  def app
    Sinatra::Application
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { 'rack.session' => { username: 'admin'} }
  end

  def test_index
    create_document("about.md")
    create_document("changes.txt")

    get "/"

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "about.md")
    assert_includes(last_response.body, "changes.txt")
  end

  def test_viewing_text_document
    create_document("history.txt", "1993 - Yukihiro Matsumoto dreams up Ruby.")

    get '/history.txt'

    assert_equal(200, last_response.status)
    assert_equal("text/plain", last_response["Content-Type"])
    assert_includes(last_response.body, "1993 - Yukihiro Matsumoto dreams up Ruby.")
  end

  def test_viewing_nonexistent_document
    get '/notafile.ext'

    assert_equal(302, last_response.status)
    assert_equal('notafile.ext does not exist.', session[:message])
  end

  def test_viewing_markdown_document
    create_document("about.md", "# Ruby is...")

    get '/about.md'

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, '<h1>Ruby is...</h1>')
  end

  def test_editing_document
    create_document("test.txt")

    get '/test.txt/edit', {}, admin_session

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "<textarea")
    assert_includes(last_response.body, %q(<button type="submit"))
  end

  def test_editing_document_signed_out
    create_document('test.txt')

    get '/test.txt/edit'
    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_updating_document
    post '/test.txt', { content: "Edited information." }, admin_session

    assert_equal(302, last_response.status)
    assert_equal('test.txt has been updated.', session[:message])

    get '/test.txt'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, "Edited information.")
  end

  def test_updating_document_signed_out
    post '/test.txt', content: "Edited information."

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_new_document_form
    get '/new', {}, admin_session

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "Add a new document:")
    assert_includes(last_response.body, %q(<button type="submit"))
  end

  def test_new_document_form_signed_out
    get '/new'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_create_document
    post '/create', { filename: 'test.txt' }, admin_session

    assert_equal(302, last_response.status)
    assert_equal('test.txt was created.', session[:message])

    get last_response['Location']

    assert_includes(last_response.body, %q(href="/test.txt"))
  end

  def test_attempt_create_document_with_no_name
    post '/create', { filename: '    ' }, admin_session

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, "A name is required.")
  end

  def test_attempt_create_document_with_invalid_format
    post '/create', { filename: 'darksouls.pdf' }, admin_session

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, "Sorry, but '.pdf' is not a valid format.")
  end

  def test_attempt_create_document_with_duplicate_name
    create_document('about.txt')

    post '/create', { filename: 'about.txt' }, admin_session

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'The new file name must be unique.')
  end

  def test_create_document_signed_out
    post '/create', filename: 'test.txt'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_delete_document
    create_document('test.txt')

    post '/test.txt/delete', {}, admin_session

    assert_equal(302, last_response.status)
    assert_equal('test.txt was deleted.', session[:message])

    get last_response['Location']

    refute_includes(last_response.body, %q(href="test.txt"))
  end

  def test_delete_document_signed_out
    create_document('test.txt')

    post '/test.txt/delete'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  # ADD DUPLICATION TESTS
  def test_duplicate_document
    skip
  end

  def test_sign_in_page
    get '/users/signin'

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "<input")
    assert_includes(last_response.body, %q(<button type="submit"))
  end

  def test_sign_in_as_admin
    post '/users/signin', username: 'admin', password: 'secret'

    assert_equal(302, last_response.status)
    assert_equal('admin', session[:username])
    assert_equal('Welcome!', session[:message])

    get last_response['Location']

    assert_includes(last_response.body, 'Signed in as admin')
  end

  def test_sign_in_invalid_credentials
    post '/users/signin', username: 'keeper of', password: 'kookus'

    assert_equal(422, last_response.status)
    assert_nil(session[:username])
    assert_includes(last_response.body, 'Invalid Credentials.')
  end

  def test_sign_out
    get '/', {}, admin_session

    post '/users/signout'

    assert_equal(302, last_response.status)
    assert_equal('You have been signed out.', session[:message])
    assert_nil(session[:username])

    get last_response['Location']

    assert_includes(last_response.body, 'Sign In')
  end

  def test_viewing_signup
    get '/users/signup'

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, 'Please enter the username you wish to use as well as a password.')
  end

  def test_signup
    post '/users/signup', username: 'gwyn', password: 'lordofcinder'

    assert_equal(302, last_response.status)
    assert_equal('Account creation successful!', session[:message])

    get last_response['Location']

    assert_includes(last_response.body, 'gwyn')
    refute_includes(last_response.body, '<p>Not registered?')
  end

  def test_attempt_signup_duplicate_name
    post '/users/signup', username: 'admin', password: 'secret'

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'Sorry, but that username is already taken')
  end

  def test_attempt_singup_empty_name
    post '/users/signup', username: '     ', password: 'secret'

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'You must enter an account name.')
  end
end
