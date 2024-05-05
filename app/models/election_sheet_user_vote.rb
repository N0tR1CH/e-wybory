class ElectionSheetUserVote < ApplicationRecord
  belongs_to :election_sheet
  belongs_to :user
end
