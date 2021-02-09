$(function(){
  $(".square-image").mouseover(function(){
    $(this).next().removeClass(".disappear");
  });
  $(".square-image").mouseout(function(){
    $(this).next().addClass(".disappear");
  });
});
