class AddTargetHireNumberToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :target_hire_number, :integer
  end
end
