module Admin
  class AdminsController < Admin::BaseController
    before_action :set_admin, only: [:edit, :update, :destroy]

    def index
      @admins = User.admins
    end

    def edit
    end

    def update
      if @admin.update(password: params[:password], email: params[:email])
        bypass_sign_in(@admin)
        redirect_to admin_admins_path
      else
        render :edit
      end
    end

    def destroy
      @admin.destroy
      respond_to do |format|
        format.html { redirect_to admin_admins_path }
      end
    end

    private

    def set_admin
      @admin = User.find(params[:id])
    end
  end
end
