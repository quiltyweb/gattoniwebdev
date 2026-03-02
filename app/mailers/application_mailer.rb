class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mail_to
  layout 'mailer'
end

