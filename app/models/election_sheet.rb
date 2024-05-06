class ElectionSheet < ApplicationRecord
  belongs_to :election
  has_many :election_sheet_candidates, dependent: :destroy
  has_many :election_sheet_user_votes, dependent: :delete_all

  accepts_nested_attributes_for :election_sheet_candidates
end
