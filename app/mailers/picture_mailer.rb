class PictureMailer < ApplicationMailer
    def picture_mail(picture)
        @picture = picture
        mail to: "youohta7755@gmail.com", subject: "投稿確認メール"
      end
end
