# med_106.rb - Grade School
class School

  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def to_h
    @roster.sort.to_h
  end

  def add(name, grade)
    (@roster[grade] << name).sort!
  end

  def grade(grade)
    @roster[grade] || []
  end
end
