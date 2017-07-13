#twenty_one.rb
require 'pry'
require 'YAML'

MESSAGES = YAML.load_file('twenty_one.yml')

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

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def display_rules
  answer = ''
  system 'clear' || 'cls'
  puts MESSAGES['rules_title'].center(80)
  prompt(MESSAGES['rules'])
  answer = gets.chomp
  system 'clear' || 'cls'
end

def play_again?
  answer = ''
  puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  loop do
    prompt(MESSAGES['another_round'])
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt(MESSAGES['invalid_choice'])
  end
  answer
end

def busted?(hand)
  calculate_total(hand) > 21
end

def calculate_total(hand)
  values = hand.map { |card| card[1] }

  hand_total = 0
  values.each do |card|
    if card == 'A'
      hand_total += 11
    elsif card.to_i == 0
      hand_total += 10
    else
      hand_total += card.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    hand_total -=10 if hand_total > 21
  end

  hand_total
end

def determine_victor(player, dealer)
  player_total = calculate_total(player)
  dealer_total = calculate_total(dealer)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_victor(player, dealer)
  result = determine_victor(player, dealer)

  case result
  when :player_busted
    prompt("Uh oh, looks like you've busted! The Dealer wins!")
  when :dealer_busted
    prompt("The Dealer busted! You win!")
  when :player
    prompt("Congratulations, you've won this round!")
  when :dealer
    prompt("Oh no! It seems the Dealer has won this round...")
  when :tie
    prompt("You and the Dealer tied this round...")
  end
end

def display_hand(player, hand) #figure out a better name -- this doesn't actually display
  display_array = hand.map do |card|
  	if card[1].to_i.to_s == card[1]
  	  "#{card[1]} of #{SUIT_NAMES[card[0]]}"
  	else
  	  "#{FACE_NAMES[card[1]]} of #{SUIT_NAMES[card[0]]}"
  	end
  end

  display_string = join_array(display_array)
  display_string = "#{player} has #{display_string}"
end

def dealer_hand(hand)
  display_array = hand.map do |card|
  	if card[1].to_i.to_s == card[1]
  	  "#{card[1]} of #{SUIT_NAMES[card[0]]}"
  	else
  	  "#{FACE_NAMES[card[1]]} of #{SUIT_NAMES[card[0]]}"
  	end
  end

  display_string = join_array_computer(display_array)
  display_string = "Dealer has #{display_string}"
end

def join_array(arr)
  case arr.size
  when 2
    arr.join(" and ")
  else
    arr[-1] = "and #{arr[-1]}"
    arr.join(", ")
  end
end

def join_array_computer(arr)
  display_string = arr[0] + " and another card."
end

loop do
  deck = initialize_deck
  players_hand = []
  dealers_hand = []

  2.times { players_hand << deck.pop }
  2.times { dealers_hand << deck.pop }

  prompt(display_hand("Player", players_hand))
  prompt(MESSAGES['totals_to'] + " #{calculate_total(players_hand)}")
  prompt(dealer_hand(dealers_hand))

  answer = nil
  loop do
    puts ''
    prompt('Hit or Stay?')
    answer = gets.chomp.downcase

    case answer
    when 'hit'
      players_hand << deck.pop
      prompt("Now #{display_hand("Player", players_hand)}")
      prompt(MESSAGES['totals_to'] + " #{calculate_total(players_hand)}")
    when 'stay'
      break
    when 'help'
      display_rules
    else
      prompt("Please enter either 'Hit' or 'Stay'")
    end

    break if busted?(players_hand)
  end

  if busted?(players_hand)
    display_victor(players_hand, dealers_hand)
    play_again? ? next : break
  else
    prompt("You chose to stay!")
  end
  sleep 1
  puts ''
  prompt("Now it's the Dealer's turn...")
  sleep 1
  puts ''

  loop do
    break if calculate_total(dealers_hand) >= 17
    prompt("Dealer hits!")
    dealers_hand << deck.pop
    sleep 1
  end

  prompt("Dealer stays.") if busted?(dealers_hand) == false
  sleep 1

  display_victor(players_hand, dealers_hand)
  puts ''
  puts "======================="
  prompt("#{display_hand('Player', players_hand)}")
  prompt("#{display_hand('Dealer', dealers_hand)}")
  puts "======================="
  puts ''

  rematch = play_again?
  break if rematch == 'n'
end
prompt(MESSAGES['good_bye'])
