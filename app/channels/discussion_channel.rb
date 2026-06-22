class DiscussionChannel < ApplicationCable::Channel
  def subscribed
    @discussion = Discussion.find(params[:id])
    stream_for @discussion
  end

  def unsubscribed
    stop_all_streams
  end
end
