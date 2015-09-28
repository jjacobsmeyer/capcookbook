class RecipePolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user && user.admin?
  end

  def edit?
    create?
  end

  def update?
    create?
  end
  

end
