# roll.rb
require "socket"

def parse_request(request)
  http_method = request.scan(/\A[A-Z]+\b/)[0]
  path        = request.scan(/\/(?=[\s\?])/)[0]
  names       = request.scan(/\w+(?==)/)
  values      = request.scan(/(?<==)\w+/)
  params      = names.zip(values).to_h
  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts "http_method"
  client.puts "path"
  client.puts "params"
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"
  rolls       = params['rolls'].to_i
  sides       = params['sides'].to_i

  rolls.times { client.puts "<p>", rand(sides) + 1, "</p>" }

  client.puts "</body>"
  client.puts "</html>"
  client.close
end
