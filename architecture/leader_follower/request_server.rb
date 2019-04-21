# from http://blog.self-loop.com/architecture_lecture/html/17_leader_demo.html

require_relative "data_store"
require "socket"

class RequestServer
  def initialize(data_store, port, read_only:)
  end

  def run!
  end

  def join
  end

  def handle_client_request!(connection)
  end

  def handle_command(connection, command, key)
  end
end
