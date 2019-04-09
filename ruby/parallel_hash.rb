# from http://blog.self-loop.com/architecture_lecture/html/06_parallelism.html

require "digest/md5"

Thread::abort_on_exception = true

t1 = Time.now

MAXIMUM = 2 ** 128 - 1
DIFFICULTY = 1_000_000
GOAL = MAXIMUM / DIFFICULTY
NUM_HASHES = 5

NUM_THREADS = 2

def start_thread(thread_idx, queue)
  thread = Thread.new do
    # inside the block is the code the thread runs. Then the thread quits.
    string = thread_idx.to_s
    loop do
      hash = Digest::MD5.hexdigest(string).to_i(16)
      queue << [string, hash, thread.to_s] if hash < GOAL
      string = hash.to_s
    end
  end

  thread
end

# "thread safe" queue
results = Queue.new
threads = []
NUM_THREADS.times { |thread_idx| threads << start_thread(thread_idx, results) }

NUM_HASHES.times do
  result = results.shift
  p result
end

threads.each(&:kill)

t2 = Time.now
puts t2 - t1
