class UserCommentsController < ApplicationController

  before_action :ensure_logged_in

  def create
    user_comment = UserComment.new(user_comment_params)
    user_comment[:commenter_id] = current_user.id
    unless user_comment.save
      flash[:errors] = user_comment.errors.full_messages
    end
    redirect_to user_url(user_comment.commented_on_id)
  end

  def destroy
    user_comment = UserComment.find(params[:id])
    user_comment.destroy
    redirect_to user_url(user_comment.commented_on_id)
  end

  private
  def user_comment_params
    params.require(:user_comment).permit(:body, :commented_on_id)
  end

end
