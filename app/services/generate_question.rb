class GenerateQuestion
  def generate_questions(job_application, skill_names_array, required_skills)
    # skill_names_array: picked skills (name and percentile) from Watson Personality Insights for a position
    # required_skills: skill_requirenment instances
    # pick category
    auto_questions_categories = []
    skill_names_array.each do |skill_name_watson|
      next if (skill_name_watson[:percentile] * 10).round >= 9

      required_skills.each do |required_skill|
        if skill_name_watson[:name] == required_skill.json_name
          # auto generate questions
          if (skill_name_watson[:percentile] * 10).round - required_skill.minimum_score < 2
            if required_skill.json_name == "Susceptible to stress"
              name = "Stress Resistance"
            else
              name = required_skill.json_name
            end
            auto_questions_categories << name
          end
        end
      end
    end

    picked_questions_instances = pick_questions_for_category(auto_questions_categories)
    make_questionnaires(job_application, picked_questions_instances)
  end

  # pick questions instances
  private

  def pick_questions_for_category(auto_questions_categories)
    picked_questions = []
    auto_questions_categories.each do |auto_questions_category|
      id = Category.find_by(name: auto_questions_category).id
      picked_questions_array = Question.where(category_id: id)
      picked_questions << picked_questions_array.sample(2)
    end
    return picked_questions.flatten!
  end

  def make_questionnaires(job_application, picked_questions_instances)
    picked_questions_instances.each do |picked_questions_instance|
      picked_questionnaires_instance = Questionnaire.new("question_id": picked_questions_instance.id, "job_application_id": job_application.id)
      picked_questionnaires_instance.save
    end
  end
end
