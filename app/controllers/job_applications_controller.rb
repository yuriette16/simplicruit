class JobApplicationsController < ApplicationController
  before_action :find_job_application, only: [:show]

  def index
    @job_applications = policy_scope(JobApplication).order('interview_date DESC')
    applicant = PersonalityInsightsService.new
    answer = applicant.profile("Good afternoon. Let begin by saying that although this has been billed as an anti-war rally, I stand before you as someone who is not opposed to war in all circumstances.
The Civil War was one of the bloodiest in history, and yet it was only through the crucible of the sword, the sacrifice of multitudes, that we could begin to perfect this union, and drive the scourge of slavery from our soil.I don’t oppose all wars.
My grandfather signed up for a war the day after Pearl Harbor was bombed, fought in Patton’s army. He saw the dead and dying across the fields of Europe; he heard the stories of fellow troops who first entered Auschwitz and Treblinka. He fought in the name of a larger freedom, part of that arsenal of democracy that triumphed over evil, and he did not fight in vain.")
    raise
    puts answer
  end

  def show
  end

  private

  def find_job_application
    @job_applications = JobApplication.find(params[:id])
    authorize @job_applications
  end
end
