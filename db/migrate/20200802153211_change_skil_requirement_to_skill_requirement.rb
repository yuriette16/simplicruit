class ChangeSkilRequirementToSkillRequirement < ActiveRecord::Migration[6.0]
  def change
    rename_table :skil_requirements, :skill_requirements
  end
end
