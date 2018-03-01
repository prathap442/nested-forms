class CommentsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to article_path(@comment.article.slug), notice: "You have successfully added comment"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to article_path(@comment.article.slug), notice: "You have successfully destroyed the comment"
	end
	def edit
		@comment = Comment.find(params[:id])
	end
	def show
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to comment_path(@comment.id)
		else
			render action: 'edit'
		end
	end

	private

	def comment_params
		params[:comment].permit(:body, :article_id, :user_id)
	end
end
