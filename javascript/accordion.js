/*
 Sample html code:

  <ul class="accordion-menu">
    <li class="item">
      <a href="#">Section 1</a>
      <ul>
        <li>...</li> 
        <li>...</li>
        <li>...</li>
      </ul>
    </li>
  </ul>
*/

$('.accordion-menu .item a').click(function() {
  var theul = $(this).next('ul');
  if (theul.length > 0) {
    theul.slideToggle()
  }
});
