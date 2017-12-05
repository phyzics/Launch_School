# cms.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

VALID_FORMATS = %w(.txt .md .jpg .gif)

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
  VALID_FORMATS.include?(extname)
end

def validate_filename(filename, old_filename = nil)
  extension = File.extname(filename)
  old_ext = File.extname(File.join(data_path, old_filename)) if old_filename
  files = Dir.glob("#{data_path}/*").map { |path| File.basename(path) }

  if filename.strip.empty?
    :empty_name
  elsif !valid_extension?(extension)
    :invalid_format
  elsif old_filename && extension != old_ext
    :format_changed
  elsif files.include?(filename)
    :duplicate_name
  else
    :valid
  end
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

  filename = params[:filename]
  file_path = File.join(data_path, params[:filename])
  extension = File.extname(file_path)

  case validate_filename(filename)
  when :empty_name
    session[:message] = "A name is required."
    status 422
    erb :new
  when :invalid_format
    session[:message] = "Sorry, but '#{extension}' is not a valid format."
    status 422
    erb :new
  when :duplicate_name
    session[:message] = "The new file name must be unique."
    status 422
    erb :new
  when :valid
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

    redirect '/'
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

  @filename = params[:new_filename]
  file_path = File.join(data_path, params[:new_filename])
  extension = File.extname(file_path)

  files = Dir.glob(File.join(data_path, "*")).map { |path| File.basename(path) }
  contents = File.read(File.join(data_path, params[:filename]))

  case validate_filename(@filename, params[:filename])
  when :empty_name
    session[:message] = "A name is required."
    status 422
    erb :duplicate
  when :invalid_format
    session[:message] = "Sorry, but '#{extension}' is not a valid format."
    status 422
    erb :duplicate
  when :format_changed
    session[:message] = "Duplicates must use the same format as the original copy."
    status 422
    erb :duplicate
  when :duplicate_name
    session[:message] = "The new file name must be unique."
    status 422
    erb :duplicate
  when :valid
    File.write(file_path, "#{contents}")
    session[:message] = "#{@filename} was created."

    redirect '/'
  end
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

# Render "Sign Up" page
get '/users/signup' do
  erb :signup
end

# Sign Up
post '/users/signup' do
  @username = params[:username]
  password = params[:password]
  credentials = load_user_credentials

  if credentials.key?(@username)
    session[:message] = "Sorry, but that username is already taken."
    status 422
    erb :signup
  else
    password = BCrypt::Password.create(password).to_s
    file_path = File.expand_path("#{data_path}/../users.yml", __FILE__)

    File.write(file_path, "\n#{@username}: #{password}", mode: "a")
    session[:username] = @username
    session[:message] = 'Account creation successful!'

    redirect '/'
  end
end
