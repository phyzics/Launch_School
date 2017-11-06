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
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  rolls       = params['rolls'].to_i
  sides       = params['sides'].to_i

  client.puts request_line
  rolls.times { client.puts rand(sides) + 1 }

  client.close
end
