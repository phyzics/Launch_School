# med_102.rb - Text Analyzer - Sandwich Code
class TextAnalyzer
  def process
    file = File.read("analyzer.txt")
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process { |text| puts "#{text.split(/\n\n/).count} paragraphs" }
analyzer.process { |text| puts "#{text.lines.count} lines" }
analyzer.process { |text| puts "#{text.split(' ').size} words" }
