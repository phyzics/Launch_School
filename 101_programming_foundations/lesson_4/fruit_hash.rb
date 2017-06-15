# fruit_hash.rb
def select_fruit(produce_list)
  keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do

    break if counter >= keys.size

    current_key = keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)
