class RemoveCategoryFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :category, :string
    add_reference :questionnaires, :category, foreign_key:true
  end
end
