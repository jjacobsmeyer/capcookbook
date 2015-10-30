class RecipeAttachment < ActiveRecord::Base
  belongs_to :recipe

  mount_uploader :image, RecipeCardUploader

  def self.recipe_card
    "recipe_card"
  end

  def self.food_photo
    "food_photo"
  end
end
