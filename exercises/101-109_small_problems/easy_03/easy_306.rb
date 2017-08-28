# easy_306.rb - Exclusive Or
def boolean_evaluation(value)
  if value
    1
  else
    -1
  end
end

def xor?(con1, con2)
  boolean_counter = 0
  boolean_counter += boolean_evaluation(con1) + boolean_evaluation(con2)

  return true if boolean_counter == 0
  false
end

puts xor?(5.even?, 4.even?) #== true
puts xor?(5.odd?, 4.odd?) #== true
puts xor?(5.odd?, 4.even?) #== false
puts xor?(5.even?, 4.odd?) #== false
puts xor?(5, 4.odd?) #== true
puts xor?('hi', 'sup') #== false
puts xor?('hi', nil) #== true
puts xor?(nil, false) #== false

=begin
utp:
- method that returns true if exactly 1 conditional is truthy and the other is
  false
data:
- i: evaluation
- o: boolean
tc:
  puts xor?(5.even?, 4.even?) == true
  puts xor?(5.odd?, 4.odd?) == true
  puts xor?(5.odd?, 4.even?) == false
  puts xor?(5.even?, 4.odd?) == false
  puts xor?(5, 4.odd?) == true
  puts xor?('hi', 'sup') == false
  puts xor?('hi', nil) == true
  puts xor?(nil, false) == false
alg:
- set up a counter that tracks eval results, t +1 f -1, if counter goes to +/-2
  then return false; evaluate each expression and iterate
=end
