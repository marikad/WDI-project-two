// Javascript search

// $(function(){
//   $('#search-form').on('submit', searchAPI);
// });

function searchAPI(query){
  event.preventDefault();
  var query = $(this).find('input[type=text]').val();
  console.log(query)
  $.ajax({
    url: "http://api.themoviedb.org/3/search/movie?query="+query+"&api_key=e289afb7fe5adaeb4a56eb709fc9ebee"
  }).done(function(data){
    displayResults(data["results"]);
  })
}

function displayResults(results) {
  var container    = $("#movie-container");
  var image_prefix = "https://image.tmdb.org/t/p/w185/"
  $.each(results, function(index, movie) {
    // console.log(movie)
    container.prepend(
      "<div class='movie-tile'>"+
        "<ul>"+
          "<li><img src='"+image_prefix+movie.poster_path+"' class='movie-tile-image'></li>"+
          "<li id='title'>"+movie.original_title+"</li>"+
          "<div class='rw-ui-container'></div>"+
          "<li>"+movie.overview+"</li>"+
          "<li>Movie</li>"+
          "<li></li>"+
        "</ul>"+
      "</div>"
    );
  });
}