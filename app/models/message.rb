class Message < ApplicationRecord
  validates :messenger_id, :messaged_discussion_id, :body, presence: true
  belongs_to :messenger, class_name: "User"
  belongs_to :messaged_discussion, class_name: "Discussion"
end
