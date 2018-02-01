class PagesController < ApplicationController
  before_action :set_event, only: [:index, :schedule, :speakers, :contact, :about, :sponsors]

  def index
    @subscribers = Subscriber.current_event
  end
  def contact

  end
  def faq

  end
  def about

  end
  def sponsors

  end
  def schedule

  end
  def speakers

  end

  private 

  def set_event
    @event = Event.active.first
  end
end
