$( document ).ready(function() {
  $('#comment-box').hide();

  $("#open-comment-link").click(function(e) {
    e.preventDefault();
    $('#comment-box').slideToggle();
  });

});
