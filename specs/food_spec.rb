require("minitest/autorun")
require("minitest/rg")
require_relative("../Food.rb")
require_relative("../Pub.rb")
require_relative("../Drink.rb")
require_relative("../Customer.rb")

class TestFood< MiniTest::Test
  def setup()
    @food = Food.new("sandwitch" , 4 ,10)
  end
  def test_name()
    assert_equal("sandwitch", @food.name())
  end
  def test_price()
    assert_equal(4, @food.price())
  end
  def test_rejuvenation_level()
    assert_equal(10, @food.rejuvenation_level())
  end

end
