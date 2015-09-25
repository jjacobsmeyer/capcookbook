class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :favorites, dependent: :destroy

end
