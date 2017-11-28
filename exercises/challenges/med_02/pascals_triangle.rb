# pascals_triangle.rb
# This is my attempt to reproduce Pete Hanson's memory from answer after
# I waited until the next day
class Triangle

  def initialize(num)
    @rows = num
  end

  def rows
    (1..@rows).to_a.map do |line|
      bottom_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
      @previous_row = bottom_row.each_cons(2).map { |l,r| l + r }
    end
  end
end
