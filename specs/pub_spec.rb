require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestPub < MiniTest::Test

  def setup

    @customer1 = Customer.new("Ryan", 30, 24)
    @customer2 = Customer.new("Yousef", 5, 23)
    @customer3 = Customer.new("Boss Baby", 10, 3)

    @drink1 = Drink.new("White Russian", 4, 3)
    @drink2 = Drink.new("Brewdog", 3, 2)
    @drink3 = Drink.new("Champagne", 10, 1)

    @drink_stock = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Swan", 100, {@drink1 => 2,
          @drink2 => 3, @drink3 => 1})


  end

  def test_pub_name
    assert_equal("The Swan", @pub.name)
  end

  def test_pub_till
    assert_equal(100, @pub.till)
  end

  def test_pub_drinks
    assert_equal("White Russian", @drink1.name)
  end

  def test_increase_money_in_till
    @pub.increase_money_in_till(@drink1.price)
    assert_equal(104, @pub.till)
  end

  def test_stock_count_general
    assert_equal(6, @pub.stock_count_general)
  end

  def test_stock_count_drink
    assert_equal(2, @pub.stock_count_drink(@drink1))
  end

  def test_reduce_drink_stock
    @pub.reduce_drink_stock(@drink1)
    assert_equal(1, @pub.stock_count_drink(@drink1))
  end

  def test_stock_value_drink
    assert_equal(8, @pub.stock_value_drink(@drink1))
  end

  def test_stock_value_all_drinks
    assert_equal(27, @pub.stock_value_all_drinks(@drink_stock))
  end

end
