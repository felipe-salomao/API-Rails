class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorsHandler::Handler 
  include ActionController::MimeResponds
  include ActionController::Serialization
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session

  def pagination(object)
    {
      current_page: object.current_page,
      per_page: object.per_page(params),
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :kind])     
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :name, :kind])
  end
end
