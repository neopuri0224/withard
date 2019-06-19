class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create #フォロー機能
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format| #createアクションが呼び出された時
      format.html { redirect_to @user } #formatがhtml形式だったらユーザーshowページへリダイレクト
      format.js #json形式だったら/relationships/create.js.erbを起動
    end
  end

  def destroy #フォロー解除機能
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format| #destroyアクションが呼び出された時
      format.html { redirect_to @user } #formatがhtml形式だったらユーザーshowページへリダイレクト
      format.js #json形式だったら/relationships/create.js.erbを起動
    end
  end
end
