# med_104.rb - Passing Parameters Part 2
def bird_organizer(array)
  yield(array)
end

bird_organizer(['raven', 'finch', 'hawk', 'eagle']) do |_, _, *raptors|
  puts raptors
end
