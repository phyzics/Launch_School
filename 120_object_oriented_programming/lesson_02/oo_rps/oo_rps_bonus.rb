# oo_rps.rb - Object Oriented Rock, Paper, Scisssors
require 'pry'

def prompt(msg)
  puts ">>#{msg}"
end

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  WINNING_MOVES = {
    'rock' => %w(scissors lizard),
    'paper' => %w(rock spock),
    'scissors' => %w(paper lizard),
    'lizard' => %w(paper spock),
    'spock' => %w(rock scissors)
    }
  LOSING_MOVES = {
    'rock' => %w(spock paper),
    'paper' => %w(scissors lizard),
    'scissors' => %w(rock spock),
    'lizard' => %w(scissors rock),
    'spock' => %w(paper lizard)
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
#~~~~~~~~~~~~~~~~~~~~~~~~#
# Player with subclasses #
#~~~~~~~~~~~~~~~~~~~~~~~~#
class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    self.history = []
  end

  def reset_score
    self.score = 0
  end

  def verify_choice(options)
    choice = nil
    loop do
      choice = gets.chomp.strip.downcase
      if options.include?(choice)
        return choice
      elsif choice == 'exit'
        exit # MAKE A TRUE EXIT FUNCTION
      elsif choice == 'rules'
        # MAKE A DISPLAY RULES FUNCTION
      elsif choice.empty?
        prompt("You must enter a value and then press [Enter].")
      else
        prompt("Please make a valid selection and then press [Enter].")
      end
    end
  end

  def display_history
    history.each_with_index do |m, i|
      puts "In round #{i + 1}, #{name} chose #{m}."
    end
  end
end

class Human < Player
  VALID_CHOICES = { 'r'  => 'rock',
                    'p'  => 'paper',
                    'sc' => 'scissors',
                    'l'  => 'lizard',
                    'sp' => 'spock'
                  }

  def set_name
    n = ''
    puts "What's your name?"
    loop do
      n = gets.chomp
      break unless n.strip.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
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
    OPPONENTS.each_with_index do |n, i|
      puts("#{i+1}) #{n}".ljust(50))
    end
  end

  def select_opponent
    display_opponents
    verify_choice(%w(1 2 3 4 5))
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
    if short_circut?
      choice = Move::WINNING_MOVES[human_choice].sample
      self.move = Move.new(choice)
    else
      choice = Move::VALUES.sample
      self.move = Move.new(choice)
    end
  end

  def robo_choices
    choice = Move::VALUES.sample
    self.move = Move.new(choice)
  end

  def hal_choices(previous_losses)
    bad_moves = scan_losing_moves(previous_losses)
    choice = if bad_moves
               (Move::VALUES - [bad_moves]).sample
               #binding.pry
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
    return true if (90..100).include?(roll)
    false
  end

  def scan_losing_moves(previous_losses)
    binding.pry
    #return nil if previous_losses.empty?
    Move::VALUES.each do |val|
      return val if previous_losses.count(val) == 2
    end
    nil
  end
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Game Orchestration Engine #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def determine_moves
    human.choose

    if computer.name == 'W.D. Gaster' || computer.name == 'Johnny Number 5'
      computer.choose(human.move.value)
    else
      computer.choose
    end
  end

  def record_history
    human.history << human.move
    computer.history << computer.move
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
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
    when :human then puts "#{human.name} won!"
    when :computer then puts "#{computer.name} won!"
    when :tie then puts "It's a tie!"
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

  def display_scores
    puts "The current score is:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be 'y' or 'n'."
    end

    return true if answer.downcase == 'y'
    false
  end

  def reset_scores
    human.reset_score
    computer.reset_score
  end

  def play
    display_welcome_message
    loop do
      reset_scores
      loop do
        determine_moves
        record_history
        display_moves
        determine_winner
        display_scores
        break if human.score == 3 || computer.score == 3
      end
      break unless play_again?
    end
    display_goodbye_message
    human.display_history
    puts ''
    computer.display_history
  end
end

RPSGame.new.play
