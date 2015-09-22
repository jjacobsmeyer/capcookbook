class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
  end

  def edit
  end

end
