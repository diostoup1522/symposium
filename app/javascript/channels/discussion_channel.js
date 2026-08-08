import consumer from "channels/consumer"

let subscription;

function subscribeToDiscussion() {
  const discussionId = document.querySelector("#discussionId")?.textContent || null;
  if (!discussionId) return;
  const userId = document.querySelector("#userId")?.textContent || null;
  if (subscription) return;
  subscription = consumer.subscriptions.create({ channel: "DiscussionChannel", id: discussionId }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
      subscription = null;
    },

    received(data) {
      const messages = document.querySelector("#messages");
      console.log(data);
      messages.insertAdjacentHTML("beforeend", data[0]);
      const message = messages.lastElementChild;
      if (data[1] != null && data[1] == userId) {
        message.classList.add("text-right", "ml-auto");
      } else {
        message.classList.add("text-left", "mr-auto");
      }
    }
  });
}
document.addEventListener("turbo:load", () => {
  subscribeToDiscussion()
});
document.addEventListener("turbo:before-cache", () => {
  if (subscription) {
    subscription.unsubscribe();
    subscription = null;
  }
});
