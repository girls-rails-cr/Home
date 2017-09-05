class PagesController < ApplicationController
  def index
  	@subscribers = Subscriber.all
  end
end
