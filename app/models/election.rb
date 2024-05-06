class Election < ApplicationRecord
  has_many :election_groups, dependent: :delete_all
  has_many :election_sheets, dependent: :destroy
  has_many :groups, through: :election_groups
  has_many :users, through: :groups
  has_many :election_sheet_user_votes

  accepts_nested_attributes_for :election_sheets
end
