# frozen_string_literal: true

class NewMessageComponent < ViewComponent::Base
  def initialize(message:)
    @message = message
  end
end
