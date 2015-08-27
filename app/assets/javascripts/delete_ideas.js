$(document).ready(function () {
  $("a.delete").click(function(event) {
    event.preventDefault();

    var idea = $(this).closest('.idea');
    var link = $(this);
    $.ajax({
      url: link.attr('href'),
      type: "POST",
      dataType: "json",
      data: {"_method":"delete"},
      complete: function(result) {
        idea.remove();
      }
    });
  });
});
