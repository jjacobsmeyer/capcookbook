class User < ActiveRecord::Base
  has_many :comments
  has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    role == 'admin'
  end

  def favorited(recipe)
    favorites.where(recipe_id: recipe.id).first
  end


end
