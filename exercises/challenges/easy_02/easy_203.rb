# easy_203.rb - Beer Song
class BeerSong

  def verse(beer)
    case
    when beer > 2
      "#{beer} bottles of beer on the wall, #{beer} bottles of beer.\nTake one down and pass it around, #{beer - 1} bottles of beer on the wall.\n"
    when beer == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    when beer == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when beer == 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(v1, v2)
    (v2..v1).to_a.reverse.map { |b| verse(b) }.join("\n")
  end

  def lyrics
    song_arr = []
    99.downto(0) { |t| song_arr << verse(t) }
    song_arr.join("\n")
  end
end
