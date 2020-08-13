class CalScore
  def cal_overall_score(skill_names_array, required_skills)
    # skill_names_array: picked skills (name and percentile) from Watson Personality Insights for a position
    # required_skills: skill_requirenment instances
    overall_score = 0
    maximum_score = 1
    result = true
    skill_names_array.each do |skill_name_watson|
      required_skills.each do |required_skill|
        if required_skill.json_name == skill_name_watson[:name]
          if required_skill.json_name == "Susceptible to stress"
            actual_score = (10 - skill_name_watson[:percentile] * 10).round
            result = false if actual_score < required_skill.minimum_score
          else
            result = false if (skill_name_watson[:percentile] * 10).round < required_skill.minimum_score
          end

          if result == false
            overall_score = 0
          else
            if required_skill.json_name == "Susceptible to stress"
              overall_score += actual_score * required_skill.read_attribute_before_type_cast(:weight)
            else
              overall_score += ((skill_name_watson[:percentile]) * 10 * required_skill.read_attribute_before_type_cast(:weight))
            end
          end
        end
      end
    end

    # maximum score
    required_skills.each do |required_skill|
      maximum_score += required_skill.read_attribute_before_type_cast(:weight) * 10
    end

    return (overall_score * 100 / maximum_score).round
  end
end
