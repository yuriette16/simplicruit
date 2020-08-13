class SkillRequirementsController < ApplicationController
  before_action :find_position, only: [:index,:create,:edit_all]
  before_action :find_skill_requirement, only: [:destroy, :edit]

  def index
    @skill_requirements = policy_scope(SkillRequirement).where(position_id: @position)
    if @skill_requirements.first.present?
      redirect_to position_skill_requirement_edit_all_path(@position)
    else
      @skill_requirement = SkillRequirement.new
    end
  end

  def edit_all
    @skill_requirements = @position.skill_requirements
    if @skill_requirements.first.nil?
      redirect_to position_skill_requirements_path(@position)
    else
      passing_score = PassingScore.new
      @passing_score = passing_score.cal_passing_score(@skill_requirements)
      @position.passing_score = @passing_score
      @position.save

      @skill_requirements.each do |sk|
        if sk.json_name.nil?
          sk.category.name = sk.json_name
          sk.category.name = sk.skill_name
          sk.save!
        end
      end
    end
  end

  def update_all
    position_id = params[:position_id]

    params[:skill_requirement].keys.each do |id|
      @skill_requirement = SkillRequirement.find(id.to_i)
      @skill_requirement.update_attributes(params[:skill_requirement][id].to_unsafe_h)
    end
      redirect_to position_skill_requirement_edit_all_path(position_id)
  end

  private

  def find_position
    @position = Position.find(params[:position_id])
  end

  def find_skill_requirement
    @skill_requirement = skill_requirement.find(params[:id])
    authorize @skill_requirement
  end

  def skill_requirement_params
    if params[:skill_requirement]
      params.require(:skill_requirement).permit(:weight,:minimum_score,:skill_name,:json_name,:category_id)
    end
  end
end
