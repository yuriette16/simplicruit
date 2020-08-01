class JobApplicationsController < ApplicationController
  before_action :find_job_application, only: [:show]

  def index
    @job_applications = policy_scope(JobApplication).order('interview_date DESC')
  end

  def show
  end

  private

  def find_job_application
    @job_applications = JobApplication.find(params[:id])
    authorize @job_applications
  end
end
