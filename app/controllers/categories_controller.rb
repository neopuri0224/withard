class CategoriesController < ApplicationController

  def index #カテゴリー一覧ページ
  	@categories = Category.all
  end

end
