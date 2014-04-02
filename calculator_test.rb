require_relative 'calculator'
require 'test/unit'

class CalculatorTest < Test::Unit::TestCase
  def test_simple
    assert_equal(0, Calculator.new.add(""))
    assert_equal(1, Calculator.new.add("1"))
    assert_equal(3, Calculator.new.add("1,2"))
  end

  def test_new_lines
    assert_equal(6, Calculator.new.add("1\n2,3"))
  end

  def test_invalid_input
    assert_raise(ArgumentError) {Calculator.new.add("1\n")}
  end

  def test_delimeters
    assert_equal(3, Calculator.new.add("//;\n1;2"))
  end

  def test_negatives
    assert_equal(3, Calculator.new.add("1,2,-1"))
  end
end
