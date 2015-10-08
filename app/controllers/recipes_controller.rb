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
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe was updated."
      redirect_to @recipe
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end


  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe
    if @recipe.save
      flash[:notice] = "Recipe was saved."
      redirect_to @recipe
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :category, :ingredient, :foodphoto)
  end


end
