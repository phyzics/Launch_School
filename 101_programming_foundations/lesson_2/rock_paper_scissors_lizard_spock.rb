VALID_CHOICES = %w(rock paper scissors lizard spock)

=begin
def win?(first, second)
  (first == 'rock' && second == 'scissors')   ||
    (first == 'paper' && second == 'rock')    ||
    (first == 'scissors' && second == 'paper')
end
=end

def prompt(message)
  puts "=> #{message}"
end

def win?(key, player1, player2)
  # convert string to symbol
  # look up values based upon symbol
  # if player 2 input is there, you win
  key[player1.to_sym].include?(player2)
end

def display_results(key, player, computer)
  if win?(key, player, computer)
    prompt('You won!')
  elsif win?(key, computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

# player makes a choice
# if value contained in key, player wins



victory_key = {rock: ['scissors', 'lizard'],
               paper: ['rock', 'spock'],
               scissors: ['paper', 'lizard'],
               lizard: ['paper', 'spock'],
               spock: ['rock', 'scissors']
              }


loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(victory_key, choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Good bye!')
