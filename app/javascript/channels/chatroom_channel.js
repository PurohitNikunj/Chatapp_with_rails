import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var msg_container = document.getElementById('message-container');
    msg_container.insertAdjacentHTML('afterend', data.message);;
  }
});
