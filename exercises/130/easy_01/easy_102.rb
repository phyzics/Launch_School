# easy_102.rb - Optional Blocks
def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute(5) { |num| num**2 } == 25
p compute(3) { |num| num.odd? } == true
p compute(27) == 'Does not compute.'
