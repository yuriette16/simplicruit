class ChangeDataTypeForJobApplications < ActiveRecord::Migration[6.0]
  def change
     remove_column :job_applications, :status, :string
     add_column :job_applications, :status, :integer
  end
end
