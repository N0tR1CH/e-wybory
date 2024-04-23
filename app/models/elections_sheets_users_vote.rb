class ElectionsSheetsUsersVote < ApplicationRecord
  belongs_to :elections_sheet
  belongs_to :user
end
