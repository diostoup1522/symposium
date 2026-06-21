class Discussion < ApplicationRecord
  validates :book, :author, :description, presence: true
  validates :book, length: { in: 1..100 }
  validates :author, length: { in: 1..70 }, format: { with: /\A\p{L}[\p{L} \.\'-]+\z/u }
  validates :description, length: { maximum: 300 }, allow_blank: true
  belongs_to :creator, class_name: "User"
  has_many :messages, foreign_key: "messaged_discussion", dependent: :destroy
  has_many :messengers, through: :messages
end
