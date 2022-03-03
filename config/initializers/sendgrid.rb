if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
    user_name:        'jmgrant702@gmail.com',
    password:         ENV['GOOGLE_KEY'], #Rails.application.credentials.dig(:google_key),
    domain:          'gmail.com',
    address:         'smtp.gmail.com',
    port:            '587',
    authentication:  :plain,
    enable_starttls_auto: true
  }
end