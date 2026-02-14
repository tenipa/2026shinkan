module Admin
  class SiteSettingsController < ApplicationController
    include AdminAuthenticatable
    layout "admin"

    SETTING_KEYS = %w[
      hero_title hero_subtitle catchphrase
      instagram_url x_url line_url
      recruitment_body schedule_link pv_video_url
      practice_times practice_location member_count competitive_info
    ].freeze

    def edit
      @settings = {}
      SETTING_KEYS.each do |key|
        @settings[key] = SiteSetting.get(key) || ""
      end
    end

    def update
      SETTING_KEYS.each do |key|
        SiteSetting.set(key, params[:settings][key]) if params[:settings]&.key?(key)
      end
      redirect_to edit_admin_site_settings_path, notice: "設定を更新しました"
    end
  end
end
