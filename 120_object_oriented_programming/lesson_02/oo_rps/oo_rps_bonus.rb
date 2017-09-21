# oo_rps.rb - Object Oriented Rock, Paper, Scisssors
require 'pry'

module Display
  def prompt(msg)
    puts ">> #{msg}"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_goodbye_message
    prompt("Thanks for playing Rock, Paper, Scissors! Below is the history of all moves made between you and your opponent.")
    prompt("When you are ready to return to the command line, press [Enter].")
    puts "*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*"
    display_game_history
    press_enter
    exit
  end

  def display_welcome_message
    clear_screen
    prompt('~*~ Welcome to Rock, Paper, Scissors, Lizard, Spock! ~*~')
    puts ''
  end

  def display_moves
    prompt("#{human.name} chose #{human.move}.")
    prompt("#{computer.name} chose #{computer.move}.")
  end

  def display_game_history
    puts ''
    human.display_history
    puts ''
    computer.display_history
  end

  def display_scores
    puts "--------------------"
    prompt("The current score is:")
    prompt("#{human.name}: #{human.score}")
    prompt("#{computer.name}: #{computer.score}")
    puts "--------------------"
  end

  def display_history
    history.each_with_index do |m, i|
      puts "In round #{i + 1}, #{name} chose #{m}."
    end
  end

  def end_of_round_prompt
    if human.score == 3
      prompt("Congratulations, you've achieved total victory! (Press [Enter] to continue)")
    elsif computer.score == 3
      prompt("Oh no, you've suffered a humiliating defeat! (Press [Enter] to continue)")
    else
      prompt("Press [Enter] when you are ready for the next round.")
    end
  end
end

module GameFlow
  def verify_choice(options)
    choice = nil
    loop do
      choice = gets.chomp.strip.downcase
      if options.include?(choice)
        return choice
      elsif choice == 'exit'
        quit
      elsif choice.empty?
        prompt("You must enter a value and then press [Enter].")
      else
        prompt("Please make a valid selection and then press [Enter].")
      end
    end
  end

  def press_enter
    gets
    clear_screen
  end
end

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  WINNING_MOVES = {
    'rock'     => %w[scissors lizard],
    'paper'    => %w[rock spock],
    'scissors' => %w[paper lizard],
    'lizard'   => %w[paper spock],
    'spock'    => %w[rock scissors]
  }
  LOSING_MOVES = {
    'rock'     => %w[spock paper],
    'paper'    => %w[scissors lizard],
    'scissors' => %w[rock spock],
    'lizard'   => %w[scissors rock],
    'spock'    => %w[paper lizard]
  }

  def initialize(choice)
    self.value = choice
  end

  def >(other_move)
    WINNING_MOVES[value].include?(other_move.value)
  end

  def <(other_move)
    WINNING_MOVES[other_move.value].include?(value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :history
  include Display
  include GameFlow

  def initialize
    set_name
    self.history = []
  end

  def reset_score
    self.score = 0
  end

  def quit
    display_goodbye_message
    exit
  end
end

class Human < Player
  VALID_MOVES = {
    'r'  => 'rock',
    'p'  => 'paper',
    'sc' => 'scissors',
    'l'  => 'lizard',
    'sp' => 'spock'
  }

  def set_name
    clear_screen
    n = ''
    prompt("What's your name?")
    loop do
      n = gets.chomp
      if n =~ /[^a-z ']/i
        prompt("Please enter a valid name and press [Enter].")
      elsif n.strip.empty?
        prompt("Please enter a value and press [Enter].")
      else
        break
      end
    end
    self.name = n
  end

  def create_options_str
    final_str = ''
    VALID_MOVES.each_pair { |k, v| final_str += "#{v} = #{k}, " }
    final_str.slice!(-2..-1)
    final_str
  end

  def choose
    prompt("Please use the keywords to select your move:")
    prompt(create_options_str)
    choice = VALID_MOVES[verify_choice(%w[r p sc l sp])]
    self.move = Move.new(choice)
  end
end

class Computer < Player
  attr_accessor :previous_losses
  OPPONENTS = ['R2D2', 'Johnny Number 5', 'Robo', 'HAL', 'W.D. Gaster']

  def initialize
    super
    self.previous_losses = []
  end

  def set_name
    opponent = select_opponent

    case opponent
    when '1' then self.name = 'R2D2'
    when '2' then self.name = 'Johnny Number 5'
    when '3' then self.name = 'Robo'
    when '4' then self.name = 'HAL'
    when '5' then self.name = 'W.D. Gaster'
    end
  end

  def display_opponents
    puts ''
    prompt("Please use the corresponding digit to select your opponent:")
    puts ''
    OPPONENTS.each_with_index do |n, i|
      puts("          #{i + 1}) #{n}")
    end
  end

  def select_opponent
    display_opponents
    verify_choice(%w[1 2 3 4 5])
  end

  def choose(human_choice=nil)
    case name
    when 'R2D2'            then r2d2_choices
    when 'Johnny Number 5' then jn5_choices(human_choice)
    when 'Robo'            then robo_choices
    when 'HAL'             then hal_choices(previous_losses)
    when 'W.D. Gaster'     then gaster_choices(human_choice)
    end
  end

  def r2d2_choices
    choice = 'rock'
    self.move = Move.new(choice)
  end

  def jn5_choices(human_choice)
    choice = if short_circut?
               Move::WINNING_MOVES[human_choice].sample
             else
               Move::VALUES.sample
             end
    self.move = Move.new(choice)
  end

  def robo_choices
    choice = Move::VALUES.sample
    self.move = Move.new(choice)
  end

  def hal_choices(previous_losses)
    bad_moves = scan_losing_moves(previous_losses)
    choice = if bad_moves
               (Move::VALUES - [bad_moves]).sample
             else
               Move::VALUES.sample
             end
    self.move = Move.new(choice)
  end

  def gaster_choices(human_choice)
    choice = Move::LOSING_MOVES[human_choice].sample
    self.move = Move.new(choice)
  end

  def short_circut?
    roll = rand(1..100)
    return true if (90..100).cover?(roll)
    false
  end

  def scan_losing_moves(previous_losses)
    Move::VALUES.each do |val|
      return val if previous_losses.count(val) == 2
    end
    nil
  end
end

# Game Orchestration Engine #
class RPSGame
  attr_accessor :human, :computer
  include Display
  include GameFlow

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def determine_moves
    human.choose

    if computer.name == 'W.D. Gaster' || computer.name == 'Johnny Number 5'
      computer.choose(human.move.value)
    else
      computer.choose
    end

    clear_screen
  end

  def record_history
    human.history << human.move
    computer.history << computer.move
  end

  def determine_winner
    if human.move > computer.move
      iterate_scores(:human)
      iterate_cpu_losses
      display_winner(:human)
    elsif human.move < computer.move
      iterate_scores(:computer)
      display_winner(:computer)
    else
      display_winner(:tie)
    end
  end

  def display_winner(victor)
    case victor
    when :human then prompt("#{human.name} won!")
    when :computer then prompt("#{computer.name} won!")
    when :tie then prompt("It's a tie!")
    end
  end

  def iterate_scores(victor)
    case victor
    when :human then human.score += 1
    when :computer then computer.score += 1
    end
  end

  def iterate_cpu_losses
    computer.previous_losses << computer.move.value
  end

  def play_again?
    answer = nil
    prompt("Would you like to play another match? (Enter 'y or 'n')")
    verify_choice(%w[y yes n no])
    clear_screen
    return true if answer == 'y' || answer == 'yes'
    false
  end

  def reset_match
    reset_scores
    computer.previous_losses.clear
  end

  def reset_scores
    human.reset_score
    computer.reset_score
  end

  def play_round
    determine_moves
    record_history
    display_moves
    determine_winner
    display_scores
    end_of_round_prompt
    press_enter
  end

  def play_match
    display_welcome_message
    loop do
      reset_match
      loop do
        play_round
        break if human.score == 3 || computer.score == 3
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play_match
