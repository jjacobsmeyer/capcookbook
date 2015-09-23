class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
    @comment= Comment.new(comment_params)
    @comment.user = current_user
    @comment.recipe = @recipe
    @new_comment = Comment.new

    authorize @comments

    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to @recipe
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to @recipe
    else
      flash[:error] = "Comment could be deleted. Try again."
      redirect_to @recipe
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
