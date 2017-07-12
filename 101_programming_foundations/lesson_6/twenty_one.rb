#twenty_one.rb
require 'pry'

FACE_NAMES = {
  'A' => 'Ace',
  'J' => 'Jack',
  'Q' => 'Queen',
  'K' => 'King'
}

SUITS = {
  'S' => 'Spades',
  'D' => 'Diamonds',
  'C' => 'Clubs',
  'H' => 'Hearts'
}

def prompt(msg)
  puts "=> #{msg}"
end

def busted?(hand)
  if calculate_total(hand) > 21
    return true
  else
    return false
  end
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
  #binding.pry
end

def decide_victor(player1, player2)
  return :player1 if player1 > player2
  return :player2 if player2 > player1
  return :tie if player1 == player2
end

def display_hand(player, hand)
  display_array = hand.map do |card|
  	if card[1].to_i.to_s == card[1]
  	  "#{card[1]} of #{SUITS[card[0]]}"
  	else
  	  "#{FACE_NAMES[card[1]]} of #{SUITS[card[0]]}"
  	end
  end
  display_string = join_array(display_array)
  display_string = "#{player} has #{display_string}"
  #binding.pry
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

loop do
  deck = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'],
          ['H', '8'], ['H', '9'], ['H', '10'],['H', 'J'], ['H', 'Q'], ['H', 'K'],
          ['H', 'A'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'],
          ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'],['D', 'J'], ['D', 'Q'],
          ['D', 'K'], ['D', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'],
          ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'],['S', 'J'],
          ['S', 'Q'], ['S', 'K'], ['S', 'A'], ['C', '2'], ['C', '3'], ['C', '4'],
          ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'],
          ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']]

  players_hand = []
  dealers_hand = []

  2.times { players_hand << deck.sample }
  2.times { dealers_hand << deck.sample }

  prompt(display_hand("Player", players_hand))
  prompt(display_hand("Dealer", dealers_hand))
  calculate_total(players_hand)

  answer = nil
  loop do
    puts ""
    prompt('Hit or Stay?')
    answer = gets.chomp.downcase

    case answer
    when 'hit'
      players_hand << deck.sample
      prompt(display_hand("Player", players_hand))
    when 'stay'
      break
    else
      prompt("Please select either 'Hit' or 'Stay'")
    end

    break if busted?(players_hand)

  end

  if busted?(players_hand)
    prompt ("Busted!")# play again?
    break
  else
    prompt("You chose to stay!")
  end

  loop do
    if calculate_total(dealers_hand) < 17
      prompt("Dealer hits!")
      dealers_hand << deck.sample
    elsif calculate_total(dealers_hand) >= 17
      prompt("Dealer stays!")
      break
    end

    break if busted?(dealers_hand)
  end

  if busted?(dealers_hand)
    prompt("The dealer busted! Congratulations, you've won!")
  else
    case decide_victor(calculate_total(players_hand),
                       calculate_total(dealers_hand))
    when :player1
      prompt("Congratulations, you've won!")
    when :player2
      prompt("Oh, no! The Dealer has won this round...")
    when :tie
      prompt("It seems you and the Dealer tied this round...")
    end
  end

  prompt("Would you like to play again? (Y/N)")
  rematch = ''
  loop do
    rematch = gets.chomp.downcase
    if rematch == 'y'
      break
    elsif rematch == 'n'
      break
    else
      prompt("Please enter 'Y' or 'N'.")
    end
  end
  break if rematch == 'n'
end
