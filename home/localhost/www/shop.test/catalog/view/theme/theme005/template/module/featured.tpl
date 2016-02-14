<script >
$(function(){
  $('#loopedCarousel').loopedCarousel({
		container: '.container',
		slides: '.slides',
		pagination: '.pagination',
		autoStart:5000, // Set to positive number for auto interval and interval time
		slidespeed: 300, // Speed of slide animation
		fadespeed: 300, // Speed of fade animation
		items:3, // Items show
		padding:0, // Padding between items
		showPagination: true, // Shows pagination links
		vertical: false
  });
});
</script>

<div class="box home-block">
  <div class="box-featured">
<div id="loopedCarousel">
	<div class="container">
		<div class="slides">
      <?php foreach ($products as $product) { ?>
      <div class="product-col">
      <div class="hover-spesial"></div>
        <?php if ($product['thumb']) { ?>
        <div class="image2"><a href="<?php echo $product['href']; ?>"><img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?></div>
      <?php } ?>
    
   </div>
  </div>
  	<a href="#" class="previous">previous</a>
	<a href="#" class="next">next</a>
</div>
  </div>
</div>
