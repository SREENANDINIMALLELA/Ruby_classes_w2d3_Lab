class Customer
  attr_reader :name , :wallet ,:age, :drunkness
  def initialize(name  , wallet , age )
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = 0
  end

  def buy(drink, pub)
    if  pub.sell_to_customer(drink , @age, @drunkness) == true
        increase_drunkness(drink)
        reduce_wallet_money(drink)
      end
    end
  def increase_drunkness(drink)
    @drunkness += drink.alcohol_level()
  end
  def reduce_wallet_money(drink)
    @wallet -= drink.price()
  end
  def buy_food(food , pub)


  end

end
