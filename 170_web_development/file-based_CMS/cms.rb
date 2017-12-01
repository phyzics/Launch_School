# cms.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def render_markdown(file)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render("#{file}")
end

def valid_extension?(extname)
  extname.match?(/(.txt|.md)/)
end

def load_file_content(path)
  content = File.read(path)
  extension = File.extname(path)

  case extension
  when '.txt'
    headers['Content-type'] = 'text/plain'
    content
  when '.md'
    erb render_markdown(content)
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def user_signed_in?
  !!session[:username]
end

def required_signed_in_user
  if !user_signed_in?
    session[:message] = 'You must be signed in to do that.'
    redirect '/'
  end
end

# View list of all files
get '/' do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map { |path| File.basename(path) }
  erb :index
end

# Render 'New Document' page
get '/new' do
  required_signed_in_user
  erb :new
end

# Create a new document
post '/create' do
  required_signed_in_user
  file_path = File.join(data_path, params[:filename])

  if params[:filename].strip.empty?
    session[:message] = "A name is required."
    status 422
    erb :new
  elsif !valid_extension?(File.extname(file_path))
    session[:message] = "Only '.txt' and '.md' files are allowed." # rework to say that "ext" is invalid
    status 422
    erb :new
  else
    File.write(file_path, '')
    session[:message] = "#{params[:filename]} was created."

    redirect '/'
  end
end

# Delete a document
post '/:filename/delete' do
  required_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.delete(file_path)

  session[:message] = "#{params[:filename]} was deleted."
  redirect '/'
end

# View contents of a file
get '/:filename' do
  file_path = File.join(data_path, params[:filename])

  if File.file?(file_path)
    @file = load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# Edit contents of a file
get '/:filename/edit' do
  required_signed_in_user

  file_path = File.join(data_path, params[:filename])
  @filename = params[:filename]

  if File.file?(file_path)
    @content = File.read(file_path)
  end

  erb :edit
end

get '/:filename/duplicate' do
  required_signed_in_user
  erb :duplicate
end

post '/:filename/duplicate' do
  required_signed_in_user

end

# Save changes to a file
post '/:filename' do
  required_signed_in_user

  file_path = File.join(data_path, params[:filename])
  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

# Render "Sign In" page
get '/users/signin' do
  erb :sign_in
end

# Sign in as a user
post '/users/signin' do
  username = params[:username].downcase

  if valid_credentials?(username, params[:password])
    session[:username] = username
    session[:message]  = 'Welcome!'
    redirect '/'
  else
    session[:message] = 'Invalid Credentials.'
    status 422
    erb :sign_in
  end
end

# Sign Out
post '/users/signout' do
  session.delete(:username)
  session[:message] = 'You have been signed out.'
  redirect '/'
end
