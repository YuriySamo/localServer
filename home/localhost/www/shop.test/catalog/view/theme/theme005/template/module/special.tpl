<script>
$(function(){
$('.box-product.spec-box ul li').last().addClass('last');
});
</script>
<div class="box">
  <div class="box-content">
    <div class="box-product spec-box">
    <ul>
      <?php foreach ($products as $product) { ?>
      <li>
      <div class="bg-spec"></div>
        <?php if ($product['thumb']) { ?>
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>"  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>

        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?><span class="price-new"><?php echo $product['special']; ?></span>
          <span class="price-old"><?php echo $product['price']; ?></span> 
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
    <div class="cart"><a href="<?php echo $product['href']; ?>" class="button"><span><?php echo $button_details; ?></span></a></div>
    <div class="clear"></div>
     <div class="description"><?php echo $product['description']; ?></div>
      <div class="manufacturer"><?php echo $product['manufacturer_image']; ?></div>
 
      </li>
      <?php } ?>
      </ul>
      
    </div>
  </div>
</div>
