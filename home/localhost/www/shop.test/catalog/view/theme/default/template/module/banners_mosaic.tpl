<?php if ($blocks) { ?>

<style type="text/css">
	.banners_mosaic_box { position:relative; padding:10px; }
	.banners_mosaic_elem { position:relative; float:left; margin:10px; overflow:visible; }
	.banners_mosaic_elem img { display:none; border:0px; }
</style>

<div class="banners_mosaic_box">
	<?php $i = 0; ?>
	<?php foreach ($blocks as $block) { ?>
	<?php if (isset($block['image1']) || isset($block['image2'])) { ?>
	<div class="banners_mosaic_elem" id="hpe-<?php echo $i; ?>" style="width:<?php echo $block['width']; ?>px; height:<?php echo $block['height']; ?>px">
		<?php if (isset($block['image1'])) { ?>
			<span>
			<?php if ($block['url']) { ?>
			<a href="<?php echo $block['url']; ?>"<?php echo (preg_match('~^http.+~i', $block['url'])) ? ' target="_blank"' : ''; ?>>
			<?php } ?>
			<img src="<?php echo $block['image1']; ?>" alt="<?php echo $block['alt']; ?>" title="<?php echo $block['title']; ?>" />
			<?php if ($block['url']) { ?>
			</a>
			<?php }?>
			</span>
		<?php } ?>
		<?php if (isset($block['image2'])) { ?>
			<span>
			<?php if ($block['url']) { ?>
			<a href="<?php echo $block['url']; ?>"<?php echo (preg_match('~^http.+~i', $block['url'])) ? ' target="_blank"' : ''; ?>>
			<?php } ?>
			<img src="<?php echo $block['image2']; ?>" alt="<?php echo $block['alt']; ?>" title="<?php echo $block['title']; ?>" />
			<?php if ($block['url']) { ?>
			</a>
			<?php }?>
			</span>
		<?php } ?>
	</div>
	<?php if (isset($block['image1']) && isset($block['image2'])) { ?>
		<script type="text/javascript"><!--
			$('#hpe-<?php echo $i; ?>').cycle({ timeout: <?php echo $block['timeout']; ?> });
		//--></script>
	<?php } ?>
	<?php $i++; ?>
	<?php } /* IF end */?>
	<?php } /* FOREACH end */?>
	<div style="clear:both;"></div>
	
	<script type="text/javascript"><!--
		$(document).ready(function() {
			$('.banners_mosaic_elem img:first-child').css('display', 'block');
		});
	//--></script>
</div>

<?php } ?>