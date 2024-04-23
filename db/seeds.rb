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

UserGroup.create(user_id: User.find_by(email: 'email1@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email2@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email3@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email4@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email5@mail.com').id, group_id:)
UserGroup.create(user_id: User.find_by(email: 'email6@mail.com').id, group_id:)
