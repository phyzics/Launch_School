# med_105.rb - Circular Buffer
class CircularBuffer
  attr_reader :buffer

  def initialize(size)
    @buffer = Array.new(size)
    @new = true
  end

  def write(ele)
    raise BufferFullException if !buffer.include?(nil)
    return if ele.nil?

    if @new
      set_first_buffer(ele)
    else
      set_next_buffer(ele)
    end
  end

  def write!(ele)
    begin
      write(ele)
    rescue
      return if ele.nil?
      set_next_buffer(ele)
      @oldest_index = @next_index
    end
  end

  def read
    raise BufferEmptyException if buffer.compact.empty?

    oldest_ele = buffer[@oldest_index]
    buffer[@oldest_index] = nil
    @oldest_index + 1 == buffer.size ? @oldest_index = 0 : @oldest_index += 1
    oldest_ele
  end

  def clear
    @buffer = Array.new(@buffer.size)
    @new = true
  end

  protected

  def set_first_buffer(ele)
    @oldest_index = rand(buffer.size)
    buffer[@oldest_index] = ele
    @new = false
    @oldest_index + 1 == buffer.size ? @next_index = 0 : @next_index = @oldest_index + 1
  end

  def set_next_buffer(ele)
    buffer[@next_index] = ele
    @next_index + 1 == buffer.size ? @next_index = 0 : @next_index += 1
  end

  class BufferEmptyException < StandardError ; end
  class BufferFullException < StandardError ; end
end
