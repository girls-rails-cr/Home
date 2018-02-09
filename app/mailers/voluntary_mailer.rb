class VoluntaryMailer < ApplicationMailer
  default from: 'noreply@railsgirlscr.org'
  layout 'mailer'

  def voluntary_email(voluntary)
    @voluntary = voluntary
    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/face.png")
    mail(to: @voluntary.email, subject: "Bienvenido eres nuestro nuevo Voluntario")
  end
end
