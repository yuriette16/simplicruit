class PassingScore
  def cal_passing_score(skill_requirements)
    max_score = 0
    passing_score = 0
    skill_requirements.each do |sk|
      max_score += sk.read_attribute_before_type_cast(:weight) * 10
      passing_score += sk.read_attribute_before_type_cast(:weight) * sk.minimum_score
    end

    return (passing_score * 100 / max_score).round
  end
end
