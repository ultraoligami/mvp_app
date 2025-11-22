class ContactsController < ApplicationController
  def new
    @contact = Forms::ContactForm.new
  end

  def create
    @contact = Forms::ContactForm.new(contact_params)
    if @contact.valid?
      ContactMailer.send_contact(@contact).deliver_now
      redirect_to contacts_thanks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:forms_contact_form).permit(:name, :email, :message)
  end
end