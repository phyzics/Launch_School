# twenty_one.rb
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
POINT_LIMIT = 21
DEALER_LIMIT = 17
CHAMPION_LIMIT = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def display_rules(title)
  system 'clear' || 'cls'
  puts MESSAGES[title].center(80)
  prompt format(MESSAGES['rules'], rounds: CHAMPION_LIMIT)
  gets.chomp
  system 'clear' || 'cls'
end

def play_again?
  answer = ''
  puts ''
  puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  loop do
    prompt(MESSAGES['another_round'])
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt(MESSAGES['invalid_choice'])
  end
  return true if answer == 'y'
  if answer == 'n'
    prompt(MESSAGES['good_bye'])
    exit
  end
end

def busted?(hand)
  hand > POINT_LIMIT
end

def calculate_total(hand)
  values = hand.map { |card| card[1] }

  hand_total = 0
  values.each do |card|
    hand_total += if card == 'A'
                    11
                  elsif card.to_i == 0
                    10
                  else
                    card.to_i
                  end
  end

  values.select { |value| value == 'A' }.count.times do
    hand_total -= 10 if hand_total > POINT_LIMIT
  end

  hand_total
end

def determine_victor(player, dealer)
  if player > POINT_LIMIT
    :player_busted
  elsif dealer > POINT_LIMIT
    :dealer_busted
  elsif player > dealer
    :player
  elsif player < dealer
    :dealer
  else
    :tie
  end
end

def display_victor(player, dealer)
  result = determine_victor(player, dealer)

  case result
  when :player_busted
    prompt(MESSAGES['player_busted'])
  when :dealer_busted
    prompt(MESSAGES['dealer_busted'])
  when :player
    prompt(MESSAGES['player_wins'])
  when :dealer
    prompt(MESSAGES['dealer_wins'])
  when :tie
    prompt(MESSAGES['match_tie'])
  end
end

def contents_of_hand(player, hand)
  display_array = hand.map do |card|
    if card[1].to_i.to_s == card[1]
      "#{card[1]} of #{SUIT_NAMES[card[0]]}"
    else
      "#{FACE_NAMES[card[1]]} of #{SUIT_NAMES[card[0]]}"
    end
  end

  if player == 'Player' || player == 'Dealer'
    display_string = join_array(display_array)
    "#{player} has #{display_string}."
  else
    display_string = join_array_computer(display_array)
    "#{MESSAGES['dealer_has']} #{display_string}"
  end

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
  arr[0] + " #{MESSAGES['another_card']}"
end

def display_hands(player_hand, player_total, dealer_hand, dealer_total)
  puts ''
  puts '======================='
  prompt(contents_of_hand('Player', player_hand))
  prompt(MESSAGES['totals_to'] + " #{player_total}")
  prompt(contents_of_hand('Dealer', dealer_hand))
  prompt(MESSAGES['totals_to'] + " #{dealer_total}")
  puts '======================='
  puts ''
end

def display_score(player_score, dealer_score)
  if player_score > dealer_score
    prompt format(MESSAGES['player_leads'],
                  p_score: player_score, d_score: dealer_score)
  elsif player_score < dealer_score
    prompt format(MESSAGES['dealer_leads'],
                  d_score: dealer_score, p_score: player_score)
  else
    prompt format(MESSAGES['currently_tied'], p_score: player_score)
  end
end

def end_of_round_output(player_total, dealer_total, player_hand, dealer_hand,
                        player_score, dealer_score)
  display_victor(player_total, dealer_total)
  display_hands(player_hand, player_total, dealer_hand, dealer_total)
  display_score(player_score, dealer_score)
end

def display_champion(player_score, dealer_score)
  puts ''
  if player_score >= 5
    prompt(MESSAGES['player_gc'])
  elsif dealer_score >= 5
    prompt(MESSAGES['dealer_gc'])
  end
end

display_rules('welcome_title')

loop do
  player_score = 0
  dealer_score = 0

  loop do
    system 'clear' || 'cls'
    deck = initialize_deck
    player_hand = []
    dealer_hand = []

    2.times { player_hand << deck.pop }
    2.times { dealer_hand << deck.pop }

    player_total = calculate_total(player_hand)
    dealer_total = calculate_total(dealer_hand)

    prompt(contents_of_hand('Player', player_hand))
    prompt(MESSAGES['totals_to'] + " #{player_total}")
    puts ''
    prompt(contents_of_hand('', dealer_hand))

    answer = nil
    loop do
      puts ''
      prompt(MESSAGES['hit_or_stay'])
      answer = gets.chomp.downcase

      case answer
      when 'hit'
        player_hand << deck.pop
        player_total = calculate_total(player_hand)
        puts ''
        prompt("Now #{contents_of_hand('Player', player_hand)}")
        prompt(MESSAGES['totals_to'] + " #{player_total}")
      when 'stay'
        puts ''
        break
      when 'help'
        display_rules('rules_title')
      when 'exit'
        prompt(MESSAGES['good_bye'])
        exit
      else
        prompt(MESSAGES['only_hit_or_stay'])
      end

      break if busted?(player_total)
    end

    if busted?(player_total)
      dealer_score += 1
      end_of_round_output(player_total, dealer_total, player_hand, dealer_hand,
                          player_score, dealer_score)
      break if dealer_score == 5
      next if play_again?
    else
      prompt(MESSAGES['you_stay'])
    end
    sleep 1
    puts ''
    prompt(MESSAGES['dealers_turn'])
    sleep 1
    puts ''

    loop do
      break if calculate_total(dealer_hand) >= DEALER_LIMIT
      prompt(MESSAGES['dealer_hits'])
      dealer_hand << deck.pop
      dealer_total = calculate_total(dealer_hand)
      sleep 1
    end

    if busted?(dealer_total)
      player_score += 1
      end_of_round_output(player_total, dealer_total, player_hand, dealer_hand,
                          player_score, dealer_score)
      break if player_score == 5
      next if play_again?
    else
      prompt(MESSAGES['dealer_stays'])
      sleep 1
    end

    prompt(MESSAGES['show_hands'])
    sleep 1

    winner = determine_victor(player_total, dealer_total)
    case winner
    when :player
      player_score += 1
    when :dealer
      dealer_score += 1
    end
    end_of_round_output(player_total, dealer_total, player_hand, dealer_hand,
                        player_score, dealer_score)

    if player_score == CHAMPION_LIMIT || dealer_score == CHAMPION_LIMIT
      break
    else
      play_again?
    end
  end
  display_champion(player_score, dealer_score)
  play_again?
end
