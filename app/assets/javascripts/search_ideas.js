$(document).ready(function () {

  var $searchField = $('#idea_search_title')

  $searchField.on('keyup', function () {
    var searchTerm = this.value.toLowerCase();
    $('.idea').each(function (index, idea) {
      var title = $(idea).find('h1').text().toLowerCase();
      var matches = title.indexOf(searchTerm) !== -1;
      $(idea).toggle(matches);
    });
  });
});
