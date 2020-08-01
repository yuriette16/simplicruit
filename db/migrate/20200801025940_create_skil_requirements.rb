class CreateSkilRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :skil_requirements do |t|
      t.references :position, null: false, foreign_key: true
      t.integer :weight
      t.integer :minimum_score
      t.integer :skill_name

      t.timestamps
    end
  end
end
