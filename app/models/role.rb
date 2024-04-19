class Role < ApplicationRecord
  # Permissions
  # store_attribute :permissions, :vote, :boolean, default: false
  validates :name, presence: true, uniqueness: true
end
