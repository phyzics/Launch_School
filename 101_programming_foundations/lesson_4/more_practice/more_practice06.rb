# more_practice06.rb
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index { |name, i| flintstones[i] = name[0, 3] }
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name = name[0, 3] }
p flintstones
