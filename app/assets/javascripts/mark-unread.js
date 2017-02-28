var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var link = this.parentElement.parentElement.getElementsByTagName("p")[1].innerText
    this.parentElement.parentElement.getElementsByTagName("p")[2].innerText = "false"

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false, url: link}
    });

  })

})
