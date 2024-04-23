class Election < ApplicationRecord
  has_many :election_groups, dependent: :delete_all
  has_many :elections_sheets, dependent: :destroy
  has_many :groups, through: :election_groups
end
