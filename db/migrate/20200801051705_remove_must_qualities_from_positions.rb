class RemoveMustQualitiesFromPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :must_qualities, :string
    remove_column :positions, :reject_template_id
    remove_column :positions, :accept_template_id
    remove_column :positions, :pastdue_template_id
    remove_column :positions, :resume_score_ratio
  end
end
