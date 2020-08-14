class AnalysisVideoJob < ApplicationJob
  # def perform(job_application_id)
  #   job_application = JobApplication.find(job_application_id)
  #   puts "Changing the video to text"
  #   video = SpeechToTextService.new
  #   transcript = video.video_transcript("https://res.cloudinary.com/kwy031820/video/upload/#{job_application.video.key}.mp3")
  #   job_application.videotranscript = transcript
  #   job_application.save!
  #   puts "Finished!"
  #     CreateNotification.call(
  #     contents: { 'en' => '1 Video is uploaded!！' },
  #     type: 'job_applications#update'
  #   )

  #   sleep(45)

  #   puts "Analysising the video"
  #   applicant = PersonalityInsightsService.new
  #   answer = applicant.profile(job_application.videotranscript)
  #   job_application.video_result = answer
  #   job_application.save!
  # end
  def perform(job_application_id)
    job_application = JobApplication.find(job_application_id)
    puts "Changing the video to text"
    job_application.videotranscript = File.read(Rails.root.join('lib','seeds','video_transcript.txt'))
    job_application.status = 0
    job_application.save!
        CreateNotification.call(
      contents: { 'en' => '1 Video is uploaded!！' },
      type: 'job_applications#update'
    )
    puts "Done! "

    sleep(45)

    puts "Analysising the video"
    require 'json'
    json = File.read(Rails.root.join('lib','seeds','personality.json'))
    json = JSON.parse(json)
    job_application.video_result = json
    job_application.save!
    puts "Done! "
  end
end
