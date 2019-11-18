# from http://blog.self-loop.com/architecture_lecture/html/17_leader_demo.html

class UnknownCommandException < Exception; end
class ReadOnlyException < Exception; end

class DataStore
  def initialize
    @data = Hash.new(0)
    @log_lines = []
  end

  def increment(key)
    @data[key] = (1 + @data[key]) % 1_000_000
    @log_lines << "INCREMENT #{key}"
  end

  def square(key)
    @data[key] = (@data[key] * @data[key]) % 1_000_000
    @log_lines << "SQUARE #{key}"
  end

  def get(key)
    @data[key]
  end

  def perform_command(command, key, read_only:)
    case command
    when "GET"
      get(key)
    when "INCREMENT"
      raise ReadOnlyException if read_only

      increment(key)
      "OK"
    when "SQUARE"
      raise ReadOnlyException if read_only

      square(key)
      "OK"
    else
      raise UnknownCommandException
    end
  end

  def get_new_log_lines(start_position)
    @log_lines[start_position..-1]
  end
end
