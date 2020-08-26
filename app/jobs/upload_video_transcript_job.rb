class UploadVideoTranscriptJob < ApplicationJob
  def perform(job_application)
    puts "Add the video_transcript"
    job_application.videotranscript = File.read(Rails.root.join('lib','seeds','final_video_transcript.txt'))
    job_application.status = 0
    job_application.save!
    puts "Done! "

    puts 'Create a job_application for Customer Service Representative ...'
    9.times do
      job = JobApplication.create(
      candidate_name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone,
      gender: ['male', 'female'].sample
      )
      job.position_id = job_application.position_id
      job.save!
    end
    puts 'Finished'

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
      job.position_id = job_application.position_id
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
      job.position_id = job_application.position_id
      job.save!
    end
    puts 'Finished'
  end
end
