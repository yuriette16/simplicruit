class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.datetime :due_date
      t.string :must_qualities, array: true
      t.references :reject_template, null: false, foreign_key: {to_table: :email_templates}
      t.references :accept_template, null: false, foreign_key: {to_table: :email_templates}
      t.references :pastdue_template, null: false, foreign_key: {to_table: :email_templates}
      t.integer :passing_score
      t.integer :resume_score_ratio

      t.timestamps
    end
  end
end
