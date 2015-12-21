class PostsController < ApplicationController
	before_action :set_post, only: [:update, :show, :upvote, :destroy]
	def index
		respond_to do |format|
			format.json {render json: Post.all}
		end
	end

	def show
		respond_to do |format|
			format.json {render json: @post}
		end
	end

	def create
		respond_to do |format|
			format.json {render json: Post.create(post_params)}
		end
	end

	def update
		respond_to do |format|
			format.json {render json: @post.update(post_params)}
		end
	end

	def upvote
		@post.increment!(:upvotes)
		respond_to do |format|
			format.json {render json: @post}
		end
	end

	def destroy
		respond_to do |format|
			format.json {render json: @post.destroy}
		end
	end

	private
	def set_post
		@post = Post.find(params[:id])	
	end

	def post_params
		params.require(:post).permit(:title)
	end
end
