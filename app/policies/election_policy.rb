# frozen_string_literal: true

class ElectionPolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        # TODO: Users should only see elections they are eligible to vote in
        scope.joins(groups: :users).where(users: { id: user.id }).distinct
      end
    end
  end

  def vote?
    election_sheet_ids = election.election_sheets.pluck(:id)
    election_sheets_voted_count = ElectionSheetUserVote.where(election_sheet_id: election_sheet_ids, user:).count

    election_sheet_ids.count != election_sheets_voted_count
  end

  def index?
    user.present?
  end

  def new?
    create?
  end

  def create?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def recent?
    user.present?
  end

  def current?
    user.present?
  end

  def upcoming?
    user.present?
  end

  def edit?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def update?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def destroy?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def election_sheet_field?
    return false unless user.present?

    user.admin? || user.moderator?
  end

  def results?
    return false unless user.present?

    return true if user.admin? || user.moderator?

    election_date_to = election.date_to || DateTime.new(1)

    election.users.exists?(users: { id: user.id }) && election_date_to < DateTime.now
  end

  def pdf_preview?
    return false unless user.present?

    return true if user.admin? || user.moderator?

    election_date_to = election.date_to || DateTime.new(1)

    election.users.exists?(users: { id: user.id }) && election_date_to < DateTime.now
  end

  def pdf?
    pdf_preview?
  end

  private

  def election
    record
  end
end
