class InterviewBookedJob < ApplicationJob
  def perform(job_application_id)
    puts "Doing the loading"
    application = JobApplication.find(job_application_id)
    NotificationMailer.interview_invitation(application.candidate_name).deliver
    application.interview_date = DateTime.new(2020, 8, 28, 12)
    application.status = 1
    application.save!
    puts "Finished"
  end
end
