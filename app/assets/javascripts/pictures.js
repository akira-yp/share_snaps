$(function(){

  $('.custom-file-input').on('change',function(){
  $(this).next('.custom-file-label').html($(this)[0].files[0].name);
  })

  $('.square-image').mouseover(function(){
    $(this).next().removeClass('.disappear');
  })
  $('.square-image').mouseout(function(){
    $(this).next().addClass('.disappear');
  })

});
