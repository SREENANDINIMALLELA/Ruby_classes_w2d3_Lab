require("minitest/autorun")
require("minitest/rg")
require_relative("../Food.rb")
require_relative("../Pub.rb")
require_relative("../Drink.rb")
require_relative("../Customer.rb")

class TestCustomer< MiniTest::Test
	def setup()
    @vodka = Drink.new("Vodka", 80, 20)
    @gin = Drink.new("Gin", 50, 15)
    @wine = Drink.new("Wine", 40, 10)
    @drinks = [@vodka, @gin, @wine]
    @sandwitch = Food.new("sandwitch" , 4 ,20)
    @chips = Food.new("Chips" , 5 , 10)
@food=[@sandwitch,@chips]
    @pub = Pub.new("Revolution", 1000 , @drinks,@food)

    @customer1 = Customer.new("Steve" ,300 , 25)
    @customer2 = Customer.new("Adam" , 100 , 12)
  end
  def test_name()
    assert_equal("Steve" , @customer1.name())
  end
  def test_wallet()
    assert_equal(300 , @customer1.wallet())
  end
  def test_age()
    assert_equal(25 , @customer1.age())
  end
  def test_drunkness()
    assert_equal(0, @customer1.drunkness())
  end

  def test_buy()
    @customer1.buy(@vodka, @pub)
    assert_equal(20, @customer1.drunkness())
    assert_equal(2, @pub.drinks_count())
    assert_equal(220 , @customer1.wallet())
    assert_equal(1080 , @pub.till())
  end
  def test_buy_if_underage()
    @customer2.buy(@vodka, @pub)
    assert_equal(0, @customer2.drunkness())
    assert_equal(3, @pub.drinks_count())
    assert_equal(100 , @customer2.wallet())
    assert_equal(1000 , @pub.till())
  end
  def test_buy_too_drunk()
    @customer1.buy(@vodka, @pub)
    @customer1.buy(@gin, @pub)
    @customer1.buy(@wine,@pub)


    assert_equal(35, @customer1.drunkness())
    assert_equal(1, @pub.drinks_count())
    assert_equal(170 , @customer1.wallet())
    assert_equal(1130 , @pub.till())
  end
  def test_check_drink_available()
    @customer1.buy(@vodka, @pub)
    @customer1.buy(@gin, @pub)
    @customer1.buy(@vodka, @pub)
    @customer1.buy(@vodka, @pub)

    assert_equal(35, @customer1.drunkness())
    assert_equal(1, @pub.drinks_count())
    assert_equal(170 , @customer1.wallet())
    assert_equal(1130 , @pub.till())
  end
def test_customer_buy_food()
  @customer1.buy_food(@food , @pub )
end
end
