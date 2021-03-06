class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    if comment.save
      comment.post.create_notification_comment!(current_user, comment.id) # 通知
      flash.now[:success] = 'You commented'
    else
      flash.now[:danger] = comment.errors.messages[:comment].first
    end
    comments = @post.comments.recent
    @comments_by_third = comments[0..2]
    @comments_from_third = comments[3..(comments.count - 1)]
    @comments_count = comments.count
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy
    flash.now[:danger] = 'Comment has been deleted'
    comments = @post.comments.recent
    @comments_by_third = comments[0..2]
    @comments_from_third = comments[3..(comments.count - 1)]
    @comments_count = comments.count
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
