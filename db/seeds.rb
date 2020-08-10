# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# #
# require 'faker'

# require 'open-uri'
# puts 'Creat a new user...farrah@simplicruit.com'
# main_user = User.create(
#   name: 'Farrah',
#   email: 'farrah@simplicruit.com',
#   password: '123456')
# puts 'Finished'

# puts 'Create position 1...'
# positions = Position.create(
#     title: 'Customer Service Representative',
#     due_date: Faker::Date.in_date_period(year: 2020, month: 10),
#     target_hire_number: 10
# )
# puts 'Finished'

# puts 'Create a position 2...'
# positions = Position.create(
#     title: 'Call Center Representative',
#     due_date: Faker::Date.in_date_period(year: 2020, month: 12),
#     target_hire_number: 20
# )
# puts 'Finished'

# puts 'Create a position 3 ...'
# positions = Position.create(
#     title: 'Operations Manager',
#     due_date: Faker::Date.in_date_period(year: 2020, month: 12),
#     target_hire_number: 1
# )
# puts 'Finished'

# puts 'Create a position 4...'
# positions = Position.create(
#     title: 'Member Services Specialist',
#     due_date: Faker::Date.in_date_period(year: 2020, month: 10),
#     target_hire_number: 3
# )
# puts 'Finished'

# puts 'Create a job_application <testing one> for Customer Service Representative...'
# test_position = JobApplication.create(
#     candidate_name: 'Sophia Smith',
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     gender: 'female',
#     status: 2,
#     position_id: 1
# )
# puts 'Finished'

# puts 'Create a job_application for Customer Service Representative ...'
# 20.times do |i|
# positions = JobApplication.create(
#     candidate_name: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     gender: ['male','female'].sample,
#     video_score: rand(40..65),
#     position_id: 1
# )
# end
# puts 'Finished'

# puts 'Create a job_application for Customer Service Representative ...'
# 5.times do |i|
# positions = JobApplication.create(
#     candidate_name: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     gender: ['male','female'].sample,
#     position_id: 1
# )
# end
# puts 'Finished'

# puts 'Create a job_application for Member Services Specialist ...'
# 1

# positions = JobApplication.create(
#     candidate_name: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     gender: ['male','female'].sample,
#     video_score: rand(30..80),
#     position_id: 4
# )
# end
# puts 'Finished'

# puts 'Create a job_application for Operations Manager ...'
# 13.times do |i|
# positions = JobApplication.create(
#     candidate_name: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     gender: ['male','female'].sample,
#     video_score: rand(30..60),
#     position_id: 3
# )
# end
# puts 'Finished'

# puts 'Create a job_application for Call Center Representative ...'
# 20.times do |i|
# positions = JobApplication.create(
#     candidate_name: Faker::Name.name,
#     email: Faker::Internet.email,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.cell_phone,
#     gender: ['male','female'].sample,
#     video_score: rand(30..80),
#     position_id: 2
# )
# end
# puts 'Finished'


# interview date will seed after.
# interview_date: Faker::Time.in_date_period(year: 2020, month: 9,period: :evening),

# require 'csv'
# puts 'Create the question database'
# csv_text =File.read(Rails.root.join('lib','seeds','questions.csv'))
# csv = CSV.parse(csv_text,:headers =>true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#   t = Question.new
#   t.question = row['question']
#   t.category = row['category']
#   t.save
# end
# puts 'Finished'


# require 'csv'
# puts 'Create the skill_requirements database'
# csv_text =File.read(Rails.root.join('lib','seeds','skill_requirement.csv'))
# csv = CSV.parse(csv_text,:headers =>true, :encoding => 'ISO-8859-1')

# csv.each do |row|
#   t = SkillRequirement.new
#   t.position_id = row['position_id']
#   t.weight = row['weight']
#   t.minimum_score = row['minimum_score']
#   t.skill_name = row['skill_name']
#   t.json_name = row['json_name']
#   t.save
# end
# puts 'Finished'

# puts 'Make farrah@simplicruit.com as admin.'
# user= User.where(email: 'farrah@simplicruit.com').first
# user.password = '123456'
# user.admin = true
# user.save!
# puts'Finished'

# puts 'Modify the status <testing one> for Customer Service Representative...'
Position.find(1).job_applications.each do |job_application|
  if job_application.video_score.to_i > 60
    job_application.status = 1
    job_application.save!
  end
end
#   elsif job_application.video_score.to_i < 50
#     job_application.status = 3
#     job_application.save!
#   elsif job_application.video_score.nil?
#     job_application.status = 2
#     job_application.save!
#   end
# end
# puts 'Finished'

Position.find(1).job_applications.each do |job_application|
   if job_application.video_score.nil?
      job_application.status = 2
      job_application.save!
  end
end
# puts 'Editing a job_application <testing one> for Customer Service Representative...'
# application = JobApplication.find(1)
# application.videotranscript = File.read(Rails.root.join('lib','seeds','video_transcript.txt'))
# require 'json'
# json = File.read(Rails.root.join('lib','seeds','personality.json'))
# json = JSON.parse(json)
# application.video_result  = json

# application.interview_date = DateTime.new(2020,8,10,1)
# application.video_score = 71
# application.status = 0

# # application.video.attach(io: File.open('public/demo2.mp4'), filename: 'interview.mp4')
# application.save!
# puts 'Finished'






