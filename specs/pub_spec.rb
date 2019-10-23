require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class TestPub < MiniTest::Test

  def setup

    @pub = Pub.new("The Swan", 100, [@drink1,
      @drink2, @drink3])

    @drink1 = Drink.new("White Russian", 4)
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
end
