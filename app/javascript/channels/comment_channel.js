import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html =`
      <div class="user-comment">
        <div class="user-comment-name">
          <strong>${data.user}</strong>
        </div>
        <div class="user-comment-text">
          ${data.content.text}
        </div>
        <div class="buy-comment-none">
        </div>
      </div>`;
    const comments = document.getElementById('comment');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('beforebegin', html);
    newComment.value='';  
  }
});
