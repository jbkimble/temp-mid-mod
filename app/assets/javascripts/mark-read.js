var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var link = this.parentElement.parentElement.getElementsByTagName("p")[1].innerText

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true, url: link}
    });

    // $.ajax({
    //   url: '/api/v1/hots/',
    //   method: 'GET',
    //   data: {url: link}
    // });
  })
})
