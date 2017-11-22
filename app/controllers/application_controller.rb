class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protected

  def authenticate_admin!
   unless current_user.try(:admin?)
      raise SecurityError
      # Let them do stuff
    end
  end

  rescue_from SecurityError do
    redirect_back(fallback_location: root_path, notice: "You don't have access to that!")

  end
end
