# med_109.rb - Deck of Cards
class Card
  VALUES = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  include Comparable

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = VALUES.fetch(rank, rank)
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = (2..10).to_a + %w[Jack Queen King Ace].freeze
  SUITS = %w[Hearts Clubs Diamonds Spades].freeze

  attr_reader :deck

  def initialize
    shuffle
  end

  def convert_cards
    deck.map! { |card| Card.new(card[0], card[1]) }
  end

  def draw
    shuffle if deck.empty?
    deck.pop
  end

  def shuffle
    @deck = RANKS.product(SUITS).shuffle
    convert_cards
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2
