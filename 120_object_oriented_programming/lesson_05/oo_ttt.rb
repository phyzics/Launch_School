# oo_ttt.rb
require 'pry'
module Display
  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_board
    clear
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    board.draw
    puts ""
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "The board is full!"
    end
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
    sleep 1
  end

  def display_grand_champion
    if is_human_grand_champion?
      prompt("Congratulations, you've won it all!")
    else
      prompt("Oh no! What a humiliating defeat...")
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tace Toe! Goodbye!"
  end

  def clear
    system('clear') || system('cls')
  end

  def joinor(arr, conj1=', ', conj2='or')
    case arr.size
    when 1 then arr.first
    when 2 then arr.join(" #{conj2} ")
    else
      arr[-1] = conj2 + " #{arr[-1]}"
      arr.join(conj1)
    end
  end

  def prompt(message)
    puts ">> #{message}"
  end
end


class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :win_count

  def initialize(marker)
    @marker = marker
    @win_count = 0
  end

  def increment_win_count
    self.win_count += 1
  end
end

class Human < Player

end

class Computer < Player

end

# Game Orchestration Engine
class TTTGame
  include Display

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message
    # game loop
    loop do
      # match loop
      loop do
        display_board
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          display_board if human_turn?
        end
        determine_winner
        display_result
        break if grand_champion?
        press_when_ready
        reset
        display_play_again_message
      end
      display_grand_champion
      break
    end

    display_goodbye_message
  end

  private

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.to_a.sample] = computer.marker
  end

  def determine_winner
    case board.winning_marker
    when HUMAN_MARKER
      human.increment_win_count
    when COMPUTER_MARKER
      computer.increment_win_count
    end
  end

  def press_when_ready
    prompt("Press [Enter] when you're ready for the next match, or enter 'exit' to quit the game.")
    answer = nil
    loop do
      answer = gets.chomp.downcase.strip
      if answer.empty?
        break
      elsif answer == 'exit'
        display_goodbye_message
        exit
      end
      prompt("Please enter a valid choice")
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase.strip
      break if %w[y n].include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
  end

  def grand_champion?
    human.win_count == 3 || computer.win_count == 3
  end

  def is_human_grand_champion?
    human.win_count > computer.win_count
  end
end

game = TTTGame.new
game.play
