# med_106.rb - Grade School
class School

  def initialize
    @roster = Hash.new
  end

  def to_h
    @roster.sort.each { |n| n[1].sort! }.to_h
  end

  def add(name, grade)
    @roster[grade].nil? ? @roster[grade] = [name] : @roster[grade] << name
  end

  def grade(grade)
    @roster[grade].nil? ? [] : @roster[grade]
  end
end
