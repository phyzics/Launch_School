# users.rb
require "tilt/erubis"
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

USERS = YAML.load_file('users.yml')

def get_user_info(&block)
  USERS.each_pair do |name, info|
    email = info[:email]
    interests = info[:interests]
    yield(name.to_s, email, interests)
  end
end

def get_names
  names = []
  get_user_info do |name|
    names << name
  end
  names
end

def get_emails
  emails = {}
  get_user_info do |name, email|
    emails[name] = email
  end
  emails
end

def get_interests
  interests = {}
  get_user_info do |name, _, ints|
    interests[name] = ints
  end
  interests
end

before do
  @title = "Cool Users | The FaceBook 2.0!"
  @users = get_names
  @emails = get_emails
  @interests = get_interests
end

helpers do
  def count_interests
    @interests.values.flatten.count
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/users/:name" do
  redirect "/users" unless @users.include?(params[:name])
  @name = params[:name]
  @email = @emails[@name]
  @user_interests = @interests[@name]
  erb :user_profile
end
