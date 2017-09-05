module ApplicationHelper
  def confirmed
    @confirmed = Subscriber.where(confirmed: true)
    @confirmed.size
  end

  def registred
    @registred = Subscriber.where(registered: true)
    @registred.size
  end
end
