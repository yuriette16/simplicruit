class CreateOneApplicationJob < ApplicationJob
  def perform(position_id)
    sleep(3)
    puts "application creating..."
    positions = JobApplication.create(
      candidate_name: 'Linlu Liu',
      email: 'linluuliu@gmail.com',
      address: '1-chōme-2 Takadanobaba, Shinjuku City, Tōkyō-to 169-0075',
      phone: '020-1231-2492',
      gender: 'female',
      position_id: position_id
    )
    puts "finish created"

    puts "sending email"
    application = JobApplication.last
    NotificationMailer.video_record(application).deliver
    puts "all done"

    puts 'Create a job_application for Customer Service Representative ...'
    9.times do
      job = JobApplication.create(
      candidate_name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone,
      gender: ['male', 'female'].sample
      )
      job.position_id = position_id
      job.save!
    end
    puts 'Finished'

    puts 'Create a unqualified job_application for Customer Service Representative ...'
    2.times do
      job = JobApplication.create(
      candidate_name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone,
      gender: ['male', 'female'].sample,
      video_score: [25,27,28,26,29].sample,
      status: "unqualified"
      )
      job.position_id = position_id
      job.save!
    end

    puts 'Create a invited job_application for Customer Service Representative ...'
    1.times do
      job = JobApplication.create(
      candidate_name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone,
      gender: ['male', 'female'].sample,
      video_score: [70, 75, 71, 73].sample,
      status: "invited"
      )
      job.position_id = position_id
      job.save!
    end
    puts 'Finished'
  end
end
