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
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_equal(last_response.body, '')

    get last_response["Location"]

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, 'notafile.ext does not exist.')
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

    get '/test.txt/edit'

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "<textarea")
    assert_includes(last_response.body, %q(<button type="submit"))
  end

  def test_updating_document
    post '/test.txt', content: "Edited information."

    assert_equal(302, last_response.status)

    get last_response["Location"]

    assert_includes(last_response.body, 'test.txt has been updated.')

    get '/test.txt'

    assert_equal(200, last_response.status)
    assert_equal("text/plain", last_response["Content-Type"])
    assert_includes(last_response.body, "Edited information.")
  end

  def test_naming_new_document
    get '/new'

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "Add a new document:")
    assert_includes(last_response.body, %q(<button type="submit"))
  end

  def test_create_document
    post '/create', filename: 'test.txt'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, 'test.txt was created.')
    assert_includes(last_response.body, "<a href=\"test.txt\">test.txt</a>")
  end

  def test_attempt_create_document_with_no_name
    post '/create', filename: '    '

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, "A name is required.")
  end

  def test_delete_document
    create_document('test.txt')

    post '/test.txt/delete'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, "test.txt was deleted.")
    refute_includes(last_response.body, "<a href=\"test.txt\">test.txt</a>")
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

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, 'Welcome!')
    assert_includes(last_response.body, 'Signed in as admin')
  end

  def test_sign_in_invalid_credentials
    post '/users/signin', username: 'keeper of', password: 'kookus'

    assert_equal(422, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, 'Invalid Credentials.')
  end

  def test_sign_out
    post '/users/signin', username: 'admin', password: 'secret'

    get last_response['Location']

    assert_includes(last_response.body, 'Welcome!')

    post '/users/signout'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_equal("text/html;charset=utf-8", last_response["Content-Type"])
    assert_includes(last_response.body, 'You have been signed out.')
    assert_includes(last_response.body, 'Sign In')
  end
end
