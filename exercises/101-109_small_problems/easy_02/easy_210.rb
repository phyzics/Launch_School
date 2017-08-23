# easy_210.rb - Mutation
=begin
array2 should output:
  Moe
  Larry
  CURLY
  SHEMP
  Harpo
  CHICO
  Groucho
  Zeppo

This is because though array1 and array2 point to different array objects,
the nested objects between them are shared, so if we mutate any of the
nested objects, it will change the value of both references.
=end
