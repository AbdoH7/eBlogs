class PostPolicy < ApplicationPolicy

    class Scope < Scope
        def resolve
            if user
                scope.all
            else
                raise Pundit::NotAuthorizedError, 'Unauthorized'
            end
        end
    end

    def update?
        return record.user.id == user.id
    end

    def create?
        return user
    end
end