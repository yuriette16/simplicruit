class RemovePassingScoreFromPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :passing_score
  end
end
