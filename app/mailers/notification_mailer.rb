class NotificationMailer < ActionMailer::Base
  default from: "recruit.farrah@gmail.com"

  def interview_invitation(candidate_name)
    @candidate = JobApplication.find_by(candidate_name: candidate_name)
    mail(
      subject: "Invitation to 2nd interview with CallBest for #{@candidate.position.title} position",
      to: @candidate.email
    ) do |format|
      format.text
    end
  end

  def video_record(application)
    @candidate = application
    mail(
      subject: "Invitation to video interview with CallBest for the #{@candidate.position.title} position",
      to: @candidate.email
    ) do |format|
      format.text
    end
  end
end
