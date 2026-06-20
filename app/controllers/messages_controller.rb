class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @discussion = Discussion.find(params.require(:discussion_id))
    @message = @discussion.messages.build(message_params.merge(messenger: current_user))
    if @message.save
      messagecomp = render_to_string(MessageComponent.new(message: @message))
      DiscussionChannel.broadcast_to(@discussion, messagecomp)
    end
  end
  private
    def message_params
      params.expect(message: [ :body ])
    end
end
