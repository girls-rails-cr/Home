class SubscriberMailer < ApplicationMailer
  default from: 'noreply@railsgirlscr.org'
  layout 'mailer'

  def subscriber_email(subscriber)
    @subscriber = subscriber
    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/face.png")
    mail(to: @subscriber.email, subject: "Bienvenido")
  end
end
