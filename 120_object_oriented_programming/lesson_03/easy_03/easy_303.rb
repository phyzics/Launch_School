# easy_303.rb
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

toby = AngryCat.new(3, "Toby")
max = AngryCat.new(6, "Maximus")
