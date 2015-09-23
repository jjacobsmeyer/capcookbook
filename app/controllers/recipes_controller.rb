class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
     @recipe = Recipe.find(params[:id])
     @comments = @recipe.comments
     @comment = Comment.new
  end

  def new
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :category)
  end
  

end
