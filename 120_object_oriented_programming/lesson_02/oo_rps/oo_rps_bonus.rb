# oo_rps.rb - Object Oriented Rock, Paper, Scisssors
require 'pry'
class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @choice = value
    case value
    when 'rock' then @value = Rock.new
    when 'paper' then @value = Paper.new
    when 'scissors' then @value = Scissors.new
    when 'lizard' then @value = Lizard.new
    when 'spock' then @value = Spock.new
    end
  end

  def scissors?
    @value.is_a?(Scissors)
  end

  def rock?
    @value.is_a?(Rock)
  end

  def paper?
    @value.is_a?(Paper)
  end

  def spock?
    @value.is_a?(Spock)
  end

  def lizard?
    @value.is_a?(Lizard)
  end

  def >(other_move)
    @value > other_move
  end

  def <(other_move)
    @value < other_move
  end

  def to_s
    @choice
  end
end

class Rock < Move
  def initialize; end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.spock? || other_move.paper?
  end
end

class Paper < Move
  def initialize; end

  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.scissors? || other_move.lizard?
  end
end

class Scissors < Move
  def initialize; end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.spock? || other_move.rock?
  end
end

class Lizard < Move
  def initialize; end

  def >(other_move)
    other_move.spock? || other_move.paper?
  end

  def <(other_move)
    other_move.scissors? || other_move.rock?
  end
end

class Spock < Move
  def initialize; end

  def >(other_move)
    other_move.scissors? || other_move.rock?
  end

  def <(other_move)
    other_move.lizard? || other_move.paper?
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
  end

  def reset_score
    self.score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    puts "What's your name?"
    loop do
      n = gets.chomp
      break unless n.empty?
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
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
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
    puts "thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def determine_winner
    if human.move > computer.move
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
        human.choose
        computer.choose
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
  end
end

RPSGame.new.play
