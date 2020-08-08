class QuestionnairesController < ApplicationController
  before_action :find_job_application, only: [:create, :edit, :update]
  before_action :find_questionnaire, only: [:destroy, :edit, :update]

  def index
    @questionnaires = policy_scope(Questionnaire).order('created_at DESC')
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.job_application = @job_application
    authorize @questionnaire
    if @questionnaire.save
      redirect_to job_application_path(@job_application)
    else
      redirect_to job_application_path(@job_application)
      flash.alert = 'Sorry, something goes wrong!'
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to job_application_path(@job_application)
  end

  def edit
  end

  def update
    @questionnaire.update(questionnaire_params)
    redirect_to job_application_path(@job_application)
  end

  private

  def find_job_application
    @job_application = JobApplication.find(params[:job_application_id])
    authorize @job_application
  end

  def find_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
    authorize @questionnaire
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:question_id, :job_application_id, :answer)
  end
end
