# easy_209.rb
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end
end

=begin
- if we added `Bingo#play` it would override the `Game#play` that it inherits
  from the `Game` class
=end
