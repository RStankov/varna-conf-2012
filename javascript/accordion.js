/*
 Sample html code:

  <ul class="accordion-menu">
    <li class="item">
      <a href="#" class="section-1">Section 1</a>
      <ul id="section-1">
        <li>...</li> 
        <li>...</li>
        <li>...</li>
      </ul>
    </li>
  </ul>
*/

$('.accordion-menu .item a').click(function() {
  var title = this.className;
  var theul = $('#' + title);
  if (theul.length > 0) {
    if (theul.css('display') == 'none') {
      theul.slideDown();
    } else {
      theul.slideUp(); 
    }
  }
});
