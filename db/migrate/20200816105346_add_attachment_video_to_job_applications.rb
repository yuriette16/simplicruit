class AddAttachmentVideoToJobApplications <  ActiveRecord::Migration[6.0]
  def self.up
    change_table :job_applications do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :job_applications, :video
  end
end
