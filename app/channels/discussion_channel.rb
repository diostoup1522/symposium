class DiscussionChannel < ApplicationCable::Channel
  def subscribed
    @discussion = Discussion.find(params[:id])
    stream_for @discussion
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
