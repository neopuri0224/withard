class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :social

  def show
  	@user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end

  private

  def finish_wizard_path
	users_path
  end

  def user_params
    params.require(:user).permit(:name,:game_category,:play_time,:introduction,:game_title,:plofile_image)
  end

end
