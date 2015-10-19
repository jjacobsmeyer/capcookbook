class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :favorites, dependent: :destroy
  mount_uploader :food_photo, FoodPhotoUploader
  mount_uploader :recipe_card, RecipeCardUploader
end
