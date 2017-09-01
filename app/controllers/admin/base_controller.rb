module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_filter!

    private
      def admin_filter!
        redirect_to admin_root_path if current_user.admin?
      end
      layout 'admin'
  end
end
