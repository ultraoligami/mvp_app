class ContactMailer < ApplicationMailer
    default to: "kinako10012019@icloud.com"
  
    def send_contact(contact)
      @contact = contact
      mail(
        subject: "【さぼログ】お問い合わせが届きました",
        from: @contact.email
      )
    end
  end