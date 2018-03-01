class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource :find_by => :slug
	def index
		@articles = Article.all
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if @article.published_date <= Date.today
			@article.is_published= true
		elsif @article.published_date > Date.today
			@article.is_published = false
		end
		if @article.save
			redirect_to articles_path
		else
			render action: 'new'
		end
	end
	def show
		
		@article = Article.friendly.find(params[:id])
		@comment = Comment.new
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			redirect_to article_path(@article.id)
		else
			render action: 'edit'
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
	private
	def article_params
		params[:article].permit(:title, :body, :published_date, :category_id, :is_published, :cover, :slug, :user_id)
	end
end
