# practice_problem_14.rb
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.map do |produce,_| # => block needs to return [r, g], m, [r, g], [o], l

  case hsh[produce][:type]
  when 'fruit'
    hsh[produce][:colors].map { |color| color.capitalize }
  when 'vegetable'
    hsh[produce][:size].upcase
  end

end

p arr
