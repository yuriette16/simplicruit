class AddDefaultValueToSkillRequirement < ActiveRecord::Migration[6.0]
  def change
    change_column_default :skill_requirements, :minimum_score, 0
  end
end
