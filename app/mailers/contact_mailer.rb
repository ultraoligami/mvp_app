class ContactMailer < ApplicationMailer
    # Render で設定した受信先メールアドレス
    default to: ENV["CONTACT_RECEIVER_EMAIL"]
  
    # SendGrid 認証済みの送信元メール
    default from: "さぼログ <kinako10012019@icloud.com>"
  
    def send_contact(contact)
      @contact = contact
  
      mail(
        subject: "【さぼログ】お問い合わせが届きました",
        reply_to: @contact.email
      )
    end
  end