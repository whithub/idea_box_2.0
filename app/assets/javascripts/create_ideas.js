//$(document).ready(function () {
//  $(".create-idea").click(function(event) {
//    event.preventDefault();
//    //alert("Both title and description must be filled in.");
//    function chkform() {
//
//      if (document.getElementById("#idea-form") === ""); {
//        var e = new Error('Could not parse input'); // e.message is 'Could not parse input'
//        throw e;
//      }
//    }
//  });
//});

$(document).ready(function () {

  $('.idea-form').submit(function(e) {
    console.log("Hello world!")
    $(this).find('.form-field').each(function(n, element) {
      console.log("Hello ...!")
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
