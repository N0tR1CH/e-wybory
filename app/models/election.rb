class Election < ApplicationRecord
  has_many :election_groups
  has_many :groups, through: :election_groups
end
