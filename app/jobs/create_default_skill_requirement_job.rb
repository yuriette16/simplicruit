class CreateDefaultSkillRequirementJob < ApplicationJob
  def perform(position_id)
    puts 'Start create skill requirement'
    10.times do |i|
    skill_requirement = SkillRequirement.create(
      position_id: position_id,
      weight: 3,
      category_id: (Category.all).first.id + i
    )
    skill_requirement.save!

    position = Position.find(position_id)
    position.passing_score = 0
    position.save!
    end
     puts 'Finished'
  end
end
