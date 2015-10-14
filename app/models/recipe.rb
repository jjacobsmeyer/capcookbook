class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :favorites, dependent: :destroy
  mount_uploader :foodphoto, FoodPhotoUploader
  mount_uploader :recipecard, RecipeCardUploader
end
