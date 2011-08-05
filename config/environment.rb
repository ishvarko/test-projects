# Load the rails application
require File.expand_path('../application', __FILE__)

# require your gems as usual

# Initialize the rails application
OnAppTask::Application.initialize!

OnAppTask::Application.configure do
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address => "smtp.gmail.com" ,
  :port=> 587,
  :domain => "localhost", 
  :authentication => "plain", 
  :user_name => "email" ,
  :password=> "pass" , 
  :enable_starttls_auto => true
}
end