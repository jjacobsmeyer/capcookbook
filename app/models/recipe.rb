class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :groceries
  mount_uploader :food_photo, FoodPhotoUploader
  mount_uploader :recipe_card, RecipeCardUploader

  def grocery_list
    @recipe.ingredients.each_line do |line|
      line
    end
  end
  
end
