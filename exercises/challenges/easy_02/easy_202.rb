# easy_202.rb - Scrabble Score

class Scrabble
  SCORE_KEY = {
    %w(A E I O U L N R S T) => 1,
    %w(D G)                 => 2,
    %w(B C M P)             => 3,
    %w(F H V W Y)           => 4,
    %w(K)                   => 5,
    %w(J X)                 => 8,
    %w(Q Z)                 => 10
  }

  attr_reader :word

  def self.score(string)
    self.new(string).score
  end

  def initialize(string)
    @word = string
  end

  def score
    return 0 if  word.nil? || word.empty? || word.match?(/\s+/)

    points = 0
    word.each_char { |c| SCORE_KEY.each_pair { |k, v| points += v if k.include?(c.upcase) } }
    points
  end
end
