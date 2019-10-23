require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class TestFood < MiniTest::Test

  def setup

    @food = Food.new("Nuts", 1, 1)

  end

  def test_food_name
    assert_equal("Nuts", @food.name)
  end

  def test_food_price
    assert_equal(1, @food.price)
  end

  def test_food_rejuvenation_level
    assert_equal(1, @food.rejuvenation_level)
  end
end
