<div class="slideshow">
  <div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a title="serega" href="<?php echo $banner['link']; ?>"><img title="<?php echo $banner['title']; ?>" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>

    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
        $('#slideshow<?php echo $module; ?>').nivoSlider({
        	effect: 'fade',
		animSpeed: 500 ,
        pauseTime:500000,
		slices:20,
		captionOpacity:1,
		controlNavThumbs:false,
        controlNavThumbsFromRel:false,
		controlNavThumbsSearch: '.jpg',
		controlNavThumbsReplace: '_thumb.jpg',
		prevText: 'Prev',
		nextText: 'Next'
        });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
$(function(){
$('.nivo-controlNav a').eq(0).addClass('slide1');
$('.nivo-controlNav a').eq(1).addClass('slide2');
$('.nivo-controlNav a').eq(2).addClass('slide3');
$('.nivo-controlNav a').eq(3).addClass('slide4');
$('.nivo-controlNav a').eq(4).addClass('slide5');
$('.nivo-controlNav a').eq(5).addClass('slide6');
});

});</script>