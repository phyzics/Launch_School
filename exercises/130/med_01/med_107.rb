# med_107.rb - Exploring Procs, Lambdas, and Blocks: Returning
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc
=begin
- in the 1st, proc is called, and return exits us out of the method
- in the 2nd, it gives us a LocalJumpError specifying 'unexpected return'
- in the 3rd, despite `return` in the block, we execute the next line in the
  method
- same as the 4th, but we can pass lambdas as arguments, though it seems not
  procs
- same error as 2

    ---- final analysis ----
  A Proc, if initialized within a method body, will execute the `return` keyword
  and exit out of the method. However, if the Proc is intialized outside of the
  method body and passed as an argument, then it raises a LocalJumpError. This
  is also raised if we try and yield to a block that has `return`.
  
  Lamadas, on the other hand, return `nil` when we only have the return keyword
  in the block. This is the same regardless of whether we initalize the lamda
  within the method, or outside of it and then pass it as an argument.
=end
