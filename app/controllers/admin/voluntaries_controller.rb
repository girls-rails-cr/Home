module Admin
  class VoluntariesController < Admin::BaseController
    before_action :set_voluntary, only: [:show, :edit, :update, :destroy]


    def index
      @voluntaries = Voluntary.all
    end

    def show
    end

    def new
      @voluntary = Voluntary.new
    end


    def edit
    end


    def create
      @voluntary = Voluntary.new(voluntary_params)

      respond_to do |format|
        if @voluntary.save
          format.html { redirect_to admin_voluntaries_path, notice: 'Voluntary was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @voluntary.update(voluntary_params)
          format.html { redirect_to admin_voluntaries_path, notice: 'Voluntary was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @voluntary.destroy
      respond_to do |format|
        format.html { redirect_to admin_voluntaries_url, notice: 'Voluntary was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    def set_voluntary
      @voluntary = Voluntary.find(params[:id])
    end

    def voluntary_params
      params.require(:voluntary).permit(:name, :phone, :career, :interest_area, :email, :message)
    end
  end
end
