document.addEventListener('turbolinks:load', function() {

  $("#inputFile01").on("change", function() {
  var files = document.getElementById("inputFile01").files;
  var file_list = "";
  for(var i=0; i<files.length; i++){
    if(i !== files.length - 1) {
      file_list += files[i].name + ", " ;
    }else {
      file_list += files[i].name ;
    }
  }
  document.getElementById("selectedFiles").innerHTML = file_list;
  })

  $('.square-image').mouseover(function(){
    $(this).next('.card-img-overlay').removeClass('disappear');
  })
  $('.square-image').mouseout(function(){
    $(this).next('.card-img-overlay').addClass('disappear');
  })
});
