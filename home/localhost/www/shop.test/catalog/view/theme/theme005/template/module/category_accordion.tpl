
<script>
$(function(){
$('.box-category > ul > li').last().addClass('last');
});
</script>
<div class="box cat-colum">
  <div class="box-content">
    <div id="multi_display"  class="box-category">
    	<?php echo $categories; ?>
  	</div>
  </div>
</div>
<script type="text/javascript"><?php echo $scripts; ?></script>







