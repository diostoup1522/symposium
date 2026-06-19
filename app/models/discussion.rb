class Discussion < ApplicationRecord
  validates :book, :author, :description, presence: true
  validates :book, length: { in: 1..50 }
  validates :author, length: { in: 3..70 }, format: { with: /\A[a-zA-Z\p{L} \.\'-]+$\z/, multiline: true }
  validates :description, length: { in: 5..300 }
  belongs_to :creator, class_name: "User"
  has_many :messages, foreign_key: "messaged_discussion", dependent: :destroy
  has_many :messengers, through: :messages
end
