class PagesController < ApplicationController
  def index
  	@subscribers = Subscriber.all
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
end
