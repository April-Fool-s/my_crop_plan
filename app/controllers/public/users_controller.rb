class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_mypage_edit_path, notice: "ユーザー情報を変更しました"
    end
  end

  def confirm
  end

  def close_account
    if @user.update(is_active: false)
      reset_session
      redirect_to new_user_registration_path, notice: "退会処理を実行しました"
    else
      flash.now[:alert] = "退会処理を実行できませんでした"
      render 'edit'
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
