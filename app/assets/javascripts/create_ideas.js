$(document).ready(function () {

  $('form.new_idea').submit(function(e) {
    //e.preventDefault();
    $(this).find('.form-field').each(function(n, element) {
      if ($(element).val() == '') {

        alert('You goof... You need both title and description to create an idea.');
        $(element).parent().addClass("error");

        return false;
      }
    });

    return true;

    //var valuesToSubmit = $(this).serialize();
    //$.ajax({
    //  type: "POST",
    //  url: $(this).attr('action'), //sumbits it to the given url of the form
    //  data: valuesToSubmit,
    //  dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    //}).success(function(json){
    //  console.log("success", json);
    //  new_idea = '<div class="idea">';
    //  new_idea = new_idea + '<h1>' + json.title + '</h1>';
    //  new_idea = new_idea + '<dl><h3 class="quality">Quality:' + json.quality + '</h3>';
    //  new_idea = new_idea + '<h3 class="description">' + json.description + '</h3>';
    //
    //  new_idea = new_idea + '</dl></div>';
    //  $('.ideas').prepend(new_idea);
    //});
  });

});


