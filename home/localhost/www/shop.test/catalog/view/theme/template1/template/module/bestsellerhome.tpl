<script type="text/javascript">

$(document).ready(function(){


//Gallery - On Hover Event 

	$('.simple_image').mouseenter(function(e) {

            $(this).children('img').animate(300);

            $(this).children('.zoom').fadeIn(600);

        }).mouseleave(function(e) {

            $(this).children('img').animate(300);

            $(this).children('.zoom').fadeOut(600);

});















});



</script>



<div class="central_products">

 


  <div class="products">

    <?php $prod_cont = 0;

    $prod_cont_fourth = 1;



      foreach ($products as $product) { ?>

    <div>

    <?php $prod_cont = $prod_cont+1; ?>

    <?php if ($prod_cont_fourth==1) { ?>

   <div class="item" style="margin:0";>

   <?php $prod_cont_fourth = 0; ?>

    <?php } else { ?>

     <div class="item">

    <?php } ?>

      

        <?php
        
        $strleng = (strlen($product['name']));
       	if($strleng > 24) {
         
         
     if ($languagesupport == 2) {
         
         
         $product['name'] =   iconv("UTF-8", "KOI8-R", $product['name']);
      $product['name']= mb_substr ($product['name'], 0 , 20)."...";
           $product['name'] =   iconv("KOI8-R", "UTF-8", $product['name']);
           
           
         }   else {
         
         $product['name']= substr ($product['name'], 0 , 24)."...";
         
         }
           
           
           
        }
       
       ?>

        <div class="item_up"><a href="<?php echo $product['href']; ?>" class="ptitle2 product_title1"><?php echo $product['name']; ?></a>


          <?php if ($product['thumb']) { ?>

         <div class="image"><a href="<?php echo $product['href']; ?>" class="simple_image" title=""> <span style="display: none;" class="zoom"><img src="catalog/view/theme/Basico/image/ico-zoom.png" alt="Zoom Picture" /></span> <img class="pimg" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
          <?php } ?>

          <?php $text =  strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8'));?>
          
          
<?php  
     $strleng = (strlen($text));
    	if($strleng > 60) {
        
    if ($languagesupport == 2) {
         
         
         $text =   iconv("UTF-8", "KOI8-R", $text);
      $text= mb_substr ($text, 0 , 60)."...";
           $text =   iconv("KOI8-R", "UTF-8", $text);
           
           
         }   else {
         
         $text = substr ($text, 0 , 60)."...";
         
         }
           
            }
           
          ?>
          

          <div class="product_text"><?php echo $text; ?></div>

          <?php if (!$product['special']) { ?>

          <div class="price"><?php echo $product['price']; ?></div>

          <?php } ?>

          <?php if ($product['special']) { ?>

          <div class="saleblock"> <span class="price_sale"><?php echo $product['price']; ?></span><span class="price_onsale"><?php echo $product['special']; ?></span> </div>

          <?php } ?>

        </div>

        <div class="add"><a onclick="addToCart('<?php echo $product['product_id']; ?>');"><img src="catalog/view/theme/Basico/image/add_icon.png" alt="add icon"/><?php echo $button_cart; ?></a></div>

        <div class="details"><a href="<?php echo $product['href']; ?>"><?php echo $button_details; ?></a></div>

      </div>

    </div>

    <?php if ($prod_cont%3==0) { ?>

    <div style="clear:both;"></div>

    <?php $prod_cont_fourth = 1; ?>

    <?php } ?>

    <?php } ?>

  </div>

</div>

<div style="clear:both; padding:12px 0 0 0;"></div>

