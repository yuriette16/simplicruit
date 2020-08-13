class AddPassingScoretoPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :passing_score, :integer
  end
end
