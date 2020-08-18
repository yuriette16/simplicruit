class StatusJob < ApplicationJob
  def perform(position)
    puts 'Start changing the status'

    sort_applications = position.job_applications.order('video_score DESC NULLS LAST')

    sort_applications.limit(10).each do |job_application|
      if (job_application.status != "processing" && job_application.video_score.present?)
        job_application.status = 3
        job_application.save!
      end
    end

    sort_applications.each do |job_application|
      if job_application.status != "processing"
        if job_application.video_score.nil?
          job_application.status = 4
        elsif job_application.video_score.to_i < position.passing_score
          job_application.status = 5 if job_application.status != "on_hold"
        elsif job_application.video_score.to_i >= position.passing_score
          if job_application.interview_date.present?
            job_application.status = 1
          else
            job_application.status = 2
          end
        end
      end
      job_application.save!
    end
   puts 'Finished'
   end
end
