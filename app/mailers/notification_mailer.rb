class NotificationMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

  def interview_invitation(candidate_name)
    @candidate = JobApplication.find_by(candidate_name: candidate_name)
    @email = EmailTemplate.find_by(name: "Accepted").subject
    mail(
      subject: @email.subject,
      to: @candidate.email
    ) do |format|
      format.text
    end
  end
end
