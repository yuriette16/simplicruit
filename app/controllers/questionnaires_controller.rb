class QuestionnairesController < ApplicationController
  before_action :find_questionnaire, only: [:edit, :update]

  def index
    @questionnaires = policy_scope(Questionnaire).order('created_at DESC')
  end

  def edit
  end

  def update
    authorize @questionnaire
    @questionnaire.update(questionnaire_params)
    redirect_to questionnaires_path
  end

  private

  def find_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
    authorize @questionnaire
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:question_id, :answer)
  end
end
