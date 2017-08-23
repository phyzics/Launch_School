# easy 209_rb - Sum or Product of Consecutive Integers
def prompt(msg)
  puts ">> #{msg}"
end

prompt("Please enter an integer greater than 0")
inputed_integer = ''
loop do
  inputed_integer = gets.chomp
  if inputed_integer.to_i <= 0
    prompt("Do not enter an integer equal to or less than 0!")
  else
    break
  end
end

prompt("Enter 's' to compute the sum, 'p' to compute the product.")
operation = ''
loop do
  operation = gets.chomp.downcase
  case operation
  when 's'
    sum = (1..inputed_integer.to_i).reduce(:+)
    prompt("The sum of the integers between 1 and #{inputed_integer} is #{sum}.")
    break
  when 'p'
    product = (1..inputed_integer.to_i).reduce(:*)
    prompt("The sum of the integers between 1 and #{inputed_integer} is #{product}.")
    break
  else
    prompt("Please enter only either 's' or 'p'!")
  end
end


=begin
utp:
- ask for int > 0; then ask if sum or product of ints from 1 to int

ec:
- none since it must be int and greater than 0
- validate info?

data:
- i: string
- o: int

algorithm
- prompt user, convert input to string; prompt again and either
  - reduce range of 1..int using :+ or :*

=end
