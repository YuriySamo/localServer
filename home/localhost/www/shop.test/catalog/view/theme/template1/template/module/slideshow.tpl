<div class="slideshow row">
  <ul id="slidebox" class="sb-slider">
    <?php foreach ($banners as $banner) { ?>
    <li>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<script type="text/javascript" src="catalog/view/javascript/modernizr.custom.46884.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery.slicebox.js"></script>
<script type="text/javascript"><!--
// $(document).ready(function() {
// 	$('#slideshow<?php echo $module; ?>').nivoSlider();
// });
-->
$(document).ready(function() {
  $('#slidebox').slicebox({
    autoplay: true,
    cuboidsCount : 8
  });
});
</script>