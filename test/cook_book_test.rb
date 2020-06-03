require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test

  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @cookbook = CookBook.new

    @pantry = Pantry.new

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_can_add_recipes
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_it_can_list_ingredients
    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end

  def test_it_can_find_highest_calorie_meal
    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end
end


# pry(main)> pantry.restock(ingredient1, 5)
#
# pry(main)> pantry.restock(ingredient1, 10)
#
# pry(main)> pantry.enough_ingredients_for?(recipe1)
# # => false
#
# pry(main)> pantry.restock(ingredient2, 7)
#
# pry(main)> pantry.enough_ingredients_for?(recipe1)
# # => false
#
# pry(main)> pantry.restock(ingredient2, 1)
#
# pry(main)> pantry.enough_ingredients_for?(recipe1)
# # => true
