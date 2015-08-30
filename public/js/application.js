$('document').ready(function(){

  console.log("hellpo");

  $('#run_survey').on("submit",function(event){
      var target = $(event.target);
      event.preventDefault();
      console.log("we stopped it")

      $.ajax(target.attr("action"),{
        data: target.serialize(),
        method: target.attr("method")
      }).done(function(response){
        $("#question_container").replaceWith(response);
      });

  });


});