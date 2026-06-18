class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :username, :displayname, presence: true
  validates :username, length: { in: 3..15 }, format: { with: /\A[a-zA-Z0-9]+([a-zA-Z0-9](_|-)[a-zA-Z0-9])*[a-zA-Z0-9]+$\z/ }, uniqueness: true
  validates :displayname, length: { in: 3..25 }, format: { with: /\A[A-Za-z]+(?: [A-Za-z]+)*$\z/ }
  has_many :created_posts, foreign_key: "author_id", class_name: "Post"
end
