require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'

class IngredientTest < Minitest::Test

  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_no_stock
    assert_equal ({}), @pantry.stock
  end

  def test_it_can_check_the_stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end
end


# pry(main)> pantry.stock_check(ingredient1)
# # => 0
#
# pry(main)> pantry.restock(ingredient1, 5)
#
# pry(main)> pantry.restock(ingredient1, 10)
#
# pry(main)> pantry.stock_check(ingredient1)
# # => 15
#
# pry(main)> pantry.restock(ingredient2, 7)
#
# pry(main)> pantry.stock_check(ingredient2)
# # => 7
