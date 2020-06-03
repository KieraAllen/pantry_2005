class Pantry
    attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, amount_needed|
      if stock_check(ingredient) < amount_needed
        return false
      end
    end
    true
  end
end
