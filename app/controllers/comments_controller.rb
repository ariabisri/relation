class CommentsController < ApplicationController
  def index
  end

  def new
  	@article = Article.find_by_id(params[:id])
  	@comment = @article.comments.build
  end

  def edit
  end

  def create

  	@article = Article.find_by_id(params[:id])
  	@comment = @article.comments.build(params_comment)
  	if @comment.save
  	flash[:notice]= "success Add Record"
  	redirect_to  article_url(@article.id)
  	#redirect_to new_comment_path (:id => @article.id)
  else
  	 flash[:error] = "data not valid"
    render 'new'
  end
  end

def params_comment
	params.require(:comment).permit(:username, :content, :status)
end

end
