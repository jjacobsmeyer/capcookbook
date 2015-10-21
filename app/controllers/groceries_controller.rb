class GroceriesController < ApplicationController

  def index
    @user = current_user
    # @groceries = Groceries.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient
  end
  

  def show
    @user = current_user
    # @groceries = Groceries.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient
  end

  def create
    @user = current_user
    @grocery = @recipe.ingredients
  end

  def destroy
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name)
  end

end
