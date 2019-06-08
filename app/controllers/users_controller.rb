class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	category = Category.find(params[:category_id])
  	@users = category.users
  end

  def show
  end

end
