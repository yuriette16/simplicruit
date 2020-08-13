class InterviewBookedJob < ApplicationJob
  def perform(job_application_id)
    puts"Doing the loading"
    sleep(60)
    application = JobApplication.find(job_application_id)
    application.interview_date = DateTime.new(2020,9,11,1)
    application.status = 0
    CreateNotification.call(
      contents: { 'en' => 'Candidate booked the interview!' },
      type: 'job_applications#show'
    )
    application.save!
    puts"Finished"
  end
end
