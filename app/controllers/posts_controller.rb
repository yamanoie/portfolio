class PostsController < ApplicationController
  before_action :initialize_contact, only: [:index, :edit, :show]
  before_action :authenticate_user!, only: [:edit]
  include EnsureCorrectObjects
  before_action :ensure_correct_post, only: [:destroy,:edit, :update]

  def index
  	@posts = Post.includes(:user).order(created_at: "DESC").page(params[:page]).per(8)
    @all_ranks = Post.find(Like.group(:post_id).order("count(post_id) desc").limit(3).pluck(:post_id))
    @slider_posts = Post.where.not(image_id: nil).limit(8)

  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
      flash[:success] = "You posted newly"
  	  redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
      flash[:success] ="Post has been updated"
    	redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
    flash[:danger] = "Post has been deleted"
  	redirect_to posts_path

  end

private
  def post_params
  	params.require(:post).permit(:text, :image)
  end

end

