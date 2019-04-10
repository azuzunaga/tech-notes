# from http://blog.self-loop.com/architecture_lecture/html/09_locking.html

# Run in Jruby to simulate a data race
# If you have two threads working and changing the same data, you want
# to use locks to prevent the threads overwriting each other.

NUM_ITERS = 1_000_000

i = 0
lock = Mutex.new

thr1 = Thread.new do
  NUM_ITERS.times do
    lock.lock
    i += 1
    lock.unlock
  end
end

thr2 = Thread.new do
  NUM_ITERS.times do
    lock.lock
    i += 1
    lock.unlock
  end
end

thr1.join
thr2.join

puts i
