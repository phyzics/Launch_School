# oo_twenty_one.rb
require 'YAML'

MESSAGES = YAML.load_file('oo_twenty_one.yml')

def prompt(msg)
  puts ">> #{msg}"
end

def clear
  system('clear' || 'cls')
end

def quit?(answer)
  answer == 'exit' || answer == 'quit'
end

def quit
  display_goodbye_message
  sleep 2
  clear
  exit
end

module Display
  def display_welcome_message
    puts(MESSAGES['welcome_title'].center(78))
    prompt(MESSAGES['rules'])
    quit if quit?(gets.chomp)
    clear
  end

  def display_rules
    clear
    puts(MESSAGES['rules_title'].center(78))
    prompt(MESSAGES['rules'])
    quit if quit?(gets.chomp)
    clear
    display_hands(true)
    puts ''
    prompt(MESSAGES['h_or_s'])
  end

  def display_hands(first_move=false)
    if first_move
      display_player_hand(true)
    else
      display_player_hand
    end
    puts ''
    display_dealer_hand
  end

  def display_player_hand(first_move=false)
    if first_move
      prompt(format(MESSAGES['hand'], name:  player.name,
                                      cards: build_full_hand_string))
    else
      prompt(format(MESSAGES['new_hand'], name: player.name,
                                          cards: build_full_hand_string))
    end

    prompt(format(MESSAGES['total'], total: player.total))
  end

  def display_dealer_hand
    prompt(format(MESSAGES['hand'], name:  dealer.name,
                                    cards: build_hidden_string))
  end

  def build_full_hand_string(participant=player)
    cards = participant.hand
    case cards.size
    when 2
      cards.join(MESSAGES['join1'])
    else
      cards = cards.map(&:to_s)
      cards[-1] = format(MESSAGES['join2'], last_card: cards[-1])
      cards.join(", ")
    end
  end

  def build_hidden_string
    format(MESSAGES['hidden_string'], visible_card: dealer.hand[0])
  end

  def display_winner(winner)
    puts ''
    case winner
    when @current_player
      prompt format(MESSAGES['wins'], player: @current_player.name)
    when @other_player
      prompt format(MESSAGES['wins'], player: @other_player.name)
    else
      prompt MESSAGES['draw']
    end
  end

  def display_results
    puts ''
    puts '======================='
      display_player_results
      display_dealer_results
    puts '======================='
  end

  def display_player_results
    prompt format(MESSAGES['hand_result'], name: player.name,
                                           hand: build_full_hand_string(player))
    prompt format(MESSAGES['total_result'], total: player.total)
  end

  def display_dealer_results
    prompt format(MESSAGES['hand_result'], name: dealer.name,
                                           hand: build_full_hand_string(dealer))
    prompt format(MESSAGES['total_result'], total: dealer.total)
  end

  def display_score
    puts ''
    prompt(if player.score > dealer.score
             someone_leading(player.name, player.score, dealer.name)
           elsif player.score < dealer.score
             someone_leading(dealer.name, dealer.score, player.name)
           else
             players_tied
           end)
  end

  def someone_leading(leader, leading_score, behind)
    format(MESSAGES['winning'], player: leader,
                                win_score: leading_score,
                                lose_score: behind)
  end

  def players_tied
    format(MESSAGES['tied'], player: player.name,
                             dealer: dealer.name,
                             score:  player.score)
  end

  def display_goodbye_message
    prompt(MESSAGES['goodbye'])
  end
end

class Participant
  attr_accessor :hand, :total, :name, :busted, :score

  def initialize
    @hand = []
    @total = 0
    @busted = false
    @score = 0
  end

  def calculate_total
    temp_total = hand.map(&:pt_value).reduce(:+)

    if temp_total > Game::POINT_LIMIT
      hand.select { |card| card.value == 'A' }.size.times do
        temp_total -= 10
      end
    end

    @total = temp_total
  end
end

class Player < Participant
  def set_name
    prompt(MESSAGES['enter_name'])
    prompt(MESSAGES['valid_name'])
    self.name = ''
    loop do
      self.name = gets.chomp.strip
      if name =~ /[^a-zA-Z\d'. ]/
        prompt(MESSAGES['invalid_name'])
      elsif name.empty?
        prompt(MESSAGES['empty_value'])
      else
        break
      end
    end
  end
end

class Dealer < Participant
  def set_name
    prompt(MESSAGES['opponent_name'])
    sleep 1
    self.name = %w[R2D2 Robo HAL C3PO Ada].sample
    puts ''
    prompt "#{name}!"
    sleep 1
  end
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    configure_deck
  end

  def configure_deck
    @cards = SUITS.product(VALUES).shuffle
    cards.map! { |card| Card.new(card[0], card[1]) }
  end

  def deal
    cards.pop
  end
end

class Card
  FACE_NAMES = {
    'A' => 'Ace',
    'J' => 'Jack',
    'Q' => 'Queen',
    'K' => 'King'
  }
  SUIT_NAMES = {
    'S' => 'Spades',
    'D' => 'Diamonds',
    'C' => 'Clubs',
    'H' => 'Hearts'
  }

  attr_accessor :pt_value
  attr_reader :value

  def initialize(suit, value)
    @suit = SUIT_NAMES[suit]
    @value = value
    @pt_value = calculate_point_value
  end

  def calculate_point_value
    if @value == 'A'
      11
    elsif @value.to_i == 0
      10
    else
      @value.to_i
    end
  end

  def to_s
    if FACE_NAMES[@value]
      "#{FACE_NAMES[@value]} of #{@suit}"
    else
      "#{@value} of #{@suit}"
    end
  end
end

class Game
  POINT_LIMIT = 21
  DEALER_LIMIT = 17

  include Display

  attr_accessor :deck, :player, :dealer # accessor, or reader?

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @current_player = player
    @other_player = dealer
  end

  def start
    set_up_game
    loop do
      set_up_round
      2.times do |turn|
        current_player_turn
        break if busted?
        switch_current_player if turn == 0
      end
      execute_end_of_round
      break unless play_again?
      reset_round
    end
    display_goodbye_message
  end

  def set_up_game
    clear
    display_welcome_message
    player.set_name
    dealer.set_name
  end

  def set_up_round
    clear
    deal_initial_cards
    calculate_totals
    display_hands(true)
  end

  def deal_initial_cards
    2.times { player.hand << deck.deal }
    2.times { dealer.hand << deck.deal }
  end

  def hit
    prompt(format(MESSAGES['hits'], player: @current_player.name))
    @current_player.hand << deck.deal
  end

  def stay
    prompt(format(MESSAGES['stays'], player: @current_player.name))
    sleep 1
  end

  def calculate_totals
    player.calculate_total
    dealer.calculate_total
  end

  def current_player_turn
    case @current_player
    when player then player_turn
    when dealer then dealer_turn
    end
  end

  def player_turn
    loop do
      puts ''
      prompt(MESSAGES['h_or_s'])
      choice = validate_choice

      if choice =~ /\A(s|stay)\z/
        stay
        break
      end

      hit
      player.calculate_total

      if busted?
        player.busted = true
        break
      end

      next_turn
    end
  end

  def next_turn
    sleep 1
    clear
    display_hands
  end

  def validate_choice
    answer = nil
    loop do
      answer = gets.chomp.strip.downcase
      return answer if answer =~ /\A(hit|h|stay|s)\z/
      quit if quit?(answer)

      if answer.empty?
        prompt(MESSAGES['empty_value'])
      elsif answer == 'help'
        display_rules
      else
        prompt(MESSAGES['invalid_choice'])
      end
    end
  end

  def busted?
    @current_player.total > POINT_LIMIT
  end

  def determine_winner
    if @current_player.busted
      @other_player
    elsif @current_player.total > @other_player.total
      @current_player
    elsif @current_player.total < @other_player.total
      @other_player
    end
  end

  def increment_scores(winner)
    case winner
    when @current_player then @current_player.score += 1
    when @other_player then @other_player.score += 1
    end
  end

  def dealer_turn
    loop do
      if dealer.total >= DEALER_LIMIT
        stay
        break
      end

      hit
      puts ''
      dealer.calculate_total
      sleep 1

      if busted?
        dealer.busted = true
        break
      end
    end
  end

  def switch_current_player
    puts ''
    prompt(format(MESSAGES['dealers_turn'], dealer: dealer.name))
    puts ''
    @current_player = dealer
    @other_player = player
    sleep 1
  end

  def execute_end_of_round
    winner = determine_winner
    increment_scores(winner)
    display_winner(winner)
    display_results
    display_score
  end

  def play_again?
    prompt(MESSAGES['play_again?'])
    answer = nil

    loop do
      answer = gets.chomp.downcase.strip
      break if answer =~ /\A(y|yes|n|no)\z/

      if answer.empty?
        prompt(MESSAGES['empty_value'])
      elsif quit?(answer)
        quit
      else
        prompt(MESSAGES['invalid_choice'])
      end
    end

    return true if answer =~ /\A(y|yes)\z/
    false
  end

  def reset_round
    reset_cards
    @current_player = player
    @other_player = dealer
    player.busted = false
    dealer.busted = false
  end

  def reset_cards
    player.hand.clear
    dealer.hand.clear
    deck.cards.clear

    deck.configure_deck
  end
end

Game.new.start
