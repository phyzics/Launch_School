# exercise_02.rb

module Speech
  def talk(string)
    puts string.capitalize
  end

  def war_cry(string)
    puts string.upcase
  end
end

class OrcWarrior
  include Speech
end

garnok = OrcWarrior.new

garnok.talk('ZUG ZUG')
garnok.war_cry("lok'tar o'gar")
