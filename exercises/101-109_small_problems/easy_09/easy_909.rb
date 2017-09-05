# easy_909 - Grade book
SCORES_AND_GRADES = {
  90..100 => 'A',
  80..89 => 'B',
  70..79 => 'C',
  60..69 => 'D',
  0..59 => 'F'
}

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  SCORES_AND_GRADES.each { |k, v| return v if k.include?(average) }
end

p get_grade(95, 90, 93) #== "A"
p get_grade(50, 50, 95) #== "D"

=begin
utp:
- get mean of 3 values, and find letter value
- 0 - 100
data:
- i: int
- o: string
ec:
- integer division vs float
tc:
  get_grade(95, 90, 93) == "A"
  get_grade(50, 50, 95) == "D"
alg:
- set up a hash with ranges as the key, grade as the value
- find
=end
