class NotificationMailer < ActionMailer::Base
  default from: "recruit.farrah@gmail.com"

  def interview_invitation(candidate_name)
    @candidate = JobApplication.find_by(candidate_name: candidate_name)
    @email = EmailTemplate.find_by(name: "Accepted")
    mail(
      subject: "Invitation to 2nd interview with CallBest for #{@candidate.position.title} position",
      to: @candidate.email
    ) do |format|
      format.text
    end
  end
end
