class AddIngredientToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredient, :text
  end
end
