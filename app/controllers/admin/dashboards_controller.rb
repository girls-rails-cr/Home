module Admin
  class DashboardsController < Admin::BaseController
    def index
      @subscribers = Subscriber.all.order("created_at DESC")
    end

    def update_registered
      subscriber = Subscriber.find(params[:id])
      subscriber.registered? ? subscriber.update_attributes(registered: false) : subscriber.update_attributes(registered: true)
      head :ok
    end

    def update_confirmed
      subscriber = Subscriber.find(params[:id])
      subscriber.confirmed? ? subscriber.update_attributes(confirmed: false) : subscriber.update_attributes(confirmed: true)
      head :ok
    end
  end
end
