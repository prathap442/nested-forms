class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource
	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
		@article = @category.articles.build
		@article.comments.build
	end
	def create
		@category = Category.new(category_params)
		if @category.save
			binding.pry
			redirect_to categories_path
		else
			render action: 'new'
		end
	end
	def show
		@category = Category.find(params[:id])
		@cat  = Category.first
		@cat.articles.build.comments.build
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to category_path(@category.id)
		else
			render action: 'edit'
		end
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end
	private
	def category_params
	  binding.pry
	  params.require(:category).permit(:name, :description,articles_attributes: [:title,:body,:published_date,:is_published,:cover,:slug,:user_id,comments_attributes: [:body,:user_id]])
	end		
end
