class ElectionSheetCandidatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def destroy?
    true
  end
end
