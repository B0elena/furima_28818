import consumer from "./consumer"

consumer.subscriptions.create("CommenttChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html =`
      <div class="buy-comment">
        <div class="buyer-comment-name">
        </div>
        <div class="buyer-comment-text">
          ${data.content.text}
        </div>
        <div class="buy-comment-name">
          <strong>${data.user}</strong>
        </div>
      </div>`;
    const comments = document.getElementById('comment');
    const newComment = document.getElementById('comment_text');
    const commentBtn = document.getElementById('commentbtn')
    console.log(commentBtn)
    comments.insertAdjacentHTML('beforebegin', html);
    newComment.value='';
    newComment.addEventListener('input', function(){
      commentBtn.disabled = false;
    })
  }
});
