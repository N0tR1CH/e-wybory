class ElectionSheetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return [] unless user.present?

      if user.admin? || user.moderator?
        scope.all
      else
        []
      end
    end
  end

  def new?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def destroy?
    return false unless user.present?

    user.admin? || user.moderator?
  end
end
