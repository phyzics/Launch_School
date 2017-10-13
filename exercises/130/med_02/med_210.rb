# med_210.rb - Test word_count method - Text
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'


class TextTest < Minitest::Test
  def setup
    @script = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    @text = Text.new(@script.read)
    actual_text = @text.swap('a', 'e')
    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    
    assert_equal(expected_text, actual_text)
  end
  
  def test_word_count
    read_script = @script.read
    expected_count = read_script.split.count
    @text = Text.new(read_script)
    assert_equal(expected_count, @text.word_count)
  end
  
  def teardown
    @script.close  
  end
end