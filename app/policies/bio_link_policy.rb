class BioLinkPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user_id == user.id || user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.by_user(user)
      end
    end
  end
end
