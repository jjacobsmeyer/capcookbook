class RecipesController < ApplicationController
  def index
    if params[:category].present?
      @recipes = Recipe.where(category: params[:category])
    else
      @recipes = Recipe.all
    end
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

  def vegetables
  end

  def meat
  end

  def seafood
  end



  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :category)
  end


end
