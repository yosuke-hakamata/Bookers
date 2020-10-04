class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:about, :top]

  def new
  end

  def create
  end

  def index
  	@book=Book.all
  end

  def show
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
