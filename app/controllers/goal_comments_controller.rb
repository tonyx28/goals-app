class GoalCommentsController < ApplicationController

  def create
    goal_comment = GoalComment.new(goal_comment_params)
    goal_comment[:commenter_id] = current_user.id
    unless goal_comment.save
      flash[:errors] = goal_comment.errors.full_messages
    end
    redirect_to goal_url(goal_comment.goal_id)
  end

  def destroy
    goal_comment = GoalComment.find(params[:id])
    goal_comment.destroy
    redirect_to goal_url(goal_comment.goal_id)
  end

  private
  def goal_comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end
end
