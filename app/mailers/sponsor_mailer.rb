class SponsorMailer < ApplicationMailer
  default from: 'noreply@railsgirlscr.org'
  layout 'mailer'

  def sponsor_email(sponsor)
    @sponsor = sponsor
    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/face.png")
    mail(to: @sponsor.email_contact, subject: "Rails Girls Sponsor")
  end
end
