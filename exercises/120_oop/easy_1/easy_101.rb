# easy_101.rb - Banner Class
class Banner
  def initialize(message, width=0)
    @message = message
    @banner_width = if @message.size > width
                      @message.size
                    else
                      width
                    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @banner_width}-+"
  end

  def empty_line
    "| #{' ' * @banner_width} |"
  end

  def message_line
    "| #{@message.center(@banner_width)} |"
  end
end

banner = Banner.new('Hello world', 5)
puts banner

=begin
utp:
- complete banner so test cases work correctly
- implementation cannot be public
- assume input fits terminal window
alg:
  - use size of message to expand 'empty line' so that it mactches message line
  - use @message_size to determine how many '-' are in horizontal lines
=end
