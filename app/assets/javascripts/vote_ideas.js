$(document).ready(function () {
  $("a.upvote").click(function(event) {
    event.preventDefault();

    var link = $(this);
    $.getJSON( link.attr('href'), function( data ) {
      link.parent().find('h3.quality').html('Quality: ' + data.quality);
    });
  });

  $("a.downvote").click(function(e) {
    e.preventDefault();

    var link = $(this);
    $.getJSON( link.attr('href'), function (data) {        //attr('href') is extracting/finding the href link from the a tag...
      link.parent().find('h3.quality').html('Quality: ' + data.quality);
    })
  });
});
