class AddFoodPhotoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :food_photo, :string
  end
end
