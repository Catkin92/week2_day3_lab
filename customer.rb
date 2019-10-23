class Customer

  attr_reader :name, :wallet, :age, :drunk_level

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = 0
  end

  def buy_drink(drink, pub)
    if @age >= 18
      if @wallet >= drink.price
        if @drunk_level < 9
          pub.increase_money_in_till(drink.price)
          @wallet -= drink.price
          @drunk_level += drink.alcohol_level
        end
        return "You're too drunk!"
      end
      return "Not enough money!"
    end
    return "Get out, kid!"
  end
end
