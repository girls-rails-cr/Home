class VoluntariesController < ApplicationController
  require 'sucker_punch/async_syntax'

  def create
    @voluntary = Voluntary.new(voluntary_params)
    respond_to do |format|
      if @voluntary.save
        VoluntaryJob.new.async.perform(@voluntary)
        format.html { redirect_to root_path, notice: 'Gracias por ser nuesto nuevo voluntario!' }
      else
        format.html { redirect_to root_path, notice: 'Sorry intentalo de nuevo.' }
      end
    end
  end

  private
  def voluntary_params
    params.require(:voluntary).permit(:name, :email, :career, :interest_area, :phone, :message, :event_id)
  end
end
