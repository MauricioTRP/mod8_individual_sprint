# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Using Faker to create dummy data,\n Don't do this at work"
puts "==========================================="


puts "#{ "\n" * 3 }"
puts "CREATING MASTER TABLES"
puts "============================================"
puts "Creating Industries"

industries = []
40.times do
  industries << Faker::Job.field
end

industries.uniq.each do |industry|
  Industry.create(industry: industry)
end


puts "Creating Jobs"

jobs = []
50.times do
  jobs << Faker::Job.title
end

jobs.uniq.each do |job|
  Job.create({job_title: job, industry_id: rand(Industry.all.length - 1) + 1})
end

puts 'Creating Hobbies'

hobbies = []
40.times do
  hobbies << Faker::Hobby.activity
end

hobbies.uniq.each do |hobby|
  Hobby.create( hobbies: hobby )
end

degree = []
30.times do
  degree << Faker::Educator.degree
end

degree.uniq.each do |degree|
  Degree.create(degree: degree)
end

puts "Create Users"

emails = []
35.times do
  emails << Faker::Internet.email
end

emails.uniq.each do |email|
  User.create(
    {
      name: Faker::Name.name,
      email: email,
      description: Faker::Hipster.sentence(word_count: 3, supplemental: true, random_words_to_add: 4)
    }
  )
end

puts "#{ "\n" * 3 } POPULATING JOIN TABLES #{ "=" * 20 }"

puts "Creating Users Jobs"
40.times do
  UserJob.create(
    {
      user_id:  rand(User.all.length - 1) + 1,
      job_id:   rand(Job.all.length - 1) + 1
    }
  )
end

puts "Creating Users Hobbies"
40.times do
  UserHobby.create(
    {
      user_id:  rand(User.all.length - 1) + 1,
      hobby_id: rand(Hobby.all.length - 1) + 1
    }
  )
end