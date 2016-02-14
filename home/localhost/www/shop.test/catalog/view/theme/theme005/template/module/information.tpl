<div class="box inform-1">  <a href="http://www.facebook.com">Facebook</a>   
 <?php foreach ($informations as $information) { 
      $count +=1;?>
<a class="info-about<?php echo $count; ?>" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
</div>
