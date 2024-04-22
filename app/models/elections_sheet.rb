class ElectionsSheet < ApplicationRecord
  belongs_to :election
  has_many :elections_sheets_candidates
  has_many :elections_sheets_users_votes
end
