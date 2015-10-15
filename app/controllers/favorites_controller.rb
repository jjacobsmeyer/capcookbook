class FavoritesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.build(recipe: recipe)
    authorize favorite
    if favorite.save
      flash[:notice] = "Your favorite was saved."
      redirect_to @recipe
    else
      flash[:error] = "There was an error saving your favorite."
      redirect_to @recipe
    end

  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    favorite = Favorite.find(params[:id])
     authorize favorite
    if favorite.destroy
      flash[:notice] = "Favorite successfully deleted!"
      redirect_to favorite.recipe
    else
      flash[:error] = "There was a error in deleting your favorite."
      redirect_to @recipe
    end

  end
end
