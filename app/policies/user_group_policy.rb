class UserGroupPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.admin? || user.moderator?
  end

  def new?
    create?
  end

  def show?
    user.admin? || user.moderator?
  end

  def create?
    user.admin? || user.moderator?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || user.moderator?
  end

  def destroy?
    user.admin? || user.moderator?
  end
end
