class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@post = Post.new
    #新しい投稿が上に表示されるよう並び替える。
  	@posts = Post.page(params[:page]).per(10).reverse_order
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
      flash[:notice] = "投稿しました。"
  	  redirect_to posts_path
    else
      flash[:warning] = "投稿に失敗しました。もう一度お試しください。"
      render :index
    end
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
    flash[:notice] = "投稿を削除しました。"
  	redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:user_id, :post_content, :post_image)
  end

end
