# frozen_string_literal: true

class ElectionPolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        # TODO: Users should only see elections they are eligible to vote in
        []
      end
    end
  end

  def index?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def new?
    create?
  end

  def create?
    return false unless user.present?

    user.admin? || user.moderator?
  end
end
