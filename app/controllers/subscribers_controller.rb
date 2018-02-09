class SubscribersController < ApplicationController
  require 'sucker_punch/async_syntax'

  def create
    @subscriber = Subscriber.new(subscriber_params)
    respond_to do |format|
      if @subscriber.save
        cookies[:saved_load] = true
        SubscribeJob.new.async.perform(@subscriber)
        format.html { redirect_to root_path, notice: 'Gracias por suscribirse!' }
      else
        format.html { redirect_to root_path, notice: 'Sorry intentalo de nuevo.' }
      end
    end
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :source, :level_knowledge, :phone_number, :event_id)
  end
end
