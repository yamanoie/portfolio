class MatchesController < ApplicationController
  before_action :initialize_contact, only: [:index, :edit]

  def index
    @search = Match.ransack(params[:q])
    @matches = @search.result.includes(:user).page(params[:page]).per(6).order(created_at: "DESC")
  	@match = Match.new
  end

  def create
  	match = Match.new(match_params)
  	match.user_id = current_user.id
  	match.save
  	redirect_to matches_path,notice: "You posted"
  end

  def edit
  	@match = Match.find(params[:id])
  end

  def update
  	match = Match.find(params[:id])
  	match.update(match_params)
  	redirect_to matches_path,notice: "Post has been updated"
  end

  def destroy
  	match = Match.find(params[:id])
  	match.destroy
  	redirect_to matches_path,notice: "Post has been deleted"
  end

private
  def match_params
  	params.require(:match).permit(:text, :title, :occupation)
  end

end
