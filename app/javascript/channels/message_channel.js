import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<li class="comment-li">
    <h3 class="comment-name" >
     ${data.user.nickname}
    </h3>
  <div class="fukidasi-box">
    <p class="comment">
      ${data.content.content}
    </p>
  </div>
</li>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
