# house.rb
class House

  PREPEND = "This is"

  def self.recite
    verses = new.assemble_rhyme
    count = 1
    song = ''
    until verses.empty? do
      next_verse = verses.shift(count)
      next_verse.reverse_each do |line|
        song << "#{line[0]}\n"
      end
      song << "\n"
      count += 1
    end
    song.gsub!(/\n\n/,".\n\n")
    song.chomp
  end

  def initialize
    @parts = pieces
  end

  def assemble_rhyme
    assembled = []
    until @parts.empty? do
      [PREPEND, *@parts].flatten.each_cons(2).with_index do |(a, b), i|
        next if i.odd?
        assembled << ["#{a} #{b}"]
      end
      @parts.shift
    end
    assembled.reverse
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
