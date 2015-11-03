$(function(){

  var films = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: 'http://api.themoviedb.org/3/search/movie?query=%QUERY&api_key=e289afb7fe5adaeb4a56eb709fc9ebee',
      wildcard: '%QUERY'
    }
  });

  $('#remote .typeahead').typeahead(null, {
    name: 'best-pictures',
    display: 'results',
    source: films
  });

});