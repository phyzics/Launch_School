# easy_701.rb - Combine Two Lists
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=begin
utp:
- takes 2 arrays, returns arr with all elements in alternation
- both non empty and have same # of args
data:
- i: arr
- o: arr
tc:
- p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
alg:
- #zip
=end
