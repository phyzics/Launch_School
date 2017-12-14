# library_app.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

before do
  session[:books] ||= []
end

helpers do
  def sort_books(criterion)
    session[:books].sort_by { |book| book[criterion] }
  end
end

def user_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/users.yml', __FILE__)
  else
    File.expand_path('../users.yml', __FILE__)
  end
end

def select_book(id)
  session[:books].select { |book| book[:id] == id }.first
end

def next_element_id(elements)
  max = elements.map { |book| book[:id] }.max || 0
  max + 1
end

def valid_tags?(tags)
  split_tags = tags.split(', ')

  split_tags.all? { |tag| tag.match?(/^\b[a-zA-Z]+\b$/) }
end

def load_user_credentials
  YAML.load_file(user_path)
end

def validate_credentials(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def require_admin
  return if session[:username] == 'admin'

  session[:error] = 'You do not have the privledges to perform that action.'
  redirect '/'
end

def edit_values(book, title, author, genre, tags)
  book[:title]  = title
  book[:author] = author
  book[:genre]  = genre
  book[:tags]   = tags
end

def error_for_username(username, password, ver_password, credentials)
  if username.empty?
    session[:error] = 'Please enter a username.'
  elsif credentials.key?(username)
    session[:error] = 'Sorry, but that username already exists.'
  elsif password.strip.empty?
    session[:error] = 'Please enter a password.'
  elsif password != ver_password
    session[:error] = 'Please make sure to correctly verify your password.'
  end
end

def error_for_book(title, author, genre, tags)
  if [title, author, genre].any? { |field| field.strip.empty? }
    "The 'title', 'author', and 'genre' fields cannot be empty."
  elsif session[:books].any? do |book|
          yield(book)
        end
    'That book already exists in the database.'
  elsif !valid_tags?(tags)
    'Please make sure that your tags are formatted correctly.'
  end
end

# index
get '/' do
  erb :home
end

# admin control panel
get '/admin' do
  require_admin

  erb :admin
end

# view signin page
get '/signin' do
  erb :signin
end

# sign in
post '/signin' do
  username = params[:username].downcase
  password = params[:password]

  if validate_credentials(username, password)
    session[:username] = username
    session[:success] = 'Welcome!'

    redirect '/'
  else
    session[:error] = 'Invalid credentials!'
    status 422
    erb :signin
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  credentials = load_user_credentials
  @username = params[:username].downcase.strip
  password  = params[:password]

  error = error_for_signup(@username, password,
                           params[:verify_password], credentials)
  if error
    session[:error] = error
    status 422
    erb :signup
  else
    password = BCrypt::Password.create(password).to_s

    File.write(user_path, "\n#{@username}: #{password}", mode: 'a')
    session[:username] = @username
    session[:success]  = 'Account creation successful!'

    redirect '/'
  end
end

# sign out
get '/signout' do
  session[:success] = 'You have been successfully logged out.'
  session.delete(:username)

  redirect '/'
end

# view add book page
get '/admin/add' do
  require_admin

  erb :add
end

# add book
post '/admin/add' do
  require_admin

  @title = params[:title]
  @author = params[:author]
  @genre = params[:genre]
  @tags = params[:tags]

  error = error_for_book(@title, @author, @genre, @tags) do |book|
    book[:title] == @title && book[:author] == @author
  end

  if error
    session[:error] = error
    status 422
    erb :add
  else
    session[:books] << {
      title: @title,
      author: @author,
      genre: @genre,
      tags: @tags.split(', '),
      id: next_element_id(session[:books]),
      checked_out: false
    }

    session[:success] = 'Book has been added!'
    redirect '/admin/add'
  end
end

# render edit page
get '/book/:id/edit' do
  require_admin

  book = select_book(params[:id].to_i)
  @title  = book[:title]
  @author = book[:author]
  @genre  = book[:genre]
  @tags   = book[:tags]
  @id     = book[:id]
  erb :edit
end

# edit a book
post '/book/:id/edit' do
  book = select_book(params[:id].to_i)
  @title  = params[:title]
  @author = params[:author]
  @genre  = params[:genre]
  @tags   = params[:tags]
  @id     = params[:id]

  error = error_for_book(@title, @author, @genre, @tags) do |lib_book|
    next if lib_book[:id] == book[:id]
    lib_book[:title] == @title && lib_book[:author] == @author
  end

  if error
    session[:error] = error
    status 422
    erb :edit
  else
    edit_values(book, @title, @author, @genre, @tags.split(', '))

    session[:success] = 'Book has been updated.'
    redirect "/book/#{@id}"
  end
end

# check book out
post '/book/:id/checkout' do
  book = select_book(params[:id].to_i)
  book[:checked_out] = true
  session[:success] = "#{book[:title]} has been checked out!"

  redirect '/'
end

# check book in
post '/book/:id/checkin' do
  book = select_book(params[:id].to_i)
  book[:checked_out] = false
  session[:success] = "#{book[:title]} has been checked in!"

  redirect '/'
end

# search by title
get '/search/title' do
  erb :title
end

# search by author
get '/search/author' do
  @authors = session[:books].each_with_object({}) do |book, hsh|
    if hsh[book[:author]].nil?
      hsh[book[:author]] = [{ title: book[:title], id: book[:id] }]
    else
      hsh[book[:author]] << { title: book[:title], id: book[:id] }
    end
  end
  erb :author
end

# search by genre
get '/search/genre' do
  @genres = session[:books].each_with_object({}) do |book, hsh|
    if hsh[book[:genre]].nil?
      hsh[book[:genre]] = [{ title:  book[:title],
                             author: book[:author],
                             id:     book[:id] }]
    else
      hsh[book[:genre]] << { title:  book[:title],
                             author: book[:author],
                             id: book[:id] }
    end
  end
  erb :genre
end

# search by tags
get '/search/tags' do
  tags = params[:query].downcase

  if !valid_tags?(tags)
    session[:error] = 'Please make sure that your tags are formatted correctly.'
    status 422
    erb :home
  else
    tags = tags.strip.split(', ').uniq.sort

    @tags = tags.each_with_object({}) { |tag, hsh| hsh[tag] = [] }

    @tags.each do |tag, arr|
      session[:books].each do |book|
        arr << book if book[:tags].include?(tag)
      end
    end
    erb :tags
  end
end

# view book
get '/book/:id' do
  @book = select_book(params[:id].to_i)
  erb :book
end

# delete book
post '/book/:id/delete' do
  require_admin

  session[:books].delete_if { |book| book[:id] == params[:id].to_i }

  session[:success] = 'Book has been deleted.'
  redirect '/'
end

not_found do
  '404 Not Found'
end
