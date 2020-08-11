class MigrationQuestion < ActiveRecord::Migration[6.0]
  def change
     remove_column :questions, :category_id, :integer
     add_reference :questions, :category, foreign_key:true
     add_reference :skill_requirements, :category, foreign_key:true
  end
end
