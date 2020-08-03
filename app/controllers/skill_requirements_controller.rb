class SkillRequirementsController < ApplicationController
  before_action :find_position, only: [:create]
  before_action :find_skill_requirement, only: [:destroy, :edit, :update]

  def index
    @skill_requirements = policy_scope(SkillRequirement).order('created_at DESC')
    @skill_requirement = SkillRequirement.new
    authorize @skill_requirement
  end

  def edit
  end

  def update
    authorize @skill_requirement
    @skill_requirement.update(skill_requirement_params)
    redirect_to skill_requirements_path
  end

  private

  def find_position
    @position = Position.find(params[:id])
    authorize @position
  end

  def find_skill_requirement
    @skill_requirement = skill_requirement.find(params[:id])
    authorize @skill_requirement
  end

  def skill_requirement_params
    params.require(:skill_requirement).permit(:question_id, :answer)
  end
end
