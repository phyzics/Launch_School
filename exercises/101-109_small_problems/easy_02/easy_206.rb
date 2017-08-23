# easy_206.rb - Odd Numbers
(1..99).each { |num| puts num if num.odd? }

#further exploration
1.upto(99) { |i| puts i if i.odd? }

=begin
utp:
- print only odd numbers from 1 to 99, inclusive
- each number on a separate line

ec:
- should I assume integers?

data:
- integers

algorithm:
- call each on a range and puts if odd

=end
