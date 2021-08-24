class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash.now[:danger] = t "User Not Found"
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save  # Handle a successful save.
      flash[:success] = t "welcome_to_the_sample_app!"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
