import consumer from "channels/consumer"
function subscribeToDiscussion() {
  const discussionId = document.querySelector("#discussionId")?.textContent || null;
  if (!discussionId) return;
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
}
document.addEventListener("turbo:load", () => {
  subscribeToDiscussion()
})