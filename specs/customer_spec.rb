require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Ryan", 30, 24)
    @customer2 = Customer.new("Yousef", 5, 23)
    @customer3 = Customer.new("Boss Baby", 10, 3)

    @drink1 = Drink.new("White Russian", 4, 3)
    @drink2 = Drink.new("Brewdog", 3, 2)
    @drink3 = Drink.new("Champagne", 10, 1)

    @pub = Pub.new("The Swan", 100, [@drink1,
           @drink2, @drink3])

  end

  def test_customer_name
    assert_equal("Ryan", @customer1.name)
  end

  def test_customer_wallet
    assert_equal(30, @customer1.wallet)
  end

  def test_buy_drink
    @customer1.buy_drink(@drink1, @pub)
    assert_equal(26, @customer1.wallet)
    assert_equal(104, @pub.till)
    assert_equal(3, @customer1.drunk_level)
  end

  def test_cant_buy_drink__too_young
    result = @customer3.buy_drink(@drink1, @pub)
    assert_equal(10, @customer3.wallet)
    assert_equal(100, @pub.till)
    assert_equal(0, @customer3.drunk_level)
    assert_equal("Get out, kid!", result)
  end

  def test_cant_buy_drink__too_poor
    result = @customer2.buy_drink(@drink3, @pub)
    assert_equal(5, @customer2.wallet)
    assert_equal(100, @pub.till)
    assert_equal(0, @customer2.drunk_level)
    assert_equal("Not enough money!", result)
  end

  def test_drunk_level
    assert_equal(0, @customer2.drunk_level)
  end

  def test_cant_buy_drink__too_drunk
    customer = @customer1.buy_drink(@drink1, @pub)
    @customer1.buy_drink(@drink1, @pub)
    @customer1.buy_drink(@drink1, @pub)
    @customer1.buy_drink(@drink1, @pub)
    assert_equal(18, @customer1.wallet)
    assert_equal(112, @pub.till)
    assert_equal(9, @customer1.drunk_level)
    assert_equal("You're too drunk!", customer)
  end
end
