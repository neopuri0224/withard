class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.search_by(params[:game_category])
  end

  def show
  end

  def category
  	@cate
  end
end
