module Admin
  class DashboardsController < Admin::BaseController
    def index
      @subscribers = Subscriber.all.order("created_at ASC")
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

    def second_update_confirmed
      subscriber = Subscriber.find(params[:id])
      subscriber.second_confirmed? ? subscriber.update_attributes(second_confirmed: false) : subscriber.update_attributes(second_confirmed: true)
      head :ok
    end


    def update_details
      @subscriber = Subscriber.find(params[:id])
      @subscriber.update_attributes(comments:  params[:comments], work: params[:work] )
      redirect_to admin_root_path
    end
  end
end
