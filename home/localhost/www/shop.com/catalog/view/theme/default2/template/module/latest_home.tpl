<?php if ($products) { ?>
<div class="top">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center">
    <h1><?php echo $heading_title; ?></h1>
  </div>
</div>

<div class="middle">
  <table class="list">
  <?php for ($i = 0; $i < sizeof($products); $i = $i + 3) { ?>
    <tr>
      <?php for ($j = $i; $j < ($i + 3); $j++) { ?>
      <td style="width: 25%;"><?php if (isset($products[$j])) { ?>
      <a href="<?php echo str_replace('&', '&amp;', $products[$j]['href']); ?>"><img src="<?php echo $products[$j]['thumb']; ?>" title="<?php echo $products[$j]['name']; ?>" alt="<?php echo $products[$j]['name']; ?>" /></a>
      <br /><br />
      <a href="<?php echo str_replace('&', '&amp;', $products[$j]['href']); ?>"><?php echo $products[$j]['name']; ?></a><br />
        <span style="color: #999; font-size: 11px;"><?php echo $products[$j]['model']; ?></span><br />
    
      <br />
  <div class="clear">	  
    <div class="box_price">
      <?php if ($display_price) { ?>
      <?php if (!$products[$j]['special']) { ?>
      <span class="product_price"><?php echo $products[$j]['price']; ?></span>
      
      
	  <?php } else { ?>
     <span style="color: #990000;text-decoration: line-through;"><?php echo $products[$j]['price']; ?></span> 
	  <span style="color: #494949;font-size: 15px; font-weight: bold;"><?php echo $products[$j]['special']; ?></span>
      <?php } ?>
      <?php } ?>
	</div> 
    
    <div class="button_add">	
      <a class="button_add_small" href="<?php echo $products[$j]['add']; ?>" title="<?php echo $button_add_to_cart; ?>" >&nbsp;<?php echo $button_add_to_cart; ?> </a>
    
	</div> 
  
  </div>	
      
      
   
      
      
      <?php } ?></td>
      <?php } ?>
    </tr>
    <?php } ?>
    
    
    
    
  </table>
</div>

<div class="bottom">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center"></div>
</div>
<?php } ?>