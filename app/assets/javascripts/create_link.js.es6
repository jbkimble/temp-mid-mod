var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $newLinkTitle = $("#link-title");
  $newLinkUrl  = $("#link-url");

  $("#new-link").on('submit', createLink);
})

function createLink (event){
  event.preventDefault();

  console.log("win")

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink(link) )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val()
 }
}

function renderLink(link){
  if (typeof link === 'string'){
  } else {
    $("#links-list").append( linkHTML(link) )
  }
  // clearLink();
}

function errorMessage() {
  return "<p>URL must be valid and lead with 'http://' or 'https://' </p>"
}

function linkHTML(link) {

    return `<div class='link' data-id='${link.title}' id="link-${link.title}">
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-read">Mark as Read</button>
                <button class="mark-unread">Mark as Unread</button>
                <button class='edit-link'>Edit</button>
                <button class='delete-link'>Delete</button>
              </p>
            </div>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  $("#error-messages").append( errorMessage() )
  console.log("FAILED attempt to create new Link: " + failureData.responseText);
}
