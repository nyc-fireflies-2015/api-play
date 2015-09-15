$(document).ready(function(){
  $('#get_api').on('click', function(event){
    $.getJSON("http://www.reddit.com/r/pics.json?jsonp=?", function(response){
      $.each(response.data.children.slice(0,10), function(i, post){
        $(".content").append( '<br>' + post.data.title );
        $(".content").append( '<br>' + post.data.url );
        $(".content").append( '<br>' + post.data.permalink );
        $(".content").append( '<br>' + post.data.ups );
        $(".content").append( '<br>' + post.data.downs );
        $(".content").append( '<hr>' );
      })
    })
  })
})