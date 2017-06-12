# 1
=begin
I expect it to print:
1
2
2
3
[Correct]

# 2
"!" is the bang operator, and usually (but not always) attaches to the end
of a method and means that the method will mutate the caller (e.g. map vs map!).
However, the character "!" can be used in other ways as well

"?" if at the end of a method name means that the method will return a boolean
value and is used in the ternary operator to see if a given value is true or
false

1) means "not equal to" and should be used in conditionals evaluating two values
2) will return a boolean of opposite value of the object (i.e. !nil == true)
3) depends on what it follows; in the example, it usualy means the method called
   will mutate the caller
4) though if tossed out randomly it will yield a syntax error, it is used in
   the ternary operator and comes before the results
5) it depends what (likley will render a syntax error), but for some methods
   it means the method will return a boolean value
6) returns the objects boolean value

# 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
p advice

# 4
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers = [1, 2, 3, 4, 5]

numbers.delete(1)

# #delete_at() deletes the element at the specified index while #delete()
# deletes elements with the specified value

# 5
puts (10..100).include?(42)

# 6
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
puts famous_words

# 7
# before running the code, my guess is 42 [Correct]

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)

# 8
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten!

# 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.to_a[2]
p flintstones
=end
