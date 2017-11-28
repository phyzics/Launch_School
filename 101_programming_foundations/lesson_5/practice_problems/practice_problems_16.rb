# practice_problem_16.rb
def uuid
  num_arr  = %w(1 2 3 4 5 6 7 8 9)
  word_arr = %w(a b c d e f)
  select_arr = [num_arr, word_arr]

  uuid_str = ''
  counter = 0
  loop do
    uuid_str += "#{select_arr.sample.sample}"
    counter += 1

    case counter
    when 8
      uuid_str += "-"
    when 12
      uuid_str += "-"
    when 16
      uuid_str += "-"
    when 20
      uuid_str += "-"
    end

    break if counter >= 32
  end

puts uuid_str
end

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += "-" unless index >= sections.size - 1
  end

uuid
end

uuid
puts generate_UUID
