class QuestionnairesController < ApplicationController
  before_action :find_job_application, only: [:create]
  before_action :find_questionnaire, only: [:destroy, :edit, :update]

  def index
    @questionnaires = policy_scope(Questionnaire).order('created_at DESC')
    @questionnaire = Questionnaire.new
    authorize @questionnaire
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.job_application = @job_application
    authorize @questionnaire
    if @questionnaire.save
      redirect_to questionnaires_path
    else
      redirect_to questionnaires_path
      flash.alert = 'Sorry, something goes wrong!'
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to questionnaires_path
  end

  def edit
  end

  def update
    authorize @questionnaire
    @questionnaire.update(questionnaire_params)
    redirect_to questionnaires_path
  end

  private

  def find_job_application
    @job_application = JobApplication.find(params[:id])
    authorize @job_application
  end

  def find_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
    authorize @questionnaire
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:question_id, :answer)
  end
end
