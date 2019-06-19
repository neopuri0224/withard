class CategoryController < ApplicationController
  before_action :authenticate_user!

  def index #カテゴリー一覧ページ
  	@categories = Category.all
  end
end
