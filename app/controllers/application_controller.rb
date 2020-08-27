class ApplicationController < ActionController::Base
  before_action :store_location!,
    unless: -> { devise_controller? || request.xhr? },
    if: -> { request.get? && is_navigational_format? }
  before_action :authenticate_user!, unless: :devise_controller? # prevents a circular redirect
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?
  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :avatar])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def store_location!
    # from Devise::Controllers::StoreLocation
    # :user is the scope
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
    previous_path || root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end
end
