class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    if current_user.id == params[:id]
      @user = User.includes(comments: :commenter).includes(:goals).find(params[:id])
    else
      @user = User
                .includes(comments: :commenter)
                .includes(:goals)
                .where("goals.is_private = ?", false)
                .references(:goals)
                .find(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
