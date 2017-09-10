# medium_204.rb - Matching Parentheses?
def balanced?(string)
  counter = 0
  string.each_char do |char|
    case char
    when '('
      counter += 1
    when ')'
      counter -= 1
    end
    return false if counter < 0
  end
  counter == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

=begin
utp:
- takes a string, returns true if all () are balanced
  - must occur in ( ) pairs
data:
- i: string
- o: boolean
tc:
  p balanced?('What (is) this?') == true
  p balanced?('What is) this?') == false
  p balanced?('What (is this?') == false
  p balanced?('((What) (is this))?') == true
  p balanced?('((What)) (is this))?') == false
  p balanced?('Hey!') == true
  p balanced?(')Hey!(') == false
  p balanced?('What ((is))) up(') == false
alg:
- set up a counter; goes up when (, down )
  - if counter ever gets negative, return false
  - if at the end, counter is positive, return false
=end
