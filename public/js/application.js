$('document').ready(function(){

  console.log("hellpo");

  $('#start_survey').on("submit",function(event){
      var target = $(event.target);
      event.preventDefault();
      console.log("we stopped it")

  });


});