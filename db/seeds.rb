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
Role.create_or_find_by!(name: 'admin')
Role.create_or_find_by!(name: 'moderator')
Role.create_or_find_by!(name: 'user')

# USER SEED
user = User.where(email: 'jankowalski1969@mail.com').first_or_initialize
user.update!(password: 'password', password_confirmation: 'password')

admin = User.where(email: 'admin@mail.com').first_or_initialize
admin.update!(password: 'password', password_confirmation: 'password')
