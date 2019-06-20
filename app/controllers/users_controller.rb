class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@category = Category.find(params[:category_id])
    @categories = Category.all
    #自分以外のユーザーを取得
  	@users = @category.users.where.not(id: current_user.id).order('current_sign_in_at ASC')
  end

  def show
  	@user = User.find(params[:id])
    @current_user_entries = Entry.where(user_id: current_user.id)
    @user_entries = Entry.where(user_id: @user.id)

    #@user.idがcurrent_user.idではなかったら
    unless @user.id == current_user.id
      @current_user_entries.each do |cu|
        @user_entries.each do |u|
          #cu(Entry.user_id == current_user.id)とu(Entry.user_id == @user.id)が同じだったら
          if cu.room_id == u.room_id
            #@our_room(current_userと@userの間にroomが存在するかを判別するためのインスタンス変数)をtrueにする
            @our_room = true
            #room/showにアクセスするために必要なID
            @room_id = cu.room_id
          end
        end
      end
      #@roomが存在しなかったら
      unless @our_room
        #RoomとEntryのモデルオブジェクトを作成
        @room = Room.new
        @entry = Entry.new
      end
    end

  end

  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to edit_user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	@user_category = @user.user_categories
    #中間テーブルを更新する際に、unique制約に引っかかってしまったためupdate前に削除
  	@user_category.delete_all
    if @user.update(user_params)
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

  def search
    @users = User.search(params[:search]).where.not(id: current_user.id).order('current_sign_in_at ASC')
    @categories = Category.all
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
