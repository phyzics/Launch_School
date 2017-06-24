# tictactoe.rb
require 'pry'
require 'YAML'
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#              ~*~ CONSTANTS ~*~
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # => rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # => columns
                [[1, 5, 9], [3, 5, 7]] # => diagnals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#              ~*~ FUNCTIONS ~*~
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear' || 'cls'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def help_board
  help_board = {}
  (1..9).each { |num| help_board[num] = num }
  display_board(help_board)
  prompt "Enter any key when you are ready to continue."
  answer = gets.chomp
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def who_goes_first?(player_1='Player', player_2='Computer')
  prompt "Who is going first, Player 1 or Player 2? (Enter '1' or '2')"
  first = gets.chomp
  loop do
    case first
    when '1' || 'one'
      prompt "Player 1 will go first!"
      sleep 1
      return true
    when '2' || 'two'
      prompt "Player 2 will go first!"
      sleep 1
      return false
    end
    prompt "Please enter either '1' or '2' and press [ENTER]"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp

    if empty_squares(brd).include?(square.to_i)
      break
    elsif square.downcase == 'exit'
      prompt "Thanks for playing Tic Tac Toe! See ya!"
      exit
    elsif
      square.downcase == 'help'
      help_board
      display_board(brd)
    else
      prompt "Sorry, that's not a valid choice."
    end
  end
  brd[square.to_i] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = detect_immediate_threat(brd, line, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = detect_immediate_threat(brd, line, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    else
      square = empty_squares(brd).sample
    end
  end

  brd[square] = COMPUTER_MARKER
end

def detect_immediate_threat(brd, line, user_marker)
  if brd.values_at(*line).count(user_marker) == 2
    brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def place_piece!(brd, player)
  if player
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  !player
end

# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
#              ~*~ PROGRAM ~*~
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

# player select option
# clean up the interface
  # introductory instructions
# export to YAML



loop do
  player_score = 0
  computer_score = 0
  second_player = false
  first_move = true

  prompt "How many people are playing? (1 or 2)"
  players = gets.chomp.downcase
  loop do
    case players
    when '1' || 'one'
      first_move = who_goes_first?
      binding.pry
      break

    when '2' || 'two'
      second_player = true
      first_move = who_goes_first?('Player 1', 'Player 2')
      break
    end

    prompt "Please enter either '1' or '2' and press [ENTER]"
  end

  until player_score == 2 || computer_score == 2
    board = initialize_board
    current_player = first_move

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)


    if someone_won?(board)
      case detect_winner(board)
      when 'Player'
        prompt 'You won!'
        player_score += 1
      when 'Computer'
        prompt 'Oh no! The computer bested you this round...'
        computer_score += 1
      else
        prompt "It's a tie!"
      end
    end

  end

  prompt "Victory!" if player_score >= 2
  prompt "Defeat!" if computer_score >= 2
  puts ''

  prompt "Would you like to play another set? (y/n)"
  new_set = ''
  loop do
    new_set = gets.chomp.downcase
    break if new_set == 'y' || new_set == 'n'
  end

  break unless new_set == 'y'
end

prompt "Thanks for playing Tic Tac Toe! See ya!"
