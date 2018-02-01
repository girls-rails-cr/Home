class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin? && current_user.profile.nil?
      return edit_admin_profile_path
    else
      super
    end
  end
end
