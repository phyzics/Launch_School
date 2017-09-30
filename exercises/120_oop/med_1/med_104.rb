# med_104.rb - Circular Queue
class CircularQueue
  attr_reader :queue, :most_recent, :oldest

  def initialize(size)
    @queue = Array.new(size, nil)
    @array_size = size
  end

  def enqueue(number)
    if all_empty?
      queue[0] = number
      @most_recent = 0
      @oldest = 0
    elsif next_slot == oldest
      change_oldest
      queue[next_slot] = number
      @most_recent = next_slot
    else
      queue[next_slot] = number
      @most_recent = next_slot
    end
  end

  def dequeue
    return nil if all_empty?

    return_num = queue[oldest]
    queue[oldest] = nil
    change_oldest

    return_num
  end

  def change_oldest
    if @oldest == @array_size - 1
      @oldest = 0
    else
      @oldest += 1
    end
  end

  def all_full?
    queue.all? { |ele| ele }
  end

  def all_empty?
    queue.all?{ |ele| ele == nil }
  end

  def next_slot
    return 0 if @most_recent == @array_size - 1
    @most_recent + 1
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)

puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
