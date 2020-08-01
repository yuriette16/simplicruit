class AddEmailToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :email, :string
  end
end
