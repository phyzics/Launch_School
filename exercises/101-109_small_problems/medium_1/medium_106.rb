# medium_106.rb - Stack Machine Interpretation
def minilang(commands)
  command_array = commands.split
  register = [0]
  stack = []

  command_array.each do |command|
    if command.to_i.to_s == command
      register[0] = command.to_i
    elsif command == 'PUSH'
      stack << register[0]
    elsif command == 'ADD'
      register[0] += stack.pop
    elsif command == 'SUB'
      register[0] -= stack.pop
    elsif command == 'MULT'
      register[0] *= stack.pop
    elsif command == 'DIV'
      register[0] /= stack.pop
    elsif command == 'MOD'
      register[0] %= stack.pop
    elsif command == 'POP'
      register[0] = stack.pop
    elsif command == 'PRINT'
      puts register
    end
  end
end

#minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')

=begin
utp:
- register = current value (not part of the stack!)
- operation removes (n) most recently pushed items (so pop)
  - perform operation with register and value, and then store in register
- #push/#pop
- all operations are integer operations
alg:
- program reads left to right, performing the appropriate operations
- split the string, take it one at a time

=end
