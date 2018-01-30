CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production? || Rails.env.staging?
    config.fog_credentials = {
      provider:              'AWS',                                   # required
      aws_access_key_id:     Rails.configuration.aws['aws_access_key_id'],     # required
      aws_secret_access_key: Rails.configuration.aws['aws_secret_access_key'], # required
      #region:               'eu-west-1'                              # optional, defaults to 'us-east-1'
      #host:                 's3.example.com',                        # optional, defaults to nil
      #endpoint:             'https://s3.example.com:8080'            # optional, defaults to nil
    }

    config.fog_provider = 'fog/aws'                                 # required
    config.storage = :fog

    config.fog_directory   = Rails.configuration.aws['aws_bucket_name']        # required
    #config.fog_host       = 'https://assets.example.com'             # optional, defaults to nil
    #config.fog_public     = false                                    # optional, defaults to true
    config.fog_attributes  = {'Cache-Control'=>'max-age=315576000'}   # optional, defaults to {}
  end
end
