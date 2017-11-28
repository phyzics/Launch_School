# easy_302.rb - Arithmetic Integer
def prompt(msg)
  puts "==> #{msg}"
end

prompt('Enter the first number:')
f_num = gets.chomp.to_i
prompt('Enter the second number:')
s_num = gets.chomp.to_i
prompt("#{f_num} + #{s_num} = #{f_num + s_num}")
prompt("#{f_num} - #{s_num} = #{f_num - s_num}")
prompt("#{f_num} * #{s_num} = #{f_num * s_num}")
prompt("#{f_num} / #{s_num} = #{f_num / s_num}")
prompt("#{f_num} % #{s_num} = #{f_num % s_num}")
prompt("#{f_num} ** #{s_num} = #{f_num ** s_num}")

=begin
utp:
- take 2 ints, print via +, -, *, /, %, **
data:
- i: str
- o: str
- str, int
tc:
- 23 17
- 17 23
alg:
- get input, convert int, perform operations with str inp

=end
