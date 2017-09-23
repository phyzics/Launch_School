# easy_203.rb
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange; include Taste; end
class HotSauce; include Taste; end

puts Orange.ancestors
puts HotSauce.ancestors

=begin
for both, it will be Taste > Orange/HotSauce > Object > Kernel > BasicObject

^ almost, it is actually Orange/HotSauce > Taste ...
=end
