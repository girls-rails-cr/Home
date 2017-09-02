class SubscriberMailer < ApplicationMailer
  default from: 'noreply@railsgirlscr.org'
  layout 'mailer'

  def subscriber_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Bienvenido")
  end
end
