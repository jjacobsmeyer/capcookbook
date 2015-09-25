class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user


  after_create :send_favorite_emails

  private

  def send_favorite_emails
    recipe.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, recipe, self).deliver_now
    end
  end
  
end
