module Admin
  class DashboardController < ApplicationController
    include AdminAuthenticatable
    layout "admin"

    def show
    end
  end
end
