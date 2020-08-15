class PositionsController < ApplicationController
  def index
    @positions = policy_scope(Position).order(due_date: :asc)
    respond_to do |format|
      format.html
      format.json { render json: { positions: @positions } }
    end

    @positions.each do |position|
      StatusJob.perform_now(position)
    end

    @positions.each do |position|
      if position.skill_requirements.first.nil?
        CreateDefaultSkillRequirementJob.perform_later(position.id)
      end
    end
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    authorize @position
    if @position.save
      redirect_to positions_path
    else
      redirect_to positions_path
      flash.alert = 'Sorry, something goes wrong!'
    end
  end

  private

  def position_params
    params.require(:position).permit(:title, :due_date, :target_hire_number, :passing_score)
  end
end
