class ChangeApplyDateToInterviewDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_applications, :apply_date, :interview_date
  end
end
