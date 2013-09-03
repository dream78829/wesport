class RegistrationsController < Devise::RegistrationsController
  def update
    # required for settings form to submit when password is left blank
    if params[:team_user][:password].blank?
      params[:team_user].delete("password")
      params[:team_user].delete("password_confirmation")
    end

    @user = TeamUser.find(current_team_user.id)
    if @user.update_attributes(params[:team_user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
end