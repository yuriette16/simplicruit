class AddJsonNameToSkillRequirements < ActiveRecord::Migration[6.0]
  def change
    add_column :skill_requirements, :json_name, :string
  end
end
