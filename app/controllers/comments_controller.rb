class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.commenter_id = current_user.id
    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end
    redirect_to (comment_params[:commentable_type] == "Goal" ? goal_url(comment.commentable_id) : user_url(comment.commentable_id))
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to (comment.commentable_type == "Goal" ? goal_url(comment.commentable_id) : user_url(comment.commentable_id))
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
