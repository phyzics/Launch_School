# med_110.rb - Poker!
require 'pry'
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

class PokerHand
  attr_reader :hand, :deck, :hand_ranks

  def initialize(deck)
    @deck = deck
    @hand = []
    draw_hand
    @hand_ranks = hand.map(&:rank)
  end

  def draw_hand
    5.times { hand << deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    return false if hand.map(&:suit).uniq.size != 1

    hand_ranks.all? {|card| ['Ace', 'King', 'Queen', 'Jack', 10].include?(card)}
  end

  def straight_flush?
    return false if hand.map(&:suit).uniq.size != 1

    hand_values = hand.map(&:value)
    value_min = hand_values.min
    value_max = hand_values.max

    sequence?(hand_values)
  end

  def four_of_a_kind?
    hand_ranks.each do |rank|
      return true if hand_ranks.count(rank) == 4
    end

    false
  end

  def full_house?
    pairs = []

    hand_ranks.each do |rank|
      return false if hand_ranks.uniq.size != 2

      if hand_ranks.count(rank) == 2 && pairs.count(rank) == 0
        pairs << rank
      end

      if hand_ranks.count(rank) == 3 && pairs.count(rank) == 0
        pairs << rank
      end
    end

    pairs.size == 2
  end

  def flush?
    return false if hand.map(&:suit).uniq.size != 1

    hand_values = hand.map(&:value)
    sequence?(hand_values) == false
  end

  def straight?
    return false if hand.map(&:suit).uniq.size == 1

    hand_values = hand.map(&:value)
    sequence?(hand_values)
  end

  def three_of_a_kind?
    hand_ranks.each do |rank|
      return true if hand_ranks.count(rank) == 3
    end

    false
  end

  def two_pair?
    pairs = []

    hand_ranks.each do |rank|
      if hand_ranks.count(rank) == 2 && pairs.count(rank) == 0
        pairs << rank
      end
    end

    pairs.size == 2
  end

  def pair?
    hand_ranks.each do |rank|
      return true if hand_ranks.count(rank) == 2
    end

    false
  end

  def sequence?(arr)
    sorted_arr = arr.sort
    selected_arr = sorted_arr.select.with_index do |c, i|
      if i == 4
        true
      else
        c + 1 == sorted_arr[i + 1]
      end
    end

    sorted_arr == selected_arr
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
