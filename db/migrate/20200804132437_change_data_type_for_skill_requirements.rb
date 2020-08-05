class ChangeDataTypeForSkillRequirements < ActiveRecord::Migration[6.0]
  def change
      change_column(:skill_requirements, :skill_name, :string)
  end
end
