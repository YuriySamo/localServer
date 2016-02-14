<div class="box cat-colum">
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['category_id'] == $category_id) { ?>
        <li class="active">
        <?php } else { ?>
        <li>
        <?php } ?>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?><span  class="act-cat"></span>
          <ul class="level-2-cat">
            <?php foreach ($category['children'] as $child) { ?>
            <?php if ($child['category_id'] == $child_id) { ?>
            <li class="active">
            <?php } else { ?>
            <li>
            <?php } ?>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
            <script type="text/javascript">
$(document).ready(function(){

   
   $(".act-cat").toggle( 
	        function() { 
	             $(this).next('.level-2-cat').slideToggle("slow"),{
                    duration: 'slow',
                    easing: 'easeOutBounce'
                };
	        }, 
	        function() { 
	             $(this).next('.level-2-cat').slideToggle("slow"),{
                    duration: 'slow',
                    easing: 'easeOutBounce'
                };
	        } 
	    );
   
});
</script>