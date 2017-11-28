# easy_103.rb
=begin
- in the `go_fast` method, we make a call to `self` and then
  class, and use string interpolation (to_s) on the return value
- since we call `go_fast` on an instance, the `self` refers to
  the caller (the instance object), and class then returns the class
  of said caller
=end
