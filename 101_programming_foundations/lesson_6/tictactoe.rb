# tictactoe.rb
require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # => rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # => columns
                [[1, 5, 9], [3, 5, 7]] # => diagnals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp

    if square.downcase == 'exit'
      prompt "Thanks for playing Tic Tac Toe! See ya!"
      exit
    end

    break if empty_squares(brd).include?(square.to_i)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square.to_i] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

loop do
  player_score = 0
  computer_score = 0

  until player_score == 2 || computer_score == 2
    board = initialize_board

    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      display_board(board)
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
    #sleep(2)

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
