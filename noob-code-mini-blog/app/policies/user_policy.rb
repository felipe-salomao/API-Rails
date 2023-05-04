class UserPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def show?
        user.id == record.id || user.kind==admin?
    end
  
    def update?
        user.id == record.id || user.kind==admin?
    end
    
    def destroy?
        user.id == record.id || user.kind==admin?
    end
  end
  