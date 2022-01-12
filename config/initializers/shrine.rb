
require "shrine/storage/file_system"
Shrine.plugin :derivatives
if Rails.env.production?
  require "shrine/storage/s3"
  require 'shrine/plugins/url_options'
 
  s3_options = { 
    bucket:            Rails.application.credentials.dig(:aws, :aws_bucket), # required 
    region:            "us-west-1", # required 
    access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
    secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),           
  }
   
  Shrine.storages = { 
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), # temporary 
    store: Shrine::Storage::S3.new(**s3_options),    # permanent  
  }


  Shrine.plugin :activerecord # or :shrine 
  Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays 
  Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
  Shrine.plugin :store_dimensions
  # Shrine.plugin :url_options, store: { host: "http://d2mmrchyq2qjf8.cloudfront.net" }

else

  Shrine.storages = { 
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent 
  }
   
  Shrine.plugin :activerecord # or :shrine 
  Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays 
  Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file 

end