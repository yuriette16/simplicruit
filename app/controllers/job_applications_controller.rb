require 'json'

class JobApplicationsController < ApplicationController
  before_action :find_job_application, only: [:show, :edit, :update]

  def index
    @job_applications = policy_scope(JobApplication).order('interview_date DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @job_application.update(job_application_params)
      AnalysisVideoJob.perform_now(@job_application.id)
      redirect_to positions_path
    else
      render :edit
    end
  end

  private

  def find_job_application
    @job_application = JobApplication.find(params[:id])
    authorize @job_application
  end

  def job_application_params
    params.require(:job_application).permit(:video)
  end
end
