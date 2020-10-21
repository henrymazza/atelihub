import consumer from "./consumer";

consumer.subscriptions.create("ProgressNotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
      console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log("Recieving:");
      console.log(data.content);

      const content = data.content;

      $('.progress-bar').css('width', content.progress + '%');
      $('.progress-bar').text(content.progress + '%');
      $('.repo-counter').text(content.repositories);

      if(content.progress == 100) {
          Turbolinks.visit('/');
      }
  }
});
