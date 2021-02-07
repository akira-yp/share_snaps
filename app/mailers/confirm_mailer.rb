class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm_post)
    @confirm_ml = confirm_post
    mail to: ENV['MYMAIL'], subject:"投稿完了メール"
  end
end
