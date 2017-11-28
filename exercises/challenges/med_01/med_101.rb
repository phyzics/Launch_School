# med_101.rb - Secret Handshake
class SecretHandshake
  attr_reader :number

  def initialize(num)
    @number = num.class == Integer ? num.to_s(2) : num
  end

  def commands
    return [] if @number.match?(/[^\d]/)

    reverse_array = false
    command_array = []
    dividee = number.to_i

    (number.size - 1).downto(0) do |t|
      q, dividee = dividee.divmod(10**t)
      if q == 1
        case t
        when 4 then reverse_array = true
        when 3 then command_array.unshift "jump"
        when 2 then command_array.unshift "close your eyes"
        when 1 then command_array.unshift "double blink"
        when 0 then command_array.unshift "wink"
        end
      end
    end
    command_array.reverse! if reverse_array
    command_array
  end
end
