class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :election_groups
  has_many :elections, through: :election_groups
end
