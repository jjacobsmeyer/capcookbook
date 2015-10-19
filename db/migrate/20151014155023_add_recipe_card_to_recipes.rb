class AddRecipeCardToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_card, :string
  end
end
