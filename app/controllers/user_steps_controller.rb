class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :step2, :step3, :step4

  def show
  	@user = current_user
  	@user.games.build
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
    params.require(:user).permit(:name,
    	                         :game_category,
    	                         :play_time,
    	                         :introduction,
    	                         :plofile_image,
    	                         games_attributes: [:id, :user_id, :title, :_destroy]
    	                         )
  end

end
