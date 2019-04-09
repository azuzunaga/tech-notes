# from http://blog.self-loop.com/architecture_lecture/html/07_threaded_server.html

# TCP Server: reverse echo server

require "socket"

server = TCPServer.new(8888)

# Using MRI, there is no parallelism. But there is "concurrency".
# This allows the server to handle multiple requests at once, allowing
# it to process other requests even if one request is stuck or takes
# longer that the other requests.
def run_worker_thread(connection)
  Thread.new do
    puts "Thread spawned with connection #{connection}"
    value = connection.gets.chomp
    connection.puts value.reverse
    connection.close
  end
end

while true
  connection = server.accept
  run_worker_thread(connection)
end
