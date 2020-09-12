class MatchesController < ApplicationController
  before_action :authenticate_user!
  include EnsureCorrectObjects
  before_action :ensure_correct_match, only: %i[destroy edit update]

  def index
    @search = Match.ransack(params[:q])
    @matches = @search.result.includes(:user).page(params[:page]).per(5).order(created_at: 'DESC')
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.user_id = current_user.id
    if @match.save
      flash[:success] = 'Newly posted'
      redirect_to matches_path
    else
      @search = Match.ransack(params[:q])
      @matches = @search.result.includes(:user).page(params[:page]).per(5).order(created_at: 'DESC')
      render :index
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:success] = 'Post has been updated'
      redirect_to matches_path
    else
      render :edit
    end
  end

  def destroy
    match = Match.find(params[:id])
    match.destroy
    flash[:danger] = 'Post has been deleted'
    redirect_to matches_path
  end

  private

  def match_params
    params.require(:match).permit(:text, :title, :occupation)
  end
end
