# med_103.rb - Pig Latin
class PigLatin

  def self.translate(string)
    return string + 'ay' if string[0].match?(/[aeiou]/)

    array = string.split
    array.map do |word|
      if word.match?(/\b[^aeiou ]?(qu|ch).*\b/)
        word.sub(/\b([^aeiou ]?)(qu|ch)(.*)\b/,'\3\1\2ay')
      elsif word.match?(/\bth[^aeiou]?.*\b/)
        word.sub(/\b(th[^aeiou]?)(.*)\b/,'\2\1ay')
      elsif word.match?(/\b(y|x)[aeiou].*\b/)
        word.sub(/\b(y|x)([aeiou].*)\b/,'\2\1ay')
      elsif word.match?(/\b(y|x)[^aeiou].*\b/)
        word + 'ay'
      elsif word.match?(/\b[^aeiou].*\b/)
        word.sub(/\b([^aeiou])(.*)\b/,'\2\1ay')
      end
    end.join(' ')
  end

end
