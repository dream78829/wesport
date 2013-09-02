class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  # Overwriting the sign_out redirect path method
  def signed_in_root_path(resource_or_scope)
  	if current_team_user.avatar.url.present?
    	root_path
	else
		edit_registration_path(:team_user)
	end
  end
end
