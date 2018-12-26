
var favorites = {
  
}
$(function() {
  $(".thx-button").click(function() {
    var ele = $(this).parent().parent().children(".comment-name").children(".comment-thx-num");
    var thxNum = parseInt(ele.text());
    if (ele.hasClass("did-thank")) {
      ele.css("background-image", "url(/assets/thread-like-b.png)");
      ele.text("" + (thxNum - 1));
      ele.removeClass("did-thank");
    } else {
      ele.css("background-image", "url(/assets/thread-like.png)");
      ele.text("" + (thxNum + 1));
      ele.addClass("did-thank");
    }
  });
});
