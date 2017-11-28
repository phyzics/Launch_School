# robot_name.rb
class Robot
  @@used_names = []

  def initialize
    @name = new_name
  end

  def name
    @name
  end

  def new_name
    name = [*'AA'..'ZZ'].sample + [*'000'..'999'].sample
    @@used_names.include?(name) ? name = new_name : @@used_names << name
    name
  end

  def reset
    @name = new_name
  end
end
