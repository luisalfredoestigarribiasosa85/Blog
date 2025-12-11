class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.includes(:user).all
  end

  def show
    @article = Article.includes(:user).find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "Artículo fue creado exitosamente."
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.includes(:user).find(params[:id])
  end

  def update
    @article = Article.includes(:user).find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to @article, notice: "Artículo fue actualizado exitosamente."
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.includes(:user).find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Artículo fue eliminado exitosamente."
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
