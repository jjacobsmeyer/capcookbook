class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :groceries
  has_many :recipe_attachments

  accepts_nested_attributes_for :recipe_attachments

  mount_uploader :food_photo, FoodPhotoUploader
  # mount_uploader :recipe_card, RecipeCardUploader

  def upload_images(image_params)
    image_params.each do |a|
      recipe_attachments.create(image: a)
    end
  end

  def grocery_list
    @recipe.ingredients.each_line do |line|
      line
    end
  end

end
