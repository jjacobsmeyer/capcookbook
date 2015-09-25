class FavoriteMailer < ApplicationMailer
  default from: "jacobsmeyertech@gmail.com"

  def new_comment(user, recipe, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@jjcookbook.herokuapp.com>"
    headers["In-Reply-To"] = "<recipe/#{recipe.id}@jjcookbook.herokuapp.com>"
    headers["References"] = "<recipe/#{recipe.id}@jjcookbook.herokuapp.com>"

    @user = user
    @recipe = recipe
    @comment = comment

    mail(to: user.email, subject: "New comment on #{recipe.title}")
  end
end
