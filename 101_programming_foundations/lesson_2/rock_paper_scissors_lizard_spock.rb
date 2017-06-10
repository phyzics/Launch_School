VALID_CHOICES = {'r'  => 'rock',
                 'p'  => 'paper',
                 'sc' => 'scissors',
                 'l'  => 'lizard',
                 'sp' => 'spock'
                }

VICTORY_KEY = {rock: ['scissors', 'lizard'],
               paper: ['rock', 'spock'],
               scissors: ['paper', 'lizard'],
               lizard: ['paper', 'spock'],
               spock: ['rock', 'scissors']
              }

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  VICTORY_KEY[player1.to_sym].include?(player2)
end

def display_results(player1, player2)
  if win?(player1, player2)
    prompt('You won!')
    return 'player'
  elsif win?(player2, player1)
    prompt('Computer won!')
    return 'computer'
  else
    prompt("It's a tie!")
  end
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

player_score = 0
computer_score = 0

loop do
  until player_score == 5 || computer_score == 5 do
    choice = ''
    loop do
      prompt("Choose one: ")
      choice = gets.chomp.downcase

      if VALID_CHOICES.has_key?(choice) || VALID_CHOICES.has_value?(choice)
        choice = VALID_CHOICES[choice] if VALID_CHOICES.has_key?(choice)
        break
        # add a 'see options' prompt
      elsif choice == 'exit'
        prompt("Thanks for playing. Good bye!")
        exit
      else
        prompt("That's not a valid choice.")
      end
    end

    clear_screen

    computer_choice = VALID_CHOICES.values.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    perform_round = display_results(choice, computer_choice)

    player_score += 1 if perform_round == 'player'
    computer_score += 1 if perform_round == 'computer'

    puts player_score
    puts computer_score
  end

  if player_score == 5
    puts "Congratulations! You are the GRAND CHAMPION!"
    puts "----------------------------------".center(44)
  else
    puts "Oh no! The Computer is the GRAND CHAMPION!".center(40)
    puts "----------------------------------"
  end

  prompt("Would you like to play another set? (Enter 'y' or 'n')")
  new_set = ''
  loop do
    new_set = gets.chomp.downcase
    if new_set.downcase == 'y'
      player_score = 0
      computer_score = 0
      break
    elsif new_set.downcase == 'n'
      break
    else
      prompt("Please enter either 'y' or 'n'.")
    end
  end

  break unless new_set.downcase == 'y'
end
prompt('Thanks for playing. Good bye!')
