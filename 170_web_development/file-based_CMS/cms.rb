# cms.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

VALID_TEXT_FORMATS = %w[.txt .md].freeze
VALID_IMG_FORMATS  = %w[.jpg .gif].freeze

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

def image_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/images', __FILE__)
  else
    File.expand_path('../public/images', __FILE__)
  end
end

def users_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/users.yml', __FILE__)
  else
    File.expand_path('../users.yml', __FILE__)
  end
end

def determine_file_path(extension)
  VALID_IMG_FORMATS.include?(extension) ? image_path : data_path
end

def render_markdown(file)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(file.to_s)
end

def valid_extension?(extname, filetype)
  if filetype == 'doc'
    VALID_TEXT_FORMATS.include?(extname)
  else
    VALID_IMG_FORMATS.include?(extname)
  end
end

def valid_image_files
  VALID_IMG_FORMATS.join(',')
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
  YAML.load_file(users_path)
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
  session[:username]
end

def required_signed_in_user
  return if user_signed_in?

  session[:message] = 'You must be signed in to do that.'
  redirect '/'
end

def select_files_from_directory(extension)
  case determine_file_path(extension)
  when data_path
    Dir.glob(File.join(data_path, '*')).map { |path| File.basename(path) }
  when image_path
    Dir.glob(File.join(image_path, "*{#{valid_image_files}}")).map do |path|
      File.basename(path)
    end
  end
end

def error_for_filename(filename, extension, filetype, old_filename = nil)
  files = select_files_from_directory(extension)

  if filename.strip.empty?
    'A name is required.'
  elsif !valid_extension?(extension, filetype)
    "Sorry, but '#{extension}' is not a valid format."
  elsif old_filename && extension != File.extname(old_filename)
    'Duplicates must use the same format as the original copy.'
  elsif files.include?(filename)
    'The new file name must be unique.'
  end
end

def determine_error_number(error_text)
  if error_text.include?('Sorry, but')
    status 415
  else
    status 422
  end
end

# View list of all files
get '/' do
  data_pattern  = File.join(data_path, '*')
  image_pattern = File.join(image_path, "*{#{valid_image_files}}")
  @files  = Dir.glob(data_pattern).map { |path| File.basename(path) }
  @images = Dir.glob(image_pattern).map { |path| File.basename(path) }
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

  error = error_for_filename(filename, extension, 'doc')
  if error
    session[:message] = error
    status determine_error_number(error)
    erb :new
  else
    File.write(file_path, '')
    session[:message] = "#{params[:filename]} was created."

    redirect '/'
  end
end

# Render upload page
get '/upload' do
  required_signed_in_user
  erb :upload
end

# Upload an image
post '/upload' do
  required_signed_in_user

  filename = if params[:file].nil?
               session[:message] = 'A name is required.'
               status 422
               redirect '/upload'
             else
               params[:file][:filename].downcase
             end
  file_path = File.join(image_path, filename)
  extension = File.extname(filename)
  tempfile = params[:file][:tempfile]

  error = error_for_filename(filename, extension, 'image')
  if error
    session[:message] = error
    status determine_error_number(error)
    erb :upload
  else
    File.open(file_path, 'wb') { |file| file.write(tempfile.read) }
    session[:message] = "#{filename} was uploaded."

    redirect '/'
  end
end

# Delete a document
post '/:filename/delete' do
  required_signed_in_user

  filename = params[:filename]
  target_directory = determine_file_path(File.extname(filename))
  file_path = File.join(target_directory, filename)
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

  @content = File.read(file_path) if File.file?(file_path)

  erb :edit
end

# Render duplicate page
get '/:filename/duplicate' do
  required_signed_in_user
  erb :duplicate
end

# Duplicate a file
post '/:filename/duplicate' do
  required_signed_in_user

  @filename = params[:new_filename].downcase
  extension = File.extname(@filename)
  target_directory = determine_file_path(extension)
  file_path = File.join(target_directory, @filename)

  error = error_for_filename(@filename, extension, 'doc', params[:filename])
  if error
    session[:message] = error
    status determine_error_number(error)
    erb :duplicate
  else
    contents = File.read(File.join(target_directory, params[:filename]))

    File.write(file_path, contents.to_s)
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
  redirect '/'
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
  @username = params[:username].downcase.strip
  password = params[:password]
  credentials = load_user_credentials

  if credentials.key?(@username)
    session[:message] = 'Sorry, but that username is already taken.'
    status 422
    erb :signup
  elsif @username.empty?
    session[:message] = 'You must enter an account name.'
    status 422
    erb :signup
  else
    password = BCrypt::Password.create(password).to_s

    File.write(users_path, "\n#{@username}: #{password}", mode: 'a')
    session[:username] = @username
    session[:message] = 'Account creation successful!'

    redirect '/'
  end
end

get '/images/:image' do
  erb params[:image]
end
