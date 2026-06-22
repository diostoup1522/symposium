class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [ :google_oauth2 ]
  validates :username, :displayname, presence: true
  validates :username, length: { in: 3..15 }, format: { with: /\A[a-zA-Z0-9]+([a-zA-Z0-9](_|-)[a-zA-Z0-9])*[a-zA-Z0-9]+$\z/ }, uniqueness: true
  validates :displayname, length: { in: 3..25 }, format: { with: /\A[A-Za-z]+(?: [A-Za-z]+)*$\z/ }
  validates :bio, length: { in: 1..150 }, allow_blank: true
  has_many :discussions, foreign_key: "creator_id"
  has_many :messages, foreign_key: "messenger"
  has_many :messaged_discussions, through: :messages
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first
    unless user
      user = User.create(
        username: data["email"].split("@").first,
        displayname: data["name"],
        email: data["email"],
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
