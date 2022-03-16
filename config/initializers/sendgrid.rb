if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
    address:         'smtp.gmail.com',
    port:            '587',
    user_name:        ENV['GOOGLE_USERNAME'],
    password:         ENV['GOOGLE_KEY'], #Rails.application.credentials.dig(:google_key),
    authentication:  :plain,
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
    address:         'smtp.gmail.com',
    port:            '587',
    user_name:        Rails.application.credentials.dig(:google_username),
    password:         Rails.application.credentials.dig(:google_key),
    authentication:  :plain,
    enable_starttls_auto: true
  }
end