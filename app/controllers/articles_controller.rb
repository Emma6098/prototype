class ArticlesController < ApplicationController

  def index

    if params[:keyword]
      @articles = Article.search_by_name(params[:keyword])
    else
      @articles = Article.all
    end

  end

  def show
    @article = Article.find(params[:id])
    @order = Order.new
    @user = @article.user
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to article_path(@article), notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    @orders = Order.all
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:name, :description, :price, :photo, :categorie, :color, :size, :brand, :state)
  end


end
