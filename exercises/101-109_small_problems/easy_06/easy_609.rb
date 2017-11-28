# easy_609.rb - Does My List Include This?
def include?(arr, obj)
  boolean = false
  arr.each { |ele| boolean = true if ele == obj }
  boolean
end

p include?([1,2,3,4,5], 3) #== true
p include?([1,2,3,4,5], 6) #== false
p include?([], 3) #== false
p include?([nil], nil) #== true
p include?([], nil) #== false
=begin
utp:
- takes arr, search value; true if in, false if not, don't use #include?
data:
- i: arr & obj
- o: boolean
tc:
  include?([1,2,3,4,5], 3) == true
  include?([1,2,3,4,5], 6) == false
  include?([], 3) == false
  include?([nil], nil) == true
  include?([], nil) == false
alg:
- iterate over array with each, checking if ele == obj, return ele if a match

=end
