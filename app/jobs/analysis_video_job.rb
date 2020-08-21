class AnalysisVideoJob < ApplicationJob
  def perform(job_application_id)
    job_application = JobApplication.find(job_application_id)
    puts "Changing the video to text"

    puts "HappyScribe"
    video = HappyScribe.new
    transcript = video.video_transcript("https://res.cloudinary.com/kwy031820/video/upload/#{job_application.video.key}.wav")
    json = JSON.parse(transcript)
    p trascript_id = json["id"]
    puts "Finish upload the video"

    result = HappyScribeExport.new
    text = result.transcript_export(trascript_id)
    json_text = JSON.parse(text)
    p export_id = json_text["id"]
    puts "Finish export the key"
    job_application.status = 0
    job_application.save!

    result_export = "pending"
    until result_export == "ready"
      puts "transcript is not ready!"
      sleep(15)
      export = HappyScribeDownload.new
      p download = export.transcript_export(export_id)
      result_export = download["state"]
    end

   puts "export the transcript"
    require 'open-uri'
      result = []
      open(download["download_link"]) do |file|
        result << file.read
      end
      job_application.videotranscript = result[0]
      job_application.save!
      puts "Finish the video transcript!"
             CreateNotification.call(
        contents: { 'en' => 'One video has uploaded!！' },
        type: 'job_applications#update'
      )

    puts "Analysising the video"
    applicant = PersonalityInsightsService.new
    answer = applicant.profile(job_application.videotranscript)
    job_application.video_result = JSON.parse(answer)
    job_application.status = 3
    job_application.save!
    puts "Finish analysing"
      sleep(15)
      CreateNotification.call(
      contents: { 'en' => 'Analysis Report is done!' },
      type: 'job_applications#update'
    )
  end
  # def perform(job_application_id)
  #   job_application = JobApplication.find(job_application_id)
  #   puts "Changing the video to text"
  #   job_application.videotranscript = File.read(Rails.root.join('lib','seeds','video_transcript.txt'))
  #   job_application.status = 0
  #   job_application.save!
  #       CreateNotification.call(
  #     contents: { 'en' => '1 Video is uploaded!！' },
  #     type: 'job_applications#update'
  #   )
  #   puts "Done! "

  #   sleep(15)

  #   puts "Analysising the video"
  #   require 'json'
  #   json = File.read(Rails.root.join('lib','seeds','personality.json'))
  #   json = JSON.parse(json)
  #   job_application.video_result = json
  #   job_application.save!
  #   puts "Done! "
  # end
end
