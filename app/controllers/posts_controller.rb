class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@post = Post.new
  	@posts = Post.page(params[:page]).per(10).reverse_order
  end

  def create
  	post = Post.new(post_params)
  	post.user_id = current_user.id
  	post.save
  	redirect_to posts_path
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:user_id, :post_content, :post_image)
  end

end
