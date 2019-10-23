require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Ryan", 30, 24)
    @customer2 = Customer.new("Yousef", 5, 23)
    @customer3 = Customer.new("Boss Baby", 10, 3)

    @drink1 = Drink.new("White Russian", 4, 3)
    @drink2 = Drink.new("Brewdog", 3, 2)
    @drink3 = Drink.new("Champagne", 10, 1)

    @food1 = Food.new("Nuts", 1, 1)
    @food2 = Food.new("Caviar", 20, 5)

    @pub = Pub.new("The Swan", 100, {@drink1 => 2,
          @drink2 => 3, @drink3 => 1})


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
    assert_equal(5, @pub.stock_count_general)
    assert_equal(1, @pub.stock_count_drink(@drink1))
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

  def test_buy_food
    @customer1.buy_drink(@drink1, @pub)
    @customer1.buy_food(@food1, @pub)
    assert_equal(25, @customer1.wallet)
    assert_equal(105, @pub.till)
    assert_equal(2, @customer1.drunk_level)
  end

  def test_cant_buy_food__too_poor
    @customer2.buy_drink(@drink1, @pub)
    result = @customer2.buy_food(@food2, @pub)
    assert_equal(1, @customer2.wallet)
    assert_equal(104, @pub.till)
    assert_equal(3, @customer2.drunk_level)
    assert_equal("Not enough money!", result)
  end

  def test_prove_customer_age
    assert_equal(true, @customer1.prove_customer_age)
    assert_equal(false, @customer3.prove_customer_age)
  end

end
