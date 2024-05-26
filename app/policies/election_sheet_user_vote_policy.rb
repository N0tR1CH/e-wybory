# frozen_string_literal: true

class ElectionSheetUserVotePolicy < ApplicationPolicy
  def create?
    true
  end
end
