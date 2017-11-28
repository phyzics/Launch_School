# easy_201.rb - From-To-Step Sequence Generator
def step(start, last, jump)
  current_val = start

  until current_val > last
    yield(current_val)
    current_val += jump
  end
  current_val
end

step(1, 10, 3) { |value| puts "value = #{value}" }
