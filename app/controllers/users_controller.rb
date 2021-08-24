class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash.now[:danger] = t "User Not Found"
    redirect_to root_url
  end

  def new
  end
end
