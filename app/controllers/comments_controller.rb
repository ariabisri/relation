class CommentsController < ApplicationController
  def index
  end

  def new
  	@article = Article.find_by_id(params[:id])
  	@comment = @article.comments.build
  end

  def edit
  end
end
