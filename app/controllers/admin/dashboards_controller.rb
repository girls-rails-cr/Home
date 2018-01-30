module Admin
  class DashboardsController < Admin::BaseController
    def index
      @event = Event.active
      @subscribers = Subscriber.current_event
    end
  end
end
