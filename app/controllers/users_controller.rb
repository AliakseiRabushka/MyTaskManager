class UsersController < ApplicationController
  def new
    debugger
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email)
    User.create(user_params)
    redirect_to root_path, notice: 'You have successfully registered!'
  end
end
