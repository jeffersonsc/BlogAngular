class CommentsController < ApplicationController
	before_action :set_post, only: [:create, :upvote]
	
	def create		
		respond_to do |format|
			format.json {render json: @post.comments.create(comment_params)}
		end
	end

	def show
		respond_to do |format|
			format.json {render json: @post.comments}
		end	
	end

	def upvote
		respond_to do |format|
			format.json {render json: @post.comments.increment(:upvotes)}
		end	
	end

	private
	def set_post
		@post = Post.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :upvotes)
	end
end
