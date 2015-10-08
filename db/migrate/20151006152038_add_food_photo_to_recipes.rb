class AddFoodPhotoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :foodphoto, :string
  end
end
