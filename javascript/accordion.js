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

$('.accordion-menu .item a').live('click', function() {
  $(this).next('ul').slideToggle()
});
