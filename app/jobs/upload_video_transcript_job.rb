class UploadVideoTranscriptJob < ApplicationJob
  def perform(job_application)
    puts "Add the video_transcript"
    job_application.videotranscript = File.read(Rails.root.join('lib','seeds','final_video_transcript.txt'))
    job_application.status = 0
    job_application.save!
    puts "Done! "
  end
end
