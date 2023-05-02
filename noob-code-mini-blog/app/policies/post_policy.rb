class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    user.id == record.user.id || user.kind?
  end
  
  def destroy?
    user.id == record.user.id || user.kind?
  end
end
