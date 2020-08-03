class AddVideoScoreToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :video_score, :integer
  end
end
