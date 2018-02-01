module Admin
  class EventsController < Admin::BaseController
    before_action :set_admin_event, only: [:show, :edit, :update, :destroy]

    def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def edit
      @event_attachments = @event.event_attachments.all
    end

    def create
      @event = Event.new(event_params)
      respond_to do |format|
        if @event.save
          format.html { redirect_to admin_events_url, notice: 'Event was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to admin_events_url, notice: 'Event was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @event.destroy
      respond_to do |format|
        format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      end
    end

    private
    def set_admin_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title,
                                    :title,
                                    :description,
                                    :venue_description,
                                    :start_time,
                                    :video_url,
                                    :venue_short_description,
                                    :map_url,
                                    :background_image,
                                    :status,
                                    schedules_attributes: [:id,
                                                           :name,
                                                           :_destroy,
                                                            schedule_details_attributes:[
                                                              :id,
                                                              :name,
                                                              :schedule_id,
                                                              :name,
                                                              :date_name,
                                                              :user_id,
                                                              :_destroy
                                                            ]
                                                           ],
                                    event_attachments_attributes: [:id,
                                                                   :event_id,
                                                                   :img,
                                                                   :attach,
                                                                   :_destroy]
                                  )

    end
  end
end
