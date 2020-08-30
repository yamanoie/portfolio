class PostsController < ApplicationController
  before_action :initialize_contact, only: [:index, :edit, :show]

  def index
  	@posts = Post.page(params[:page]).per(8).order(created_at: "DESC")
    @all_ranks = Post.find(Like.group(:post_id).order("count(post_id) desc").limit(3).pluck(:post_id))

  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
  	
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.new(post_params)
  	post.user_id = current_user.id
  	post.save
  	redirect_to posts_path,notice: "You posted"
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params),notice: "Post has been updated"
  	redirect_to post_path(post)
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path

  end



private
  def post_params
  	params.require(:post).permit(:text, :image, :user_id)
  end

end

