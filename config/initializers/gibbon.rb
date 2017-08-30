yml = YAML.load_file("#{Rails.root}/config/mail_chimp.yml")
MAILCHIMP_API_KEY = yml['default']
MAILCHIMP_API_KEY.merge!(yml[Rails.env]) unless yml[Rails.env].nil?
MAILCHIMP_API_KEY.freeze
$mailchimp = Gibbon::Request.new(api_key: "#{MAILCHIMP_API_KEY['mailchimp_api_key']}")
$mailchimp.timeout = 30
$mailchimp.open_timeout = 30
