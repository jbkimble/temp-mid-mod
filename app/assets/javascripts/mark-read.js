var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var link = this.parentElement.parentElement.getElementsByTagName("p")[1].innerText

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });

    $.ajax({
      url: 'https://polar-journey-33706.herokuapp.com/api/v1/urls/',
      method: 'post',
      data: {url: link}
    });
  })
})
