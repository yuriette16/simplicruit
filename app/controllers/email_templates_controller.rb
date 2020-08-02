class EmailTemplatesController < ApplicationController
  before_action :find_email_template, only: [:edit, :update]

  def index
    @email_templates = policy_scope(EmailTemplate)
    @email_template = EmailTemplate.new
    authorize @email_template
  end

  def create
    @email_template = EmailTemplate.new(email_template_params)
    authorize @email_template
    @email_template.save
    redirect_to email_templates_path
  end

  def edit
  end

  def update
    @email_template.update(email_template_params)
    redirect_to email_templates_path
  end

  private

  def find_email_template
    @email_template = EmailTemplate.find(params[:id])
    authorize @email_template
  end

  def email_template_params
    params.require(:email_template).permit(:subject, :body, :name)
  end
end
