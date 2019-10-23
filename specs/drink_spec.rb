require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class TestDrink < MiniTest::Test

  def setup

    @drink1 = Drink.new("White Russian", 4, 3)
    @drink2 = Drink.new("Brewdog", 3, 2)
    @drink3 = Drink.new("Champagne", 10, 1)

  end

  def test_drink_name
    assert_equal("White Russian", @drink1.name)
  end

  def test_drink_price
    assert_equal(10, @drink3.price)
  end

  def test_alcohol_level
    assert_equal(3, @drink1.alcohol_level)
  end
end
