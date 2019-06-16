class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                            :following, :followers]

  def index
  	@category = Category.find(params[:category_id])
  	@users = @category.users.where.not(id: current_user.id).order('current_sign_in_at ASC')
  end

  def show
  	@user = User.find(params[:id])
  	@user_category = UserCategory.find_by(user_id: @user.id)
  	@category = Category.find_by(id: @user_category.category_id)
  	@games = Game.where(user_id: @user.id)
  	@posts = Post.where(user_id: @user.id)
    @current_user_entries = Entry.where(user_id: current_user.id)
    @user_entries = Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      @current_user_entries.each do |cu|
        @user_entries.each do |u|
          if cu.room_id == u.room_id
            @our_room = true
            @room_id = cu.room_id
          end
        end
      end
      unless @our_room
        @room = Room.new
        @entry = Entry.new
      end
    end

  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user_category = @user.user_categories
  	@user_category.delete_all
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name,
    	                         :play_time,
    	                         :introduction,
    	                         :profile_image,
    	                         games_attributes: [:id, :user_id, :title, :_destroy],
                                 user_categories_attributes: [:category_id, :_destroy]
    	                        )
  end

end
