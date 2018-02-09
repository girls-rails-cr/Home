module Admin
  class UsersController < Admin::BaseController
    before_action :set_speaker,  only: [:show, :edit, :update, :destroy]

    def index
      @speakers = User.speakers
    end

    def new
      @speaker = User.new
      @speaker.build_profile
    end

    def create
      @speaker = User.new(speaker_params)
      respond_to do |format|
        if @speaker.save
          format.html { redirect_to admin_users_path, notice: 'Speaker was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
      @profile = @speaker.profile || @speaker.build_profile
    end

    def update
      if @speaker.update(speaker_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy_avatar
      @speaker.profile.remove_avatar!
      @speaker.profile.save
      redirect_to admin_users_path
    end

    def destroy
      @speaker.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_path }
      end
    end

    def set_speaker
      @speaker = User.find_by_id(params[:id])
    end

    def speaker_params
      params.require(:user).permit(:role, :password, :email, :event_id,
                                    profile_attributes: [:id, :first_name, :avatar, :career, :avatar_cache, :last_name, :username, :company, :address, :fb_link, :twitter_link, :linkedin, :about_me, :_destroy])
    end
  end
end
