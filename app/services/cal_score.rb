class CalScore
  def cal_overall_score(skill_names_array, required_skills)
    # skill_names_array: picked skills (name and percentile) from Watson Personality Insights for a position
    # required_skills: skill_requirenment instances
    overall_score = 0
    maximum_score = 1
    skill_names_array.each do |skill_name_watson|
      required_skills.each do |required_skill|
        if required_skill.skill_name == skill_name_watson[:name]
          overall_score += (skill_name_watson[:percentile] * 10 * required_skill.weight).round
          break
        end
      end
    end

    # maximum score
    required_skills.each do |required_skill|
      maximum_score += required_skill.weight * 10
    end

    return overall_score * 100 / maximum_score
  end
end
