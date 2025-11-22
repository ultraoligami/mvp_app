class Forms::ContactForm
    include ActiveModel::Model
    include ActiveModel::Attributes
  
    attribute :name, :string
    attribute :email, :string
    attribute :message, :string
  
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :message, presence: true, length: { minimum: 10 }
  end