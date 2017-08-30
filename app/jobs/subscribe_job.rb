class SubscribeJob
  include SuckerPunch::Job

  def perform(subscriber)
    mailchimp_list_id = MAILCHIMP_API_KEY['mailchimp_list_id']
    begin
      $mailchimp.lists(mailchimp_list_id.to_s).members.create(body: { email_address: subscriber.email.to_s, status: 'subscribed', merge_fields: { FNAME: subscriber.name.to_s, LNAME: '' } })
    rescue Gibbon::MailChimpError => mce
      SuckerPunch.logger.error("subscribe failed: due to #{mce.message}")
      raise mce
    rescue Exception => e
      SuckerPunch.logger.error("subscribe failed: due to #{e.message}")
      raise e
    end
  end
end
