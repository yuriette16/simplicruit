# Find a personality name and its score from skill_name json for a job_application
class ExtractSkill

  def get_required_skills(job_application)
    position = job_application.position
    required_skills_array = SkillRequirement.where(position_id: position)
  end

  def extract_requirement_skills(job_application, required_skills_array)
    skill_names_array = []
    personality_result = job_application.video_result
    required_skills_array.each do |skill|
      skill_names_array << search_skill(personality_result, skill.json_name)
    end
    return skill_names_array
  end

  private

  def search_skill(personality_result, skill_name)
    personality_result["personality"].each do |main_personality|

      if skill_name == main_personality["name"]
        puts "#{main_personality["name"]} for #{skill_name}"
        return {"name": main_personality["name"], "json_name": main_personality["json_name"], "percentile": main_personality["percentile"]}
      end

      main_personality["children"].each do |minor_personality|
        if skill_name == minor_personality["name"]
          puts "#{minor_personality["name"]} for #{skill_name}"
          return {"name": minor_personality["name"], "json_name": minor_personality["json_name"], "percentile": minor_personality["percentile"]}
        end
      end
    end

    personality_result["needs"].each do |need|
      if skill_name == need["name"]
        puts "#{need["name"]} for #{skill_name}"
      return {"name": need["name"], "json_name": need["json_name"], "percentile": need["percentile"]}
      end
    end

    personality_result["values"].each do |value|
      if skill_name == value["name"]
        puts "#{value["name"]} for #{skill_name}"
      return {"name": value["name"], "json_name": value["json_name"], "percentile": value["percentile"]}
      end
    end
  end
end
