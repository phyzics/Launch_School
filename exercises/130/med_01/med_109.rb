# med_109.rb Internal vs External Iterators
e = Enumerator.new do |y|
  i = 0
  loop do
    if i == 0
      y << 1
    else
      r = (1..i).reduce(:*)
      y << (r)
    end
    i += 1
  end
end

7.times { puts e.next }

e.rewind

e.with_index do |ele, i|
  puts ele
  break if i == 6
end
