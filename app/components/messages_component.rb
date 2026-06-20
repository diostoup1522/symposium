# frozen_string_literal: true

class MessagesComponent < ViewComponent::Base
  def initialize(messages:)
    @messages = messages
  end
end
