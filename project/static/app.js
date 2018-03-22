$(function() {
  let $body = $("body");
  $body.on("click", ".like-btn", e => {
    $closestLink = $(e.currentTarget).closest("span");
    if ($closestLink.hasClass("liked")) {
      dislike($closestLink);
      $closestLink.removeClass("liked");
      $closestLink.addClass("disliked");
    } else {
      like($closestLink);
      $closestLink.removeClass("disliked");
      $closestLink.addClass("liked");
    }
  });

  function dislike($closestLink) {
    ids = $closestLink.attr("id").split("-");
    messageId = ids[0];
    userId = ids[1];
    return $.ajax({
      method: "DELETE",
      url: `/users/${userId}/messages/${messageId}/like`
    }).then(() => {
      console.log(messageId);
      console.log(userId);
      $closestLink.html('<i class="far fa-hand-spock"></i>');
    });
  }

  function like() {
    ids = $closestLink.attr("id").split("-");
    messageId = ids[0];
    userId = ids[1];
    return $.ajax({
      method: "POST",
      url: `/users/${userId}/messages/${messageId}/like`
    }).then(() => {
      console.log(messageId);
      console.log(userId);
      $closestLink.html('<i class="fas fa-hand-spock"></i>');
    });
  }
});
