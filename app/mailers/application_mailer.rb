class ApplicationMailer < ActionMailer::Base
  default from: ENV['MYMAIL']
  layout 'mailer'
end
