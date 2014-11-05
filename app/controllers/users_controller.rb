class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
    else
      render 'new'
    end
  end

  private

  def set_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
