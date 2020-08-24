class UploadVideoResultJob < ApplicationJob
  def perform(job_application)
    sleep(15)
    puts "Analysising the video"
    require 'json'
    json = File.read(Rails.root.join('lib','seeds','final_personality.json'))
    json = JSON.parse(json)
    job_application.video_result = json
    job_application.save!
    puts "Done! "
  end
end
