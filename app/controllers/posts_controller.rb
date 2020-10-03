require 'net/http'
require 'uri'
require 'json'

class PostsController < ApplicationController
  include EnsureCorrectObjects
  before_action :ensure_correct_post, only: %i[destroy edit update]

  def index
    @posts = Post.includes(:user).recent.page(params[:page]).per(8)
    @all_ranks = Post.find(Like.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(3).pluck(:post_id))
    @slider_posts = Post.where.not(image_id: nil).limit(8)
    @tokyo_weather = get_weather('q=Tokyo,jp')
    @osaka_weather = get_weather('q=Osaka,jp')
    @cebu_weather = get_weather('q=Cebu,ph')
    @time_now_jp = Time.current.strftime('%Y/ %m/ %d/ %a')
    @time_now_ph = (Time.current - 1.hour).strftime('%Y/ %m/ %d/ %a')
  end

  def show
    @post = Post.find(params[:id])
    comments = @post.comments.order(created_at: 'DESC')
    @comments_by_third = comments[0..2]
    @comments_from_third = comments[3..(comments.count - 1)]
    @comments_count = comments.count
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Newly posted '
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
      flash[:success] = 'Post has been updated'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:danger] = 'Post has been deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:text, :image)
  end

  def get_weather(_code)
    weather_url = 'https://api.openweathermap.org/data/2.5/weather?' + _code + '&units=metric&cnt=3&appid='
    weather_url += ENV['OPEN_WEATHER_API_KEY']
    uri = URI.parse(weather_url)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
  end
end
