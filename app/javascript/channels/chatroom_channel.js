import consumer from "channels/consumer"
  
// document.addEventListener('turbolinks:load', () => {
  const element = document.getElementById('chat_room_id');

  consumer.subscriptions.create({channel: "ChatroomChannel", room_id: element.value},
  {
    connected() {
      console.log("Connected to room-channel")
      // Called when the subscription is ready for use on the server
    },
    
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
    
    received(data) {
      var msg_container = document.getElementById('message-container');
      msg_container.insertAdjacentHTML('beforeend', data.message);
      console.log(data)
    }
  });
// })
