class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  has_many :stamps, dependent: :destroy

# 投稿のあるユーザーが、その投稿に既に押したスタンプを取得
def stamp_for(user)
  stamps.find_by(user: user)
end
end
