module Admin
  class SessionsController < ApplicationController
    layout "admin"

    def new
    end

    def create
      user = AdminUser.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:admin_user_id] = user.id
        redirect_to admin_dashboard_path, notice: "ログインしました"
      else
        flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません"
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      session.delete(:admin_user_id)
      redirect_to admin_login_path, notice: "ログアウトしました"
    end
  end
end
