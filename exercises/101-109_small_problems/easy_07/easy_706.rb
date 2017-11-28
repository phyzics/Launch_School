# easy_706.rb - Staggered Caps (Part 2)
def staggered_case(str)
  index = -1
  str_arr = str.chars.map do |char|
    if ('A'..'Z').include?(char) == false && ('a'..'z').include?(char) == false
      char
    else
      index += 1
      index.even? ? char.capitalize : char.downcase
    end
  end
  str_arr.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

=begin
utp:
- take string, returns new string where every other char is capitalized
  - numbers should not be modified, but count towards upper lower changing
data:
- i: string
- o: string (same)
tc:
  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  staggered_case('ALL_CAPS') == 'AlL_CaPs'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
alg:
- #chars, #map_with_index! if index even, cap, if odd, downcase
  - set case guard for numbers

=end
