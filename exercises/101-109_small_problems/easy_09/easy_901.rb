# easy_901.rb - Welcome Stranger
def greetings(arr, hsh)
  name = arr.join(' ')
  job = "#{hsh[:title]} #{hsh[:occupation]}"
  ">> Hey, #{name}! Sure is nice to have a #{job} around these parts."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

=begin
utp:
- takes arr and hsh, array contains name, hsh contains occupation
- return str that mentions name and title
data:
- i: arr and hsh
- o: str
alg:
- join arr as a string and save to variable 'name'
- save as another string the occupation
- return string with interpolation

=end
