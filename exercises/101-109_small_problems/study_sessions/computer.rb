# computer.rb
WORD_TO_DIGIT_KEY = {
  'zero' => 0,
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}

def computer(english)
  num1, operator, num2 = english.split
  num1 = WORD_TO_DIGIT_KEY[num1]
  num2 = WORD_TO_DIGIT_KEY[num2]
  case operator
  when 'plus' then num1 + num2
  when 'minus' then num1 - num2
  end
end

p computer("two plus two")
p computer("seven minus six")
p computer("zero plus eight")
