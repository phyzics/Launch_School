# easy_201.rb - How old is Teddy?

def prompt(msg)
  puts "=> #{msg}"
end

def age(name)
  name = "Teddy" if name == ''
  "#{name} is #{rand(20..200)} years old!"
end

prompt('Welcome! Please enter a name:')
name = gets.chomp
prompt(age(name))


=begin
utp:
- output random age between 20 and 200
  - age is in years, so integers

data:
- i: none
- o: string
- use integers and string

test cases:
run program 5 times, make sure they vary and do not cross parameters

algorithm:
- puts string that interpolates random of range


=end
