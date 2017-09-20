# oo_rps.rb - Object Oriented Rock, Paper, Scisssors
require 'pry'

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  WINNING_MOVES = { 'rock' => %w(scissors lizard),
                  'paper' => %w(rock spock),
                  'scissors' => %w(paper lizard),
                  'lizard' => %w(paper spock),
                  'spock' => %w(rock scissors)
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

class History
  attr_accessor :hu_name, :cpu_name, :hu_moves, :cpu_moves, :cpu_bad_moves

  LOSING_MOVES = { 'rock' => %w(spock paper),
                  'paper' => %w(scissors lizard),
                  'scissors' => %w(rock spock),
                  'lizard' => %w(scissors rock),
                  'spock' => %w(paper lizard)
                }

  def initialize(human, computer)
    self.hu_name = human
    self.cpu_name = computer
    self.hu_moves, self.cpu_moves = [], []
    self.cpu_bad_moves = []
  end

  def display_history
    self.hu_moves.each_with_index do |m, i|
      puts "In round #{i + 1}, #{hu_name} chose #{m}."
    end

    puts ''

    self.cpu_moves.each_with_index do |m, i|
      puts "In round #{i + 1}, #{cpu_name} chose #{m}."
    end
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~#
# Player with subclasses #
#~~~~~~~~~~~~~~~~~~~~~~~~#
class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
  end

  def reset_score
    self.score = 0
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
  def set_name
    self.name = Hal.new

    #[R2D2.new, NumberFive.new, Robo.new, Hal.new, Gaster.new].sample
  end

  def choose
    choice = Move::VALUES.sample
    self.move = Move.new(choice)
  end
end
#~~~~~~~~~~~~~~~~~~~~~#
# Computer subclasses #
#~~~~~~~~~~~~~~~~~~~~~#
class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    choice = 'rock'
    self.move = Move.new(choice)
  end
end

class NumberFive < Computer
  def set_name
    self.name = 'Johnny Number 5'
  end

  def short_circut?
    roll = rand(1..100)
    return true if (90..100).include?(roll)
    false
  end

  def choose(human_choice)
    if short_circut?
      choice = Move::WINNING_MOVES[human_choice].sample
      self.move = Move.new(choice)
    else
      choice = Move::VALUES.sample
      self.move = Move.new(choice)
    end
  end
end

class Robo < Computer
  def set_name
    self.name = 'Robo'
  end
end

class Hal < Computer
  def set_name
    self.name = 'HAL'
  end

  def choose(history)
    bad_moves = scan_losing_moves(history)
    if bad_moves
      choice = (Move::VALUES - [bad_moves]).sample
    else
      choice = Move::VALUES.sample
    end
    self.move = Move.new(choice)
  end

  def scan_losing_moves(history)
    moves = history.cpu_bad_moves
    Move::VALUES.each do |val|
      return val if moves.count(val) == 2
    end
    nil
  end
end

class Gaster < Computer
  def set_name
    self.name = 'W.D. Gaster'
  end

  def choose(human_choice)
    choice = History::LOSING_MOVES[human_choice].sample
    self.move = Move.new(choice)
  end
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Game Orchestration Engine #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new.set_name
    @history = History.new(human.name, computer.name)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def determine_moves
    history.hu_moves << human.choose

    history.cpu_moves << if computer.name == 'W.D. Gaster' ||
                            computer.name == 'Johnny Number 5'
                              computer.choose(human.move.value)
                         elsif computer.name == 'HAL'
                           computer.choose(history)
                         else
                           computer.choose
                         end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_winner
    if human.move > computer.move
      history.cpu_bad_moves << computer.move.value
      :human
    elsif human.move < computer.move
      :computer
    else
      :tie
    end
  end

  def display_winner
    case determine_winner
    when :human then puts "#{human.name} won!"
    when :computer then puts "#{computer.name} won!"
    when :tie then puts "It's a tie!"
    end
  end

  def iterate_scores
    case determine_winner
    when :human then human.score += 1
    when :computer then computer.score += 1
    end
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
        display_moves
        determine_winner
        display_winner
        iterate_scores
        display_scores
        break if human.score == 3 || computer.score == 3
      end
      break unless play_again?
    end
    display_goodbye_message
    history.display_history
  end
end

RPSGame.new.play
