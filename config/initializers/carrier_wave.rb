CarrierWave.configure do |config|

  #Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production? || Rails.env.staging?
    config.fog_credentials = {
      provider:              'AWS',                                   # required
      aws_access_key_id:     ENV['AWS_ACCESS_KEY'],     # ''
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # required
      region:               'us-west-2'                           # optional, defaults to 'us-east-1'
      #host:                 's3.example.com',                        # optional, defaults to nil
      #endpoint:             's3.us-west-2.amazonaws.com'            # optional, defaults to nil
    }
    config.fog_provider = 'fog/aws'                                 # required
    config.storage = :fog

    config.fog_directory   = ENV['AWS_BUCKET_NAME']       # required
    #config.fog_host       = 'https://assets.example.com'             # optional, defaults to nil
    #config.fog_public     = false                                    # optional, defaults to true
    config.fog_attributes  = {'Cache-Control'=>'max-age=315576000'}   # optional, defaults to {}
  end
end
