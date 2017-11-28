# med_106.rb - Number Guesser Part 2
class GuessingGame
  RESULT = {
    high: "Your guess is too high",
    low: "Your guess is too low",
    invalid: "Invalid Guess. Enter a number between 1 and 10:"
  }

  MATCH_RESULT = {
    win: "You win!",
    lose: "You are out of guesses. You lose."
  }

  attr_reader :winning_num, :range

  def initialize(min, max)
    @range = (min..max)
    @size_of_range = max - min
    @winning_num = rand(range)
    @max_guesses = Math.log2(@size_of_range).to_i + 1
  end

  def play
    result = match
    win_or_lose?(result)
  end

  def match
    guess = nil
    @max_guesses.downto(1) do |n|
      display_guesses_left(n)
      guess = get_num
      break if guess == winning_num
      too_high_or_low?(guess)
    end
    guess == winning_num ? :win : :lose
  end

  def too_high_or_low?(guess)
    if guess > winning_num
      puts RESULT[:high]
    else
      puts RESULT[:low]
    end
  end

  def get_num
    puts "Please enter a number between #{range.first} and #{range.last}:"
    guess = nil

    loop do
      guess = gets.chomp.strip.to_i

      if range.cover?(guess) ==  false
        puts RESULT[:invalid]
      else
        break
      end
    end
    guess
  end

  def display_guesses_left(guesses)
    puts
    if guesses == 1
      puts "You have #{guesses} guess remaining."
    else
      puts "You have #{guesses} guesses remaining."
    end
  end

  def win_or_lose?(result)
    case result
    when :win  then puts MATCH_RESULT[:win]
    when :lose then puts MATCH_RESULT[:lose]
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
