#twenty_one.rb



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

p players_hand

answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?
end

if busted?
  # play again?
else
  puts "You chose to stay!"
end
