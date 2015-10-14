class AddRecipeCardToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :recipecard, :string
  end
end
