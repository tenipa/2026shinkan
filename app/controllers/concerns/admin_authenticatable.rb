module AdminAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_action :require_admin
  end

  private

  def require_admin
    unless current_admin
      redirect_to admin_login_path, alert: "ログインしてください"
    end
  end
end
