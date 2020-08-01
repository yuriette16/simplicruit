
class AddColumnsToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :address, :text
    add_column :job_applications, :phone, :string
    add_column :job_applications, :gender, :string
  end
end
