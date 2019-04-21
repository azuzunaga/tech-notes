# from http://blog.self-loop.com/architecture_lecture/html/17_leader_demo.html

require "thread"

class UnknownCommandException < Exception; end
class ReadOnlyException < Exception; end

class DataStore
  def initialize
  end

  def increment(key)
  end

  def square(key)
  end

  def get(key)
  end

  def perform_command(command, key, read_only:)
  end

  def get_log_lines(start_position)
  end
end
