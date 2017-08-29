class PagesController < ApplicationController
  def index
    @subscriber = Subscriber.new
  end
end
