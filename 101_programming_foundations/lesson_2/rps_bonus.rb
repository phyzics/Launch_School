# rps_bonus.rb

require 'yaml'
MESSAGES = YAML.load_file('rps_bonus.yml')

VALID_CHOICES = { 'r'  => 'rock',
                  'p'  => 'paper',
                  'sc' => 'scissors',
                  'l'  => 'lizard',
                  'sp' => 'spock' }

VICTORY_KEY = { 'rock' => %w(scissors lizard),
                'paper' => %w(rock spock),
                'scissors' => %w(paper lizard),
                'lizard' => %w(paper spock),
                'spock' => %w(rock scissors) }

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  if VICTORY_KEY[player1].include?(player2)
    :player
  elsif VICTORY_KEY[player2].include?(player1)
    :computer
  else
    :tie
  end
end

def clear_screen
  system('clear') || system('cls')
end

def display_choices
  puts ''
  VALID_CHOICES.each_pair { |k, v| puts "#{v} = #{k}" }
  puts ''
end

clear_screen

player_score = 0
computer_score = 0

puts(MESSAGES['welcome_title'].center(80))
prompt(MESSAGES['welcome'])
puts ''
prompt(MESSAGES['instructions'])
display_choices

loop do
  round = 0
  until player_score == 5 || computer_score == 5
    prompt(MESSAGES['choose_move'])
    choice = ''
    round += 1
    loop do
      choice = gets.chomp.downcase

      if VALID_CHOICES.key?(choice) || VALID_CHOICES.value?(choice)
        choice = VALID_CHOICES[choice] if VALID_CHOICES.key?(choice)
        break
      elsif choice == 'help'
        display_choices
      elsif choice == 'exit'
        prompt(MESSAGES['good_bye'])
        exit
      else
        prompt(MESSAGES['invalid_choice'])
      end
    end

    clear_screen

    computer_choice = VALID_CHOICES.values.sample
    puts format(MESSAGES['round_complete'].center(60), round_number: round.to_s)
    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    case win?(choice, computer_choice)
    when :player
      puts(MESSAGES['trumps'][[choice, computer_choice]].center(45))
      prompt('You won!')
      player_score += 1
    when :computer
      puts(MESSAGES['trumps'][[computer_choice, choice]].center(45))
      prompt('Computer won!')
      computer_score += 1
    else
      prompt("It's a tie!")
    end

    puts format(MESSAGES['current_score'], player_score: player_score.to_s,
                                           computer_score: computer_score.to_s)
    puts ''
  end

  if player_score == 5
    puts MESSAGES['victory'].center(50)
  else
    puts MESSAGES['defeat'].center(50)
  end
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".center(50)
  puts ''

  prompt(MESSAGES['new_set?'])
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
      prompt(MESSAGES['y_or_n'])
    end
  end

  break unless new_set.downcase == 'y'
end
prompt(MESSAGES['good_bye'])
