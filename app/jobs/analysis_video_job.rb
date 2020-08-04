class AnalysisVideoJob < ApplicationJob
  def perform(job_application_id)
    job_application = JobApplication.find(job_application_id)
    return  if job_application.video.attached?

    video = SpeechToText.new
    transcript = video.video_transcript(cloudinary_url("#{job_application.video.key}.mp3", :resource_type=>"video"))
    job_application.videotranscript = transcript

    applicant = PersonalityInsightsService.new
    answer = applicant.profile(job_application.videotranscript)
    job_application.video_result = answer
    job_application.save!
  end
end
