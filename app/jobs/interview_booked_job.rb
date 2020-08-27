class InterviewBookedJob < ApplicationJob
  def perform(job_application)
    puts "Doing the loadings"
    NotificationMailer.interview_invitation(job_application.candidate_name).deliver
    job_application.interview_date = DateTime.new(2020, 8, 28, 12)
    job_application.status = 1
    job_application.save!
    puts "Finished"
  end
end
