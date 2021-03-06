class RecipesController < ApplicationController
  def index
    @category = params[:category]
    if @category.present?
      @recipes = Recipe.where(category: @category)
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
    @comment = Comment.new
    @recipe_attachments = @recipe.recipe_attachments.all

    respond_to do |format|
     format.html
      format.pdf do
       render pdf: @recipe.title   # Excluding ".pdf" extension.
     end
    end

  end

  def new
    @recipe = Recipe.new
    @recipe_attachment = @recipe.recipe_attachments.build
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_attachment = @recipe.recipe_attachments.build
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    if @recipe.update_attributes(recipe_params)
      @recipe.upload_images(params[:recipe_attachments][:images]) if params[:recipe_attachments]
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
      @recipe.upload_images(params[:recipe_attachments][:images]) if params[:recipe_attachments]
      flash[:notice] = "Recipe was saved."
      redirect_to @recipe
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :category, :ingredient, :food_photo, recipe_attachments_attributes: [:images])
  end
end
