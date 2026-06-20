import consumer from "channels/consumer"
const discussionId = document.querySelector("#discussionId")?.textContent || null;
consumer.subscriptions.create({ channel: "DiscussionChannel", id: discussionId }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.querySelector("#messages");
    messages.insertAdjacentHTML("beforeend", data);
  }
});
