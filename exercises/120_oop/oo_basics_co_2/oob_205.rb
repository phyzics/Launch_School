# oob_205.rb - Counting Cats
class Cat
  @@total_number_of_cats = 0

  def initialize
    @@total_number_of_cats += 1
  end

  def self.total
    puts @@total_number_of_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
