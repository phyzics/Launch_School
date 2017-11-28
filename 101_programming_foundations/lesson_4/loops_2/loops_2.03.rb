# loops_2.03.rb

process_the_loop = [true, false].sample

# p process_the_loop ? "The loop was processed!" : "The loop wasn't processed!"

loop do
  if process_the_loop
    p 'The loop was processed!'
  else
    p "The loop wasn't processed!"
  end
  break
end
