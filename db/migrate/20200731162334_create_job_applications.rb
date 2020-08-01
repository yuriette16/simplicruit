class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.string :candidate_name
      t.datetime :apply_date
      t.string :resume_result
      t.text :videotranscript
      t.string :video_result
      t.references :position, null: false, foreign_key: true
      t.string :status, :default => 'pending'

      t.timestamps
    end
  end
end
