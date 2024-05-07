class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :elections, through: :groups
  has_many :election_sheets, through: :elections
  has_many :election_sheet_user_votes, through: :election_sheets

  before_validation do
    self.role ||= Role.find_by(name: 'user')
  end

  def admin?
    role.name == 'admin'
  end

  def user?
    role.name == 'user'
  end

  def moderator?
    role.name == 'moderator'
  end
end
