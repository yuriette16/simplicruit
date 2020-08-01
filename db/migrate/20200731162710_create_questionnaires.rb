class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.references :question, null: false, foreign_key: true
      t.references :job_application, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
