class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.joins(:favorites).where('favorites.user_id = ?', @user.id)
    @favorites = current_user.favorites
    @comments = current_user.comments
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
