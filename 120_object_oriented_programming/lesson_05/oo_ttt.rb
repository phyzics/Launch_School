# oo_ttt.rb
require 'pry'
require 'YAML'

module Display
  private

  MESSAGES = YAML.load_file('oo_ttt.yml')

  def display_welcome_message
    clear
    puts(MESSAGES['welcome_title'].center(80))
    puts ''
    prompt(MESSAGES['rules'])
    puts ''
    prompt(MESSAGES['enter_when_ready'])
    gets
  end

  def display_board
    clear
    puts format(MESSAGES['who_is_what'], human: human.name,
                                         human_marker: human.marker,
                                         computer: computer.name,
                                         computer_marker: computer.marker)
    board.draw
    puts ''
  end

  def display_help_board
    clear
    puts ''
    help_board = {}
    (1..9).each { |num| help_board[num] = num }
    board.draw(help_board)
    puts ''
    prompt(MESSAGES['enter_when_ready'])
    gets
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker
      prompt format(MESSAGES['human_win'], human: human.name)
    when computer.marker
      prompt format(MESSAGES['cpu_win'], computer: computer.name)
    else
      prompt(MESSAGES['board_full'])
    end

    display_current_scores
  end

  def display_current_scores
    puts ''
    puts(MESSAGES['current_score_title'])
    prompt("#{human.name}: #{human.win_count}")
    prompt("#{computer.name}: #{computer.win_count}")
    puts ''
  end

  def display_new_round_message
    prompt(MESSAGES['lets_play_again'])
    sleep 1
  end

  def display_grand_champion
    if is_human_grand_champion?
      prompt(MESSAGES['human_grand_champ'])
    else
      prompt(MESSAGES['cpu_grand_champ'])
    end
  end

  def display_goodbye_message
    prompt(MESSAGES['goodbye'])
    sleep 2
    clear
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
  def draw(keys=@squares)
    puts "     |     |"
    puts "  #{keys[1]}  |  #{keys[2]}  |  #{keys[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{keys[4]}  |  #{keys[5]}  |  #{keys[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{keys[7]}  |  #{keys[8]}  |  #{keys[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def center_open?
    @squares[5].unmarked?
  end

  def detect_immediate_threat(line, player_marker)
    squares = @squares.values_at(*line)
    if squares.select(&:marked?).map(&:marker).count(player_marker) == 2
      selected = squares.select(&:unmarked?).first
      return @squares.key(selected)
    end
    nil
  end

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
  attr_accessor :win_count, :name, :marker

  def initialize
    @win_count = 0
  end

  def increment_win_count
    self.win_count += 1
  end
end

class Human < Player; end

class Computer < Player; end

# Game Orchestration Engine
class TTTGame
  include Display

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    set_player_attributes
    # match loop
    loop do
      # round loop
      loop do
        display_board
        # turn loop
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          display_board if human_turn?
        end
        determine_winner
        display_result
        break if grand_champion?
        play_next_round?
        reset
        display_new_round_message
      end
      display_grand_champion
      break if play_again? == false
      total_reset
      display_new_round_message
    end

    display_goodbye_message
  end

  private

  def set_player_attributes
    set_player_names
    set_player_markers
  end

  def set_player_names
    clear
    prompt(MESSAGES['set_human_name_1'])
    prompt(MESSAGES['set_human_name_2'])
    human.name = verify_name
    puts ''
    prompt(MESSAGES['set_cpu_name'])
    computer.name = verify_name
  end

  def verify_name
    name = nil
    loop do
      name = gets.chomp.strip
      if name.empty?
        prompt(MESSAGES['empty_value'])
      elsif name == 'exit'
        quit
      elsif name =~ /[^a-z '0-9\.]/i
        prompt(MESSAGES['invalid_value'])
      else
        return name
      end
    end
  end

  def set_player_markers
    puts ''
    prompt(MESSAGES['set_human_marker_1'])
    prompt(MESSAGES['set_human_marker_2'])
    human.marker = verify_marker
    puts ''
    prompt(MESSAGES['set_cpu_marker'])
    computer.marker = verify_marker
    @current_marker = human.marker
    @first_to_move = human.marker
  end

  def verify_marker
    char = nil
    loop do
      char = gets.chomp.strip
      if char.empty?
        prompt(MESSAGES['empty_value'])
      elsif char == 'exit'
        quit
      elsif char.size > 1
        prompt(MESSAGES['only_one_char'])
      else
        return char
      end
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def human_moves
    prompt(MESSAGES['choose_square'] + "(#{joinor(board.unmarked_keys)}):")
    square = nil
    loop do
      square = gets.chomp
      if board.unmarked_keys.include?(square.to_i)
        break
      elsif square == 'help'
        display_help_board
        display_board
        prompt(MESSAGES['choose_square'] + "(#{joinor(board.unmarked_keys)}):")
      elsif square == 'exit'
        quit
      else
        prompt(MESSAGES['invalid_value'])
      end
    end

    board[square.to_i] = human.marker
  end

  def computer_moves
    square = nil
    # winning move
    Board::WINNING_LINES.each do |line|
      square = board.detect_immediate_threat(line, computer.marker)
      break if square
    end

    # defensive move
    if !square
      Board::WINNING_LINES.each do |line|
        square = board.detect_immediate_threat(line, human.marker)
        break if square
      end
    end

    square = 5 if !square && board.center_open?
    square = board.unmarked_keys.to_a.sample if !square


    board[square] = computer.marker
  end

  def determine_winner
    case board.winning_marker
    when human.marker
      human.increment_win_count
    when computer.marker
      computer.increment_win_count
    end
  end

  def play_next_round?
    prompt(MESSAGES['next_round'])
    answer = nil
    loop do
      answer = gets.chomp.downcase.strip
      if answer.empty?
        break
      elsif answer == 'exit'
        quit
      end
      prompt(MESSAGES['invalid_value'])
    end
  end

  def play_again?
    answer = nil
    loop do
      prompt(MESSAGES['play_again?'])
      answer = gets.chomp.downcase.strip
      if %w[y yes n no].include?(answer)
        break
      elsif answer == 'exit'
        quit
      elsif answer.empty?
        prompt(MESSAGES['empty_value'])
      else
        prompt(MESSAGES['invalid_value'])
      end
    end

    %w[y yes].include?(answer)
  end

  def reset
    board.reset
    @current_marker = @first_to_move
  end

  def total_reset
    reset
    human.win_count = 0
    computer.win_count = 0
  end

  def grand_champion?
    human.win_count == 3 || computer.win_count == 3
  end

  def is_human_grand_champion?
    human.win_count > computer.win_count
  end

  def quit
    display_goodbye_message
    exit
  end
end

game = TTTGame.new
game.play
