# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_event, only: %i[index voluntaries speakers contact about sponsors]
  before_action :set_current_sponsors, only: %i[index sponsors]
  before_action :current_speakers, only: %i[index speakers]
  before_action :set_schedule, only: %i[index]
  before_action :set_subscribers, only: %i[index]

  def index
  end

  def contact
  end

  def faq
  end

  def about
  end

  def sponsors
  end

  def voluntaries
  end

  def speakers
  end

  private

  def set_event
    @event = Event.includes(:schedules).active.first
  end

  def set_current_sponsors
    @current_sponsors = Sponsor.current_sponsors(@event.id)
  end

  def current_speakers
    @current_speakers = User.current_speakers(@event.id)
  end

  def set_schedule
    @schedules = @event.schedules.includes(:schedule_details)
  end

  def set_subscribers
    @subscribers = Subscriber.current_subscribers(@event.id)
  end

end
