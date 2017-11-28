# roll.rb
require "socket"

def parse_request(request)
  http_method = request.scan(/\A[A-Z]+\b/)[0]
  path        = request.scan(/(?<!HTTP)\/[^?]*/)[0]
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
  client.puts "#{http_method}"
  client.puts "#{path}"
  client.puts "#{params}"
  client.puts "</pre>"

  number = params["number"].to_i
  client.puts "<h1>Counter</h1>"

  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
