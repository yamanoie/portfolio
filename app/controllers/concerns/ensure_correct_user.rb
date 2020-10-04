module EnsureCorrectUser
  extend ActiveSupport::Concern

  def ensure_correct_user
    redirect_to '/' if current_user.id != params[:id].to_i
  end

  def ensure_correct_post
    post = Post.find(params[:id])
    redirect_to '/' if current_user.id != post.user.id
  end

  def ensure_correct_match
    match = Match.find(params[:id])
    redirect_to '/' if current_user.id != match.user.id
  end

  def ensure_correct_room
    room = Room.find_by(id: params[:id])
    redirect_to '/' if current_user.id != room.user_id && current_user.id != room.guest_id
  end
end
