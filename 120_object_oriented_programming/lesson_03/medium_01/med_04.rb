class Greeting
  def greet(string)
    p string
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('bye')
  end
end
