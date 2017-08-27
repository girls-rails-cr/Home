class PagesController < ApplicationController
  def index
    cookies[:saved_load] = false
    @subscriber = Subscriber.new
  end
end
