class RemoveCategoryFromQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    remove_reference :questionnaires,:category, index:true, foreign_key:true
  end
end
