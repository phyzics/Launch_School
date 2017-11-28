# easy_201_test.rb
require 'minitest/autorun'
require_relative 'easy_201'

class OddWordsTest < MiniTest::Test
  def test_regular_sentance
    word = OddWords.new("whats the matter with kansas.")
    assert_equal("whats eht matter htiw kansas.", word.odd_print)
  end

  def test_even_ending
    word = OddWords.new("This is just the second test.")
    assert_equal("This si just eht second tset.", word.odd_print)
  end

  def test_extra_whitespace
    word = OddWords.new("now     we are           testing whitespace.")
    assert_equal("now ew are gnitset whitespace.", word.odd_print)
  end

  def test_leading_whitespace
    word = OddWords.new("      whats the matter with kansas.")
    assert_equal("whats eht matter htiw kansas.", word.odd_print)
  end

  def test_trailing_whitespace
    word = OddWords.new("whats the matter with kansas.     ")
    assert_equal("whats eht matter htiw kansas.", word.odd_print)
  end

  def test_trailing_and_leading_whitespace
    word = OddWords.new("        whats the matter with kansas.     ")
    assert_equal("whats eht matter htiw kansas.", word.odd_print)
  end

  def test_space_before_period_odd
    word = OddWords.new("whats the matter with kansas      .")
    assert_equal("whats eht matter htiw kansas.", word.odd_print)
  end

  def test_space_before_period_even
    word = OddWords.new("whats the matter with my kansas           .")
    assert_equal("whats eht matter htiw my sasnak.", word.odd_print)
  end

  def test_no_string_error
    assert_raises(StandardError) do
      word = OddWords.new('')
    end
  end
end
