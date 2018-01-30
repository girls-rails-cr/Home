module Admin
  class SubscribersController < Admin::BaseController
    before_action :set_subscriber,  only: [:show, :edit, :update, :destroy]

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
      @subscriber.update_attributes(comments: params[:comments], work: params[:work])
      redirect_to admin_root_path
    end

    def export_csv
      @subscribers = Subscriber.where(second_confirmed: true)
      respond_to do |format|
        format.csv { send_data @subscribers.as_csv }
      end
    end
    def new
      @subscriber = Subscriber.new
    end

    def create
      @subscriber = Subscriber.new(subscriber_params)
      respond_to do |format|
        if @subscriber.save
          format.html { redirect_to admin_subscribers_path, notice: 'Speaker was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def update
      if @subscriber.update(subscriber_params)
        redirect_to admin_subscribers_path
      else
        render :edit
      end
    end

    def destroy
      @subscriber.destroy
      respond_to do |format|
        format.html { redirect_to admin_subscribers_path }
      end
    end

    private

    def set_subscriber
      @subscriber = Subcriber.find_by_id(params[:id])
    end

    def subscriber_params
      params.require(:subscriber).permit(:name, :email, :source,  :comments,
                                          :work, :event_id, :level_knowledge, :phone_number)
    end

  end
end
