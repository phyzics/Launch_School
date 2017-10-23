# easy_201.rb - Odd Words and the How to Work with a Code Challenge

class OddWords

  attr_reader :words

  def initialize(string)
    raise StandardError, "string cannot be empty" if string.strip.empty?
    @words = string.split
  end

  def odd_print
    words.map.with_index do |c, i|
      if words.last == c && i.odd?
        period = c.slice!(-1)
        c.reverse + period
      elsif i.odd?
        c.reverse
      else
        c
      end
    end.join(' ').gsub(/\s\./, '.')
  end
end

p OddWords.new("whats the matter with kansas.").odd_print
