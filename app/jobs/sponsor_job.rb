class SponsorJob
  include SuckerPunch::Job

  def perform(sponsor)
    mailchimp_list_id =  ENV["MAILCHIMP_LIST_ID"]
    api_key = ENV["MAILCHIMP_API_KEY"]
    begin
      $mailchimp = Gibbon::Request.new(api_key: api_key.to_s)
      $mailchimp.timeout = 30
      $mailchimp.open_timeout = 30
      $mailchimp.lists(mailchimp_list_id.to_s).members.create(body: { email_address: sponsor.email_contact.to_s, status: 'subscribed', merge_fields: { FNAME: subscriber.name.to_s, LNAME: '' } })
      SponsorMailer.sponsor_email(sponsor).deliver_now
    rescue Gibbon::MailChimpError => mce
      SuckerPunch.logger.error("subscribe failed: due to #{mce.message}")
      raise mce
    rescue Exception => e
      SuckerPunch.logger.error("subscribe failed: due to #{e.message}")
      raise e
    end
  end
end
