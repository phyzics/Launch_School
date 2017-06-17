# more_practice01.rb
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_index do |name, index|
  flintstones[index] = [name, index]
end

flintstones = flintstones.to_h
