$(document).ready(function () {
  $("a.delete").click(function(event) {
    event.preventDefault();

    $('.idea').remove();
  });
});
