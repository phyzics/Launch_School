# easy_905.rb - Uppercase Check
def uppercase?(str)
  alpha_arr = str.chars.select do |char|
    ('a'..'z').include?(char) || ('A'..'Z').include?(char)
  end
  alpha_arr = alpha_arr.join
  alpha_arr == alpha_arr.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin
# isolate alpha
# run upcase check

=end
