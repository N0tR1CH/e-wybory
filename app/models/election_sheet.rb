class ElectionSheet < ApplicationRecord
  belongs_to :election
  has_many :election_sheet_candidates, dependent: :destroy
  has_many :elections_sheets_users_votes, dependent: :delete_all
end
