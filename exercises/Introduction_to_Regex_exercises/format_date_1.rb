# format_date_1.rb
def format_date(date)
  date.gsub(/\A(\d{4})\-(\d{2})\-(\d{2})\z/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)
