class PostsController < ApplicationController

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	# post.user_id = current_user.id
  	@post.save
  	redirect_to posts_path
  end

  def edit
  end

  def update

  end

  def destroy

  end

private
  def post_params
  	params.require(:post).permit(:text, :image)
  end
end

