module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :authenticate_admin
    private
    def authenticate_admin
      redirect_to '/', alert: 'Not authorized.' unless current_user && access_rule
    end

    def access_rule
      current_user.try(:admin?)
    end
  end
end
