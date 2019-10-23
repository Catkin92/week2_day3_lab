class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks

  end

  def increase_money_in_till(money)
    @till += money
  end

  def stock_count_general
    total = 0
    for stock in @drinks.values
      total += stock
    end
    return total
  end

  def stock_count_drink(drink)
    return @drinks[drink]
  end

  def reduce_drink_stock(drink)
    @drinks[drink] -= 1
  end

  def stock_value_drink(drink)
    drink.price * @drinks[drink]
  end

  def stock_value_all_drinks(drinks)
    total = 0
    for drink in drinks
      total += stock_value_drink(drink)
    end
    return total
  end

end
