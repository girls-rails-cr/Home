class SponsorsController < ApplicationController
  require 'sucker_punch/async_syntax'

  def create
    @sponsor = Sponsor.new(sponsor_params)
    respond_to do |format|
      if @sponsor.save
        SponsorJob.new.async.perform(@sponsor)
        format.html { redirect_to sponsors_page_path, notice: 'Gracias por ser nuestro nuevo patrocinador!' }
      else
        format.html { redirect_to sponsors_page_path, notice: 'Por ahora no podemos.' }
      end
    end
  end

  private
  def sponsor_params
    params.require(:sponsor).permit(:name,
                                    :email_contact,
                                    :description,
                                    :event_id)
  end
end
