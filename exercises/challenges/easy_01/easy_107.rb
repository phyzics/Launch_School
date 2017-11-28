# easy_107.rb - Point Mutations
class DNA
  def initialize(string)
    @strand = string
  end

  def hamming_distance(strand2)
    s_arr1 = @strand.chars
    s_arr2 = strand2.chars

    compare_arr =
      if s_arr1.size < s_arr2.size
        s_arr2.zip(s_arr1)
      else
        s_arr1.zip(s_arr2)
      end

    counter = 0
    compare_arr.each do |pair|
      next if pair.include?(nil)
      counter += 1 if pair.uniq.size > 1
    end

    counter
  end
end
