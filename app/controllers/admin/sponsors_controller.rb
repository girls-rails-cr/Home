module Admin
  class SponsorsController < Admin::BaseController
    before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

    def index
      @sponsors = Sponsor.all
    end

    def show
    end

    def new
      @sponsor = Sponsor.new
    end

    def edit
    end

    def create
      @sponsor = Sponsor.new(sponsor_params)
      respond_to do |format|
        if @sponsor.save
          format.html { redirect_to admin_sponsors_path, notice: 'Sponsor was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @sponsor.update(sponsor_params)
          format.html { redirect_to admin_sponsors_path, notice: 'Sponsor was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @sponsor.destroy
      respond_to do |format|
        format.html { redirect_to admin_sponsors_path, notice: 'Sponsor was successfully destroyed.' }
      end
    end

    private
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    def sponsor_params
      params.require(:sponsor).permit(:name,:email_contact, :description,
                                      :company, :logo, :page_url, :event_id, :status)
    end
  end
end
