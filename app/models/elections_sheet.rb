class ElectionsSheet < ApplicationRecord
  belongs_to :election
  has_many :elections_sheets_candidates, dependent: :destroy
  has_many :elections_sheets_users_votes, dependent: :delete_all
end
