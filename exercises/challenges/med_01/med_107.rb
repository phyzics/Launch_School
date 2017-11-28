# med_107.rb - Meetup
require 'date'
class Meetup

  WEEKDAYS = {
    monday: 1, tuesday: 2, wednesday: 3,
    thursday: 4, friday: 5, saturday: 6,
    sunday: 7
  }

  COUNT = {
    1 => 0, 2 => 0, 3 => 0,
    4 => 0, 5 => 0, 6 => 0,
    7 => 0
  }

  INTERVALS = {
    first: 1, second: 2, third: 3, fourth: 4
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    @weekday = weekday
    @schedule = schedule
    date =
      if INTERVALS[@schedule]
        find_day_of_week
      elsif @schedule == :teenth
        find_teenth
      else
        find_last
      end

    Date.new(@year, @month, date)
  end

  def find_teenth
    start = Date.new(@year, @month, 13)
    loop do
      return start.day if start.cwday == WEEKDAYS[@weekday]
      start += 1
    end
  end

  def find_day_of_week
    start = Date.new(@year, @month, 1)

    loop do
      COUNT[start.cwday] += 1

      if start.cwday == WEEKDAYS[@weekday]
        return start.day if find_interval
      end
      start += 1

      break if start.month > @month
    end

  end

  def find_last
    last = @month == 12 ? Date.new(@year, @month, 31) : Date.new(@year, @month + 1, 1) - 1

    loop do
      if last.cwday == WEEKDAYS[@weekday]
        return last.day
      else
        last -= 1
      end
    end

  end

  def find_interval
    COUNT[WEEKDAYS[@weekday]] == INTERVALS[@schedule]
  end
end

p Meetup.new(4, 2013).day(:monday, :first)
