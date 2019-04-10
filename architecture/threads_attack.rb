# from http://blog.self-loop.com/architecture_lecture/html/09_locking.html
# from http://blog.self-loop.com/architecture_lecture/html/10_ruby_mutex.html

# Run in Jruby to simulate a data race
# If you have two threads working and changing the same data, you want
# to use locks to prevent the threads overwriting each other.

require "concurrent"

NUM_ITERS = 1_000_000

class MyMutex
  def initialize
    @thread1_wants_to_lock = Concurrent::AtomicBoolean.new(false)
    @thread2_wants_to_lock = Concurrent::AtomicBoolean.new(false)
    @turn = Concurrent::AtomicFixnum.new(0)
  end

  def lock(thread_idx )
    if thread_idx == 1
      @thread1_wants_to_lock.make_true
      @turn.value = 2
      while @thread2_wants_to_lock.true? && @turn.value == 2
        # Busy loop AKA "Spinlock"
      end
    else
      @thread2_wants_to_lock.make_true
      @turn.value = 1
      while @thread1_wants_to_lock.true? && @turn.value == 1
        # Busy loop AKA "Spinlock"
      end
    end
  end

  def unlock(thread_idx)
    if thread_idx == 1
      @thread1_wants_to_lock.make_false
    else
      @thread2_wants_to_lock.make_false
    end
  end

end

i = 0
lock_for_i = MyMutex.new

thr1 = Thread.new do
  NUM_ITERS.times do
    lock_for_i.lock(1)
    i += 1
    lock_for_i.unlock(1)
  end
end

thr2 = Thread.new do
  NUM_ITERS.times do
    lock_for_i.lock(2)
    i += 1
    lock_for_i.unlock(2)
  end
end

thr1.join
thr2.join

puts i
