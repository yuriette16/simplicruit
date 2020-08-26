class CreateDefaultSkillRequirementJob < ApplicationJob
  def perform(position_id)
    puts 'Start create skill requirement'
  10.times do |i|
  skill_requirement = SkillRequirement.create(
      position_id: position_id,
      weight: 1,
      minimum_score: 5,
      category_id: (Category.all).first.id + i
    )
    skill_requirement.save!

    if skill_requirement.json_name.nil?
      skill_requirement.json_name = skill_requirement.category.name
      skill_requirement.skill_name = skill_requirement.category.name
      skill_requirement.save!
    end

    if skill_requirement.json_name == "Stress Resistance"
      skill_requirement.json_name = "Susceptible to stress"
      skill_requirement.save!
    end

    position = Position.find(position_id)
    position.passing_score = 0
    position.save!
    end

     puts 'Finished'
  end
end
