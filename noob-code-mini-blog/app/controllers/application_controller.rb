class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  include ErrorsHandler::Handler 
  include ActionController::MimeResponds
  include ActionController::Serialization

  protect_from_forgery with: :null_session

  def pagination(object)
    {
      current_page: object.current_page,
      per_page: object.per_page(params),
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
