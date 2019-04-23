# from http://blog.self-loop.com/architecture_lecture/html/17_leader_demo.html

require "socket"

class LogClient
  def initialize(data_store, log_server_port)
    @data_store = data_store
    @log_connection = TCPSocket.new("localhost", log_server_port)
    @thread = nil
  end

  def run!
    @thread = Thread.new do
      loop do
        command, key = @log_connection.gets.chomp.split
        puts "Received Log Line: #{command} #{key}"
        @data_store.perform_command(command, key, read_only: false)
      end
    end
  end

  def join
    @thread.join
  end
end
