class ArticlesController < ApplicationController
  def index
  	@article = Article.all
   # @comment = @article.comments
    filename="article.xls"
    respond_to do|format|
      format.html
      #format.csv {render text: @article.to_csv}
      #format.xls {send_data @article.to_csv(col_sep: '\t') }
      format.xls {headers["Content-Disposition"] = "attachment;filename=\"#{filename}\""}
    end
  end

  def new
	@article = Article.new
  end

  def edit
  	@article = Article.find_by_id(params[:id])
   end

  def create
  	@article = Article.new (params_article)
  	if @article.save
  	flash[:notice]= "success Add Record"
  	redirect_to action: 'index'
  else
  	 flash[:error] = "data not valid"
    render 'new'
  end
end

def show
@article = Article.find_by_id(params[:id])
@comment = @article.comments

end

def update
  @article = Article.find_by_id(params[:id])
  if @article.update(params_article)
    flash[:notice] = "Success Update Records"
    redirect_to action: 'index'
  else
    flash[:error] = "data not valid"
    render 'edit'
  end
end

def destroy
  @article = Article.find_by_id(params[:id])
  if @article.destroy
    flash[:notice] = "Success Delete a Records"
    redirect_to action: 'index'
  else
    flash[:error] = "fails delete a records"
    redirect_to action: 'index'
  end
end

private 
def params_article
	params.require(:article).permit(:title, :content, :status, :username)
end


end
