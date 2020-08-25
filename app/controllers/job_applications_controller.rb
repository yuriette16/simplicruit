require 'json'

class JobApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit]
  before_action :find_job_application, only: [:show, :edit, :update]
  skip_before_action :verify_authenticity_token, only: [:update]

  def index
    if params[:name].present?
      @job_application = policy_scope(JobApplication).find_by(candidate_name: params[:name])
      redirect_to job_application_path(@job_application)
    else
      @job_applications = policy_scope(JobApplication).order(status: :asc).order(video_score: :desc)
    end
  end

  def edit
    @nosidebar = 'nosidebar'
    @nonavbar = 'nonavbar'
  end

  def update
    # raise
    if @job_application.update(job_application_params)
      #demo only
      UploadVideoTranscriptJob.perform_now(@job_application)
      redirect_to uploaded_path
    else
      render :edit
    end
  end

  def uploaded
    @job_application = JobApplication.find(params[:id])
    @nosidebar = 'nosidebar'
    @nonavbar = 'nonavbar'
  end

  def show
    if @job_application.video_result.present?
      extract_skill = ExtractSkill.new
      cal_score = CalScore.new
      generate_question = GenerateQuestion.new
      required_skills = extract_skill.get_required_skills(@job_application)
      @skill_names_array = extract_skill.extract_requirement_skills(@job_application, required_skills)
      @overall_score = cal_score.cal_overall_score(@skill_names_array, required_skills)
      @job_application.video_score = @overall_score
      @job_application.save!

    if Questionnaire.where(job_application_id: @job_application.id).empty?
      generate_question.generate_questions(@job_application, @skill_names_array, required_skills)
    end
    @auto_questionnaires = Questionnaire.where(job_application_id: @job_application)

    end
    @questionnaire = Questionnaire.new

    if @job_application.interview_date.nil? && @job_application.status != "invited" && @job_application.video_result.present? && @job_application.video_score > @job_application.position.passing_score
      InterviewBookedJob.perform_now(@job_application)
    end
  #demo only
    if @job_application.video.attached?
      UploadVideoResultJob.perform_later(@job_application)
    end
  end

  private

  def find_job_application
    @job_application = JobApplication.find(params[:id])
    authorize @job_application
  end

  def job_application_params
    params.require(:job_application).permit(:video, :status)
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:question_id, :answer)
  end

end
