# easy_802.rb - Madlibs
def prompt(msg)
  puts ">> #{msg}"
end

prompt('Madlibs!')
sleep 1
prompt('Please enter a noun:')
noun = gets.chomp
prompt('Please enter a verb:')
verb = gets.chomp
prompt('Now, please enter an adjective:')
adj = gets.chomp
prompt('Lastly, please enter an adverb:')
adv = gets.chomp

prompt("You like to #{verb} a #{adj} #{noun} while #{adv} thinking? Weird, bro.")
