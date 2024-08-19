class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:check_name, :check_email, :check_user]
  before_action :set_current_user
  before_action :ensure_guest_user, only: [:edit]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_edit_users_path, notice: "ユーザー情報を変更しました"
    end
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

  def check_name
    name = params[:name]
    user = User.find_by(name: name)
    render json: user.nil? ? {status: true}.to_json : {status: false}.to_json
  end

  def check_email
    email = params[:email]
    user = User.find_by(email: email)

    if user.nil? || user == current_user
      render json: { status: true }.to_json
    else
      render json: { status: false }.to_json
    end
  end

  def check_user
    user = User.find_by(email: params[:user][:email])
    if !user.nil? && user.valid_password?(params[:user][:password])
      if user.is_active?
        sign_in user
        flash[:notice] = "ログインしました。"
        render json: {status: true}.to_json
      else
        render json: {status: "inactive"}.to_json
      end
    else
      render json: {status: false}.to_json
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to root_path , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
