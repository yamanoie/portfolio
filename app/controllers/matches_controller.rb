class MatchesController < ApplicationController
  before_action :initialize_contact, only: [:index, :edit]

  def index
  	@matches = Match.all
  	@match = Match.new
  end

  def create
  	match = Match.new(match_params)
  	match.user_id = current_user.id
  	match.save
  	redirect_to matches_path
  end

  def edit
  	@match = Match.find(params[:id])
  end

  def update
  	match = Match.find(params[:id])
  	match.update(match_params)
  	redirect_to matches_path
  end

  def destroy
  	match = Match.find(params[:id])
  	match.destroy
  	redirect_to matches_path
  end

private
  def match_params
  	params.require(:match).permit(:text, :title, :occupation)
  end

end
