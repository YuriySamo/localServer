<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <table id="module" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tr id="module-row<?php echo $module_row; ?>">
            <td class="left">
            	<select name="banners_mosaic_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </td>
            <td class="left">
            	<select name="banners_mosaic_module[<?php echo $module_row; ?>][position]">
                	<option value="content_top"<?php echo ($module['position'] == 'content_top') ? ' selected="selected"' : ''; ?>><?php echo $text_content_top; ?></option>
                	<option value="content_bottom"<?php echo ($module['position'] == 'content_bottom') ? ' selected="selected"' : ''; ?>><?php echo $text_content_bottom; ?></option>
	                <option value="column_left"<?php echo ($module['position'] == 'column_left') ? ' selected="selected"' : ''; ?>><?php echo $text_column_left; ?></option>
                	<option value="column_right"<?php echo ($module['position'] == 'column_right') ? ' selected="selected"' : ''; ?>><?php echo $text_column_right; ?></option>
              	</select>
            </td>
            <td class="left">
            	<select name="banners_mosaic_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </td>
            <td class="right"><input type="text" name="banners_mosaic_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
          <?php $module_row++; ?>
          <?php } ?>
        </tbody>
        <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
      </table>
    <table id="blocks" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_url; ?></td>
            <td class="left" style="width:150px;"><?php echo $entry_size; ?></td>
            <td class="left" style="width:100px;"><?php echo $entry_sort_order; ?></td>
            <td class="left" style="width:80px;"><?php echo $entry_timeout; ?></td>
            <td class="right" style="width:300px;"><?php echo $entry_image; ?></td>
            <td style="width:150px"></td>
          </tr>
        </thead>
        <?php $block_row = 0; ?>
        <?php foreach ($blocks as $block) { ?>
        <tbody id="block-row<?php echo $block_row; ?>">
          <tr>
            <td class="left">
            	<input type="text" value="<?php echo $block['url']; ?>" name="banners_mosaic_block[<?php echo $block_row; ?>][url]" maxlength="255" style="width:90%"/>
            </td>
            <td class="left">
            	<input type="text" value="<?php echo $block['width']; ?>" name="banners_mosaic_block[<?php echo $block_row; ?>][width]" maxlength="4" size="4"/> 
            	x 
            	<input type="text" value="<?php echo $block['height']; ?>" name="banners_mosaic_block[<?php echo $block_row; ?>][height]" maxlength="4" size="4"/>
            </td>
            <td class="left">
            	<input type="text" value="<?php echo $block['sort']; ?>" name="banners_mosaic_block[<?php echo $block_row; ?>][sort]" maxlength="4" size="4"/> 
            </td>
            <td class="left">
            	<input type="text" value="<?php echo $block['timeout']; ?>" name="banners_mosaic_block[<?php echo $block_row; ?>][timeout]" maxlength="5" size="4"/> 
            </td>
            <td class="right">
            	<div class="image" style="float:left;">
            		<img src="<?php echo $block['thumb1']; ?>" id="thumb1-<?php echo $block_row; ?>" /><br />
                  	<input type="hidden" name="banners_mosaic_block[<?php echo $block_row; ?>][image1]" value="<?php echo $block['image1']; ?>" id="image1-<?php echo $block_row; ?>" />
                  	<a onclick="image_upload('image1-<?php echo $block_row; ?>', 'thumb1-<?php echo $block_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb1-<?php echo $block_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image1-<?php echo $block_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                </div>
                <div class="image" style="float:left;">
            		<img src="<?php echo $block['thumb2']; ?>" id="thumb2-<?php echo $block_row; ?>" /><br />
                  	<input type="hidden" name="banners_mosaic_block[<?php echo $block_row; ?>][image2]" value="<?php echo $block['image2']; ?>" id="image2-<?php echo $block_row; ?>" />
                  	<a onclick="image_upload('image2-<?php echo $block_row; ?>', 'thumb2-<?php echo $block_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb2-<?php echo $block_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image2-<?php echo $block_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                </div>
                <div style="clear:both"></div>
            </td>
            <td class="right"><a onclick="$('#block-row<?php echo $block_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
		   </tr>
        </tbody>
        <?php $block_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="5"></td>
            <td class="right"><a onclick="addBlock();" class="button"><span><?php echo $button_add_block; ?></span></a></td>
          </tr>
        </tfoot>
      </table>
	</form>
  </div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	var html = '<tr id="module-row' + module_row + '">';
	html += '    <td class="left"><select name="banners_mosaic_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="banners_mosaic_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="banners_mosaic_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="banners_mosaic_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	
	$('#module tbody').append(html);
	
	module_row++;
}
//--></script> 

<script type="text/javascript"><!--
var block_row = <?php echo $block_row; ?>;

function addBlock() {	
	html  = '<tbody id="block-row' + block_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" value="" name="banners_mosaic_block['+block_row+'][url]" maxlength="255" style="width:90%"/></td>';
	html += '    <td class="left"><input type="text" value="" name="banners_mosaic_block['+block_row+'][width]" maxlength="4" size="4" /> x <input type="text" value="" name="banners_mosaic_block['+block_row+'][height]" maxlength="4" size="4"/></td>';
	html += '    <td class="left"><input type="text" value="0" name="banners_mosaic_block['+block_row+'][sort]" maxlength="4" size="4" /></td>';
	html += '    <td class="left"><input type="text" value="2000" name="banners_mosaic_block['+block_row+'][timeout]" maxlength="5" size="4" /></td>';
	html += '    <td class="center">' + getImageBlock(1) + getImageBlock(2) + '<div style="clear:both;"></div></td>';
	html += '    <td class="right"><a onclick="$(\'#block-row' + block_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#blocks tfoot').before(html);
	
	block_row++;
}

function getImageBlock(i) {
	return '<div class="image" style="float:left;">'
		+  '  <img src="<?php echo $no_image; ?>" alt="" id="thumb'+i+'-' + block_row + '" />'
		+  '  <input type="hidden" name="banners_mosaic_block[' + block_row + '][image'+i+']" value="" id="image'+i+'-' + block_row + '" /><br />'
		+  '  <a onclick="image_upload(\'image'+i+'-' + block_row + '\', \'thumb'+i+'-' + block_row + '\');"><?php echo $text_browse; ?></a>'
		+  '  &nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb'+i+'-' + block_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image'+i+'-' + block_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>'
		+  '</div>';
}
//--></script>

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
</div>

<?php echo $footer; ?>