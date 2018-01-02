module Admin
  class ProfilesController <  Admin::BaseController
    before_action :set_user,  only: [:show, :edit, :update, :destroy]

    def edit
      @profile = current_user.profile || current_user.build_profile
    end

    def update
      if @user.update(user_params)
        bypass_sign_in(@user)
        redirect_to profile_path
      else
        render :edit
      end
    end

    def destroy_avatar
      current_user.profile.remove_avatar!
      current_user.profile.save
      redirect_to profile_path
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end

    def set_user
      @user = current_user
    end

    def user_params
      accessible = [ :email ]
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible, profile_attributes: [:id, :first_name, :avatar, :last_name, :_destroy])
    end
  end
end
