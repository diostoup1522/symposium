# frozen_string_literal: true

class MessageFormComponent < ViewComponent::Base
  def initialize(form_id:, message:, discussion:)
    @form_id = form_id
    @message = message
    @discussion = discussion
  end
end
