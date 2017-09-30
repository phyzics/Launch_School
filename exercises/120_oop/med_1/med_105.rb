# med_105.rb - Stack Machine Interpretation
require 'pry'
class MinilangRuntimeError < RuntimeError; end
class InvalidToken < MinilangRuntimeError; end
class EmptyStack < MinilangRuntimeError; end

class Minilang
  ACTIONS = %w[PUSH ADD SUB MULT DIV MOD POP PRINT]

  attr_accessor :register
  attr_reader :cmd, :stack

  def initialize(command)
    @cmd = parse(command.strip)
    @stack = []
    @register = 0
  end

  def parse(command)
    command.split
  end

  def eval
    cmd.each do |act|
      if act =~ /\A[-]?\d+\z/
        self.register = act.to_i
      elsif ACTIONS.include?(act)
        interpret_command(act)
      else
        raise InvalidToken, "Invalid token: #{act}"
      end
    end

    rescue MinilangRuntimeError => error
      puts error.message
  end

  def interpret_command(command)
    case command
    when 'PRINT' then output
    when 'PUSH'  then stack << register
    when 'MULT'  then multiply
    when 'ADD'   then add
    when 'SUB'   then subtract
    when 'POP'   then replace
    when 'DIV'   then divide
    when 'MOD'   then modulo
    end
  end

  def multiply
    self.register = register * stack.pop
  end

  def add
    self.register = register + stack.pop
  end

  def subtract
    self.register = register - stack.pop
  end

  def output
    puts register
  end

  def replace
    raise EmptyStack, "Empty stack!" if stack.empty?
    self.register = stack.pop
  end

  def divide
    self.register = register / stack.pop
  end

  def modulo
    self.register = register % stack.pop
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
=begin









=end
