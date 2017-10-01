$(function(){

  $(document).on('click', '.pagination a', function(){
    $('.loading').show();
    $('.pagination').html("Page is loading..!!");
    $.get(this.href, null, null, "script");
    return false;
  });

});
