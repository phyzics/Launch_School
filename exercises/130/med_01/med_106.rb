# med_106.rb - Exploring Procs, Lambdas, and Blocks: Definition and Arity
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
- lambdas will raise an error if the block takes an argument and you do not
  pass an argument, whileas a proc will still run, using, it seems, nil
- if you fail to pass a block with a method that has a non-conditional yield,
  it will raise a LocalJumpError exception
- using yield you need to pass arguments explicitly, like a #call
- blocks that use a local variable either a) have to init, or b) take an arg

    -- final analysis --
  A proc is a Proc object that can be called with or without a variable. If
  no argument is given to #call, it seems to assign `nil` to any block level
  variables.

  A lambda is a kind of Proc object, and can be initalized in 2 different
  formats. However, if the block in a lambda requires an argument, you must
  pass the correct number of arguments to it, otherwise you will receive an
  ArgumentError.

  Blocks have looser arity rules than lambdas, but if a method calls yield
  without qualifying it, there must be a block passed to the method or it will
  raise a LocalJumpError exception.

  Likewise, a block that uses a variable must either initialize the local
  variable itself, or have it passed as an argument assigned to a parameter.
  Like procs, you do not have to pass the correct number of arguments.
=end
