class GoalsController < ApplicationController
  before_action :ensure_logged_in, except: [:index, :show]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def index
    @goals = Goal.where(is_private: false)
  end

  def show
    @goal = Goal.includes(comments: :commenter).includes(:user).find(params[:id])
    if @goal.is_private && current_user.id != @goal.user_id
      flash[:errors] = ["This goal is private"]
      redirect_to goals_url
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to goals_url
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :is_private, :is_completed)
  end

  def ensure_owner
    @goal = Goal.find(params[:id])
    redirect_to goals_url unless current_user.id == @goal.user_id
  end

end
