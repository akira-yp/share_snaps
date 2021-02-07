class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm_post)
    @confirm_ml = confirm_post
    mail to: "yog.puripuri@gmail.com", subject:"投稿完了メール"
  end
end
