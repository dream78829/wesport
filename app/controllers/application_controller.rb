class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  # Overwriting the sign_out redirect path method
  def signed_in_root_path(resource_or_scope)
    team_users_path
  end
end
