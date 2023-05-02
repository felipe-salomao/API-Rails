class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.kind?
  end

  def update?
    user.kind?
  end

  def destroy?
    user.kind?
  end
end
