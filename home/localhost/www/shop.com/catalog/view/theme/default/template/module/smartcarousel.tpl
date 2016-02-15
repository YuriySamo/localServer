<?php if(count($orderArr) == 0){ ?>
<div class="box"><div class="box-heading">Smart Carousel</div><div class="sc-content"></div></div>
<?php }else{ ?>

<div class="box">
	<div class="box-heading sc-menu">
		<?php foreach($orderArr as $k => $v){ ?>
			<div class="<?php echo $widthClass; ?>">
			<a id="sc-<?php echo $k; ?>" title="<?php echo $MS[$k]['title']; ?>" <?php echo $activeTitle==$k ? 'class="active"' : ''; ?> href="javascript:;"><?php echo $MS[$k]['title']; ?></a>
			</div>
		<? } ?>	
	</div>
	
	<div class="sc-content">
		
		<?php if(isset($orderArr['featured'])){ ?>
		
		<div id="featuredSlider" <?php if($activeTitle!='featured'){ ?>style="display:none;"<?php } ?> class="sc_carousel">	
		  <div id="carousel_featured">
			  <ul class="jcarousel-skin-opencart">
			    <?php foreach ($f_products as $product) { ?>
				  <li>
				    <?php if ($product['thumb']) { ?>
				    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
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
				    <?php } ?>
				    <?php if ($product['rating']) { ?>
				    <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				    <?php } ?>
				    <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
				  </li>
				  <?php } ?>
			  </ul>
		  </div>
		</div>
		
		<?php } ?>
		<?php if(isset($orderArr['mostnew'])){ ?>

		<div id="mostSlider" <?php if($activeTitle!='mostnew'){ ?>style="display:none;"<?php } ?> class="sc_carousel">	
		  <div id="carousel_mostnew">
			  <ul class="jcarousel-skin-opencart">
			    <?php foreach ($m_products as $product) { ?>
				  <li>
				    <?php if ($product['thumb']) { ?>
				    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
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
				    <?php } ?>
				    <?php if ($product['rating']) { ?>
				    <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				    <?php } ?>
				    <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
				  </li>
				  <?php } ?>
			  </ul>
		  </div>
		</div>
		
		<?php } ?>
		<?php if(isset($orderArr['lastview'])){ ?>
		
		<div id="lastviewSlider" <?php if($activeTitle!='lastview'){ ?>style="display:none;"<?php } ?> class="sc_carousel">	
		  <div id="carousel_lastview">
			  <ul class="jcarousel-skin-opencart">
			    <?php foreach ($l_products as $product) { ?>
				  <li>
				    <?php if ($product['thumb']) { ?>
				    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
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
				    <?php } ?>
				    <?php if ($product['rating']) { ?>
				    <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				    <?php } ?>
				    <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
				  </li>
				  <?php } ?>
			  </ul>
		  </div>
		</div>
		
		<?php } ?>
		<?php if(isset($orderArr['wishlist'])){ ?>
		
		<div id="wishlistSlider" <?php if($activeTitle!='wishlist'){ ?>style="display:none;"<?php } ?> class="sc_carousel">	
		  <div id="carousel_wishlist">
			  <ul class="jcarousel-skin-opencart">
		  	  <?php if(count($w_products) > 0){ ?>
			    <?php foreach ($w_products as $product) { ?>
				  <li>
				    <?php if ($product['thumb']) { ?>
				    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
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
				    <?php } ?>
				    <?php if ($product['rating']) { ?>
				    <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				    <?php } ?>
				    <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
				  </li>
				  <?php } ?>
			  <?php }else{ ?>
			  <li>&nbsp;</li>
			  <?php } ?>
			  </ul>
		  </div>
		</div>
		
		<?php } ?>
		
	</div>
</div>

<script type="text/javascript"><!--
var carouselSetting = <?php echo $carousel_setting; ?>;
$('#carousel_<?php echo $activeTitle; ?> ul').jcarousel(carouselSetting);
//--></script>

<?php } ?>