class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.kind == 'admin' 
  end

  def update?
    user.kind == 'admin'
  end

  def destroy?
    user.kind == 'admin'
  end
end
