class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      sign_in(@user, :bypass => true)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :lsat_name_kana, :birthday)
  end
end
