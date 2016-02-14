<div class="box">
  <div class="top"><img src="catalog/view/theme/default2/image/latest.png" alt="" /><?php echo $heading_title; ?></div>
  <div class="middle">
    <?php if ($products) { ?>
    <table cellpadding="2" cellspacing="0" style="width: 100%;">
      <?php foreach ($products as $product) { ?>
      <tr>
        <td valign="top" align="center" width="50px"><a href="<?php echo str_replace('&', '&amp;', $product['href']); ?>"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" /></a></td>
        <td valign="top"><a href="<?php echo str_replace('&', '&amp;', $product['href']); ?>"><?php echo $product['name']; ?></a>
          <?php if ($display_price) { ?>
          <br />
          <?php if (!$product['special']) { ?>
          <span style="font-size: 11px; color: #494949;"><?php echo $product['price']; ?></span>
          
          
          <?php } else { ?>
          <span style="font-size: 11px; color: #900; text-decoration: line-through;"><?php echo $product['price']; ?></span> <span style="font-size: 11px; color: #494949;"><?php echo $product['special']; ?></span>
          <?php } ?>
          
          <?php } ?>
          
          
         
      </tr>
      <?php } ?>
    
    
    
    
    
    
    </table>
    
    <?php } ?>
  </div>
  <div class="bottom">&nbsp;</div>
</div>
