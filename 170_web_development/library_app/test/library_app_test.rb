# library_app_test.rb
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../library_app'

class LibraryTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def session
    last_request.env['rack.session']
  end

  def admin_session
    { 'rack.session' => { username: 'admin' } }
  end

  def user_session
    { 'rack.session' => { username: 'user' } }
  end

  def one_book
    { 'rack.session' => { books: [{
                                   title: 'book1',
                                   author: 'author1',
                                   genre: 'genre1',
                                   tags: 'one, two',
                                   id: '1'
                                   }] } }
  end

  def add_book(title, author, genre, tags = nil, id)
    session[:books] << { title: title,
                         author: author,
                         genre: genre,
                         tags: tags.split(', '),
                         id: id
                       }
  end

  def no_admin_error_message
    'You do not have the privledges to perform that action.'
  end

  def test_view_homepage_as_guest
    get '/'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<p>Browse by...')
    refute_includes(last_response.body, 'Logged in as')
    assert_includes(last_response.body, "<a href=\"/signup\">Sign up!")
  end

  def test_view_homepage_as_admin
    get '/', {}, admin_session

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'Logged in as admin')
    assert_includes(last_response.body, 'control panel')
    assert_includes(last_response.body, "<a href='/signout'>Sign out")
  end

  def test_view_homepage_as_user
    get '/', {}, user_session

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'Logged in as user')
    refute_includes(last_response.body, 'control panel')
    assert_includes(last_response.body, "<a href='/signout'>Sign out")
  end

  def test_view_signin_page
    get '/signin'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<label for="username">Username')
  end

  def test_signin_as_admin
    post '/signin', { username: 'admin', password: 'admin' }

    assert_equal(302, last_response.status)
    assert_equal('Welcome!', session[:success])
  end

  def test_signin_as_user
    post '/signin', { username: 'user', password: 'user' }

    assert_equal(302, last_response.status)
    assert_equal('Welcome!', session[:success])
  end

  def test_attempt_signin_no_password
    post '/signin', { username: 'admin', password: '   ' }

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'Invalid credentials!')
  end

  def test_attempt_singin_no_username
    post '/signin', { username: '    ', password: 'admin' }

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'Invalid credentials!')
  end

  def test_attempt_signin_non_existent_user
    post '/signin', { username: 'keeper of', password: 'kookus' }

    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'Invalid credentials!')
  end

  def test_sign_out
    get '/signout', {}, admin_session

    assert_equal(302, last_response.status)
    assert_equal('You have been successfully logged out.', session[:success])
  end

  def test_view_signup_page
    get '/signup'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<label for="username">Username')
    assert_includes(last_response.body, '<label for="password">Password')
    assert_includes(last_response.body, '<label for="verify_password">Verify Password')
  end

  def test_view_by_title
    get '/search/title', {}, one_book

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'book1')
  end

  def test_view_by_author
    get '/search/author', {}, one_book

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'author1')
  end

  def test_view_by_genre
    get '/search/genre', {}, one_book

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'genre1')
  end

  def test_view_by_tags
    get '/search/tags', { query: 'one, two' }, one_book

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<h3>one')
    assert_includes(last_response.body, '<h3>two')
    assert_includes(last_response.body, 'book1')
    assert_includes(last_response.body, 'author1')
  end

  def test_view_admin_control_panel
    get '/admin', {}, admin_session

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<h1>Admin Control Panel')
  end

  def test_attempt_view_control_panel
    get '/admin'

    assert_equal(302, last_response.status)
    assert_equal(no_admin_error_message, session[:error])
  end

  def test_view_add_book
    get '/admin/add', {}, admin_session

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<label for="title">Title')
    assert_includes(last_response.body, '<label for="author">Author')
    assert_includes(last_response.body, '<label for="genre">Genre')
    assert_includes(last_response.body, '<label for="tags">tags')
  end

  def test_attempt_view_add_book
    get '/admin/add'

    assert_equal(302, last_response.status)
    assert_equal(no_admin_error_message, session[:error])
  end

  def test_add_book
    post '/admin/add', { title: 'book', author: 'author', genre: 'genre', tags: 'one, two'}, admin_session

    assert_equal(302, last_response.status)
    assert_equal('Book has been added!', session[:success])
    assert_equal('book', session[:books][0][:title])
    assert_equal('author', session[:books][0][:author])
    assert_equal('genre', session[:books][0][:genre])
    assert_equal(['one', 'two'], session[:books][0][:tags])
  end

  def test_attempt_add_book_as_guest
    post '/admin/add'

    assert_equal(302, last_response.status)
    assert_equal(no_admin_error_message, session[:error])
  end

  def test_attempt_add_book_as_user
    post '/admin/add', {}, user_session

    assert_equal(302, last_response.status)
    assert_equal(no_admin_error_message, session[:error])
  end
end
