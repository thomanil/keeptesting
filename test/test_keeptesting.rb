require File.dirname(__FILE__) + '/test_helper.rb'


class CalculatorTest < Test::Unit::TestCase
  context "a calculator" do
    should "add two numbers for the sum" do
      assert_equal 4, (2+2)
    end
  end
end
