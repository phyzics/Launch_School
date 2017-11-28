require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  reverse = params['reverse']
  @files = Dir.glob("Public/*")
  @files.map! { |file| File.basename(file) }
  @files.reverse! if params['reverse']
  @link = if reverse
            "<a href='/'>ascending order</a>"
          else
            "<a href='/?reverse=true'>descending order</a>"
          end
  erb :index
end
