class ApplicationMailer < ActionMailer::Base
  default from: ENV['MYEMAI']
  layout 'mailer'
end
