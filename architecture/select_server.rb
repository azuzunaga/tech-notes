# from http://blog.self-loop.com/architecture_lecture/html/08_select_server.html

# TCP Server: reverse echo server

require "socket"

server = TCPServer.new(8888)

def process_connection(connection)
  value = connection.gets.chomp
  connection.puts value.reverse
  connection.close
end

readable_objects = [server]
while true
  puts "READABLE OBJECTS: #{readable_objects}"
  ready_readable_objects, _, _ = IO::select(readable_objects)

  puts "READY READABLE OBJECTS: #{ready_readable_objects}"
  ready_readable_objects.each do |ready_readable_object|
    if ready_readable_object == server
      puts "Connected. New connection!"
      connection = server.accept
      readable_objects << connection
    else
      # this must be a connection
      process_connection(ready_readable_object)
      readable_objects.delete(ready_readable_object)
    end
  end
  # Loop back to select.
end
