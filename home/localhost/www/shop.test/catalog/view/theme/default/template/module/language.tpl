<?php if (count($languages) > 1) { ?>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div id="language" style="left: 285px;width: auto;border: 1px solid;">
			<img id="lang" src=""/>
				<select id="languages" name="languages" onChange="$('input[name=\'language_code\']').attr('value', $('#languages option:selected').val()).submit(); $(this).parent().parent().submit();" style="padding: 2px;
  border: none;background: none;">
			<?php foreach ($languages as $language) { ?>
            	<?php if ($language['code'] == $language_code) { ?>
                    	<option class="option" selected value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
            	<?php }else{  ?>
                    	<option class="option" value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
				<?php } ?>
            <?php } ?>
            </select>
            <input type="hidden" name="language_code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</div>
	</form>
<?php } ?>
<script>
(function($) {
// USAGE:
    $(function() {
        // on load:
			var lang=$('select[name="languages"]').val().toLowerCase();
			var src="image/flags/"+lang+".png";
			$('#lang').attr("src", src);
    });
})(jQuery);
</script>
