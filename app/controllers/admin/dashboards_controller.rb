module Admin
  class DashboardsController < Admin::BaseController
    def index
      @subscribers = Subscriber.all
    end
  end
end
