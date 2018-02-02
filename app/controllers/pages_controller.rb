class PagesController < ApplicationController
  before_action :set_event, only: [:index, :schedule, :speakers, :contact, :about, :sponsors]

  def index
    @subscribers = Subscriber.current_event
    @schedules = @event.schedules
    @sponsors = Sponsor.all
  end
  def contact

  end
  def faq
  end
  def about

  end
  def sponsors
    @sponsors = Sponsor.all
  end
  def schedule
    @schedules = @event.schedules
  end
  def speakers
  end

  private 

  def set_event
    @event = Event.active.first
  end
end
