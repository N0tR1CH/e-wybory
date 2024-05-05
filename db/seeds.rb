# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ROLE SEED

Role.create_or_find_by(name: 'admin')
Role.create_or_find_by(name: 'moderator')
Role.create_or_find_by(name: 'user')

UserGroup.destroy_all
Group.destroy_all

Group.create_or_find_by(name: 'Białostoczanie')
Group.create_or_find_by(name: 'Jowiszanie')
Group.create_or_find_by(name: 'Akwareliści')

# USER SEED
user = User.where(email: 'email1@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

user = User.where(email: 'email2@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

user = User.where(email: 'email3@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

user = User.where(email: 'email4@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

user = User.where(email: 'email5@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

user = User.where(email: 'email6@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

user = User.where(email: 'jankowalski1969@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

admin = User.where(email: 'admin@mail.com').first_or_initialize
admin.update!(
  password: 'password',
  password_confirmation: 'password',
  role: Role.find_by(name: 'admin')
)

# GROUP SEED

group_id = Group.find_by(name: 'Białostoczanie').id

UserGroup.create(user_id: User.find_by(email: 'email1@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email2@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email3@mail.com').id, group_id:)

group_id = Group.find_by(name: 'Jowiszanie').id

UserGroup.create(user_id: User.find_by(email: 'email3@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email4@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email5@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email6@mail.com').id, group_id:)

group_id = Group.find_by(name: 'Akwareliści').id

UserGroup.create(user_id: User.find_by(email: 'admin@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email1@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email2@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email3@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email4@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email5@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email6@mail.com').id, group_id:)

# ELECTION SEED

election = Election.create(
  name: 'Wybory seedowe',
  description: 'Wybierz najlepsze nasiona dla plebiscytu stacji TGF11'
)

ElectionGroup.create(election_id: election.id, group_id: group_id)

# SHEET 1

sheet = ElectionSheet.create(
  election_id: election.id,
  name: 'Nasiona rzodkiewki',
  description: 'Wybierz swoje ulubione nasiona rzodkiewki',
  max_votes_per_user: 1,
  max_votes_per_candidate: 1,
  requires_all_votes_spent: true
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Rzodkiewka Opolanka',
  votes: 0
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Rzodkiewka Krakowianka',
  votes: 0
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Rzodkiewka Rampuch',
  votes: 0
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Rzodkiew Kulata Cerna',
  votes: 0
)

# SHEET 2

sheet = ElectionSheet.create(
  election_id: election.id,
  name: 'Nasiona proso',
  description: 'Wybierz swoje ulubione nasiona proso.',
  max_votes_per_user: 3,
  max_votes_per_candidate: 3,
  requires_all_votes_spent: true
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Proso zwyczajne',
  votes: 0
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Proso Fioletowe',
  votes: 0
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Proso Żółte',
  votes: 0
)

ElectionSheetCandidate.create(
  elections_sheet_id: sheet.id,
  name: 'Proso Rózgowate',
  votes: 0
)