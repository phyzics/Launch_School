# easy_310 - Palindromic Numbers
def palindromic_number?(num)
  num_str = num.to_s
  num_str == num_str.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

=begin
utp:
- take integer, return boolean for palindromic eval
data:
- i: integer
- o: boolean
ec:
- case validate? (no)
  - floats, 0, wrong obj, etc.
tc:
  palindromic_number?(34543) == true
  palindromic_number?(123210) == false
  palindromic_number?(22) == true
  palindromic_number?(5) == true
alg:
- convert int to str, check for reverse == true
=end
