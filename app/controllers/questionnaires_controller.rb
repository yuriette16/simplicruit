class QuestionnairesController < ApplicationController
  before_action :find_job_application, only: [:create]
  before_action :find_questionnaire, only: [:destroy, :edit]

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
    job_application = @questionnaire.job_application
    @questionnaire.destroy
    redirect_to job_application_path(job_application, tab: "evaluation")
  end

  def edit
  end

  def update
    puts "REACHED!"
    puts params
    questionnaire_id = params[:id]
    question_id = params[:question_id]
    answer_questionnaire = params[:answer]
    job_application_id = params[:job_application_id]

    questionnaire = Questionnaire.find(questionnaire_id)
    questionnaire.question_id = question_id
    questionnaire.answer = answer_questionnaire
    questionnaire.job_application_id = job_application_id
    authorize questionnaire
    questionnaire.save
    redirect_to job_application_path(job_application_id, tab: "evaluation")
    # @questionnaire.update(questionnaire_params)
  end

  # {"question_id"=>"12", "answer"=>"", "controller"=>"questionnaires", "action"=>"update", "job_application_id"=>"1", "id"=>"488"}

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
    params.require(:questionnaire).permit(:question_id, :category_id, :job_application_id, :answer)
  end
end
