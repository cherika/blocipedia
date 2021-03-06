require 'faker'

admin_user = User.new(
  name:     'Selene',
  email:    'hakobyan.sn@gmail.com',
  password: 'password',
  role: 'admin'
)
admin_user.skip_confirmation!
admin_user.save!

premium_user = User.new(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'password',
  role: 'premium'
)
premium_user.skip_confirmation!
premium_user.save!

standard_user = User.new(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'password',
  role: 'standard'
)
standard_user.skip_confirmation!
standard_user.save!


10.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all


20.times do |n|
  wiki = Wiki.create!(
    user: User.where(role: 'standard').sample,
    title:  "Public: #{Faker::Lorem.sentence}",
    body:   Faker::Lorem.paragraph
  )
end

us = [admin_user, premium_user]
20.times do |n|
  wiki = Wiki.create!(
    user: us.sample,
    title:  "Private: #{Faker::Lorem.sentence}",
    body:   Faker::Lorem.paragraph, 
    private: true
  )
end

wikis = Wiki.all


puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"