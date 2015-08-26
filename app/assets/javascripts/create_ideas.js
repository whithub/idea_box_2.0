$(document).ready(function () {

  $('.idea-form').submit(function(e) {
    $(this).find('.form-field').each(function(n, element) {
      if ($(element).val() == '') {
        e.preventDefault();
        alert('You goof... You need both title and description to create an idea.');
        $(element).parent().addClass("error");

        return false;
      }
    });
    return true;
  });
});
