class Stamp < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :stamp_type, presence: true
end