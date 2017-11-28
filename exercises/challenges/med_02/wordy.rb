# wordy.rb
class WordProblem
  OPERATION_KEY = {
    'plus' => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/'
  }

  def initialize(string)
    @word_problem = string.slice(8..-2).split
    word_problem.delete('by')
    format_problem
  end

  def answer
    raise ArgumentError if word_problem.include?(nil)
    operation_arr = word_problem.clone
    value = operation_arr.shift
    until operation_arr.empty?
      value = value.send("#{operation_arr[0]}",operation_arr[1])
      2.times { operation_arr.shift }
    end
    value
  end

  def format_problem
    word_problem.map! do |c|
      if c.to_i.to_s == c
        c.to_i
      else
        OPERATION_KEY[c]
      end
    end
  end

  protected

  attr_reader :word_problem
end
