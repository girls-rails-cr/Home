module ApplicationHelper
  def confirmed
    @confirmed = Subscriber.where(confirmed: true)
    @confirmed.size
  end

  def registred
    @registred = Subscriber.where(registered: true)
    @registred.size
  end

  def second_confirmed
    @second_confirmed = Subscriber.where(second_confirmed: true)
    @second_confirmed.size
  end
end
