class SubscribersController < ApplicationController
  require 'sucker_punch/async_syntax'
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        SubscribeJob.new.async.perform(@subscriber)
        cookies[:saved_load] = true
        format.html { redirect_to root_path, notice: 'Gracias por suscribirse a nuestra lista de distribución.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { redirect_to root_path, notice: 'Sorry intentalo de nuevo.' }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :source)
  end
end
