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
  <?php if (isset($error_message)) { ?>
	<div class="warning"><?php echo $error_message; ?></div>
  <?php } ?>
  <?php if (isset($success)) { ?>
	<div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
      <a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
      <a onclick="saveandclose();" class="button"><span><?php echo $button_savenclose; ?></span></a>
      <a href="<?php echo $cancel; ?>" class="button"><span><?php echo $button_cancel; ?></span></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      
      	<div id="tab-option" style="display: block;">
      	<h2><?php echo $title_settings; ?></h2>
      	<table class="form" id="module">
		  <tr>
			<td valign="top" align="right"><?php echo $entry_noofprod; ?></td>
		      <td>
		      	<select name="smartcarousel_setings[noofprod]">
		      	<?php for($i=1;$i<8;$i++){ ?>
		      	<option <?php echo (isset($scs['noofprod']) && $scs['noofprod']==$i ? 'selected="selected"' : ''); ?> value="<?php echo $i; ?>"><?php echo $i; ?></option>
		      	<?php } ?>
		      	</select>
			  </td>  
	      </tr>
	      <tr>
			<td valign="top" align="right"><?php echo $entry_scroll; ?></td>
		      <td>
		      	<select name="smartcarousel_setings[scroll]">
		      	<?php for($i=1;$i<8;$i++){ ?>
		      	<option <?php echo (isset($scs['scroll']) && $scs['scroll']==$i ? 'selected="selected"' : ''); ?> value="<?php echo $i; ?>"><?php echo $i; ?></option>
		      	<?php } ?>
		      	</select>
			  </td>  
	      </tr>
	      <tr>
			<td valign="top" align="right"><?php echo $entry_image; ?></td>
		      <td>
		      	<input placeholder="80" type="text" name="smartcarousel_setings[image_width]" value="<?php echo !empty($scs['image_width']) ? $scs['image_width'] : ''; ?>" size="3" />
              	<input placeholder="80" type="text" name="smartcarousel_setings[image_height]" value="<?php echo !empty($scs['image_height']) ? $scs['image_height'] : ''; ?>" size="3" />
			  </td>  
	      </tr>
	    </table>
      	</div>
      	
  		<div id="tab-option" style="display: block;">
      	<?php foreach($sliders as $tabName){ ?>	
	      	<h2><?php echo $sec_title[$tabName]; ?></h2>
	      	<table id="module" class="form">
		      	<tr>
			      	<td valign="top" align="right"><?php echo $entry_display_in_car; ?></td>
		      		<td>
			      		<input type="radio" <?php echo (empty($scs[$tabName]['display']) || $scs[$tabName]['display'] == 1 ? 'checked="checked"' : ''); ?>
			      		value="1" name="smartcarousel_setings[<?php echo $tabName; ?>][display]">
	                	<?php echo $text_yes; ?>
	                	<input type="radio" <?php echo (isset($scs[$tabName]['display']) && $scs[$tabName]['display'] == 0 ? 'checked="checked"' : ''); ?>
	                	value="0" name="smartcarousel_setings[<?php echo $tabName; ?>][display]">
	                	<?php echo $text_no; ?>
                	</td>
                	
                	<td valign="top" align="right"><span class="required">*</span> <?php echo $entry_tab_title; ?></td>
		      		<td><input type="text" value="<?php echo (!empty($scs[$tabName]['title']) ? $scs[$tabName]['title'] : ''); ?>"
		      		size="40" maxlength="40" value="Featured" name="smartcarousel_setings[<?php echo $tabName; ?>][title]"></td>
		      	</tr><tr>
		      		<td valign="top" align="right"><span class="required">*</span> <?php echo $entry_product_limit; ?></td>
		      		<td><input type="text" size="10" value="<?php echo (!empty($scs[$tabName]['limit']) ? $scs[$tabName]['limit'] : ''); ?>" name="smartcarousel_setings[<?php echo $tabName; ?>][limit]"></td>
		      		
		      		<td valign="top" align="right"><?php echo $entry_tab_position; ?></td>
		      		<td><input type="text" size="10" value="<?php echo (isset($scs[$tabName]['position']) ? $scs[$tabName]['position'] : ''); ?>" name="smartcarousel_setings[<?php echo $tabName; ?>][position]"></td>
		      	</tr>
		      	<?php if($tabName == 'lastview'){ ?>
		      	<tr class="hideBlock">
		      		<td style="border-bottom:none;padding-left:43px" colspan="4"><span class="help"><?php echo $lastview_inst; ?></span></td>
		      	</tr>
		      	<tr class="hideBlock">
			      	<td valign="top" align="right"><?php echo $entry_hide_on_product; ?></td>
		      		<td>
			      		<input type="radio" <?php echo (isset($scs[$tabName]['hide']) && $scs[$tabName]['hide'] == 1 ? 'checked="checked"' : ''); ?>
			      		value="1" name="smartcarousel_setings[<?php echo $tabName; ?>][hide]">
	                	<?php echo $text_yes; ?>
	                	<input type="radio" <?php echo (empty($scs[$tabName]['hide']) || $scs[$tabName]['hide'] == 0 ? 'checked="checked"' : ''); ?>
	                	value="0" name="smartcarousel_setings[<?php echo $tabName; ?>][hide]">
	                	<?php echo $text_no; ?>
                	</td>
                	<td></td><td></td>
		      	</tr>
		      	<?php } ?>
	      	</table>
	     <?php } ?>
	 	</div>
	      	
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
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="smartcarousel_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="smartcarousel_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php /*if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php }*/ ?>
                </select></td>
              <td class="left"><select name="smartcarousel_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="smartcarousel_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
      <input type="hidden" name="saveNclose" value="N" id="snc"/>  
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="smartcarousel_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="smartcarousel_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	//html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	//html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="smartcarousel_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="smartcarousel_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}

function saveandclose()
{
	$('#snc').val('Y');
	$('#form').submit();
}

function hideShowInst(){
	if($('input[name="smartcarousel_setings[lastview][display]"]:checked').val() == 1){
		$('.hideBlock').show();
		$('.hideBlock td').css('background-color', '#ffffcb');
	}
	else
		$('.hideBlock').hide();
}

$('input[name="smartcarousel_setings[lastview][display]"]').change(function(){
	hideShowInst();
});

hideShowInst();

--></script>  
<?php echo $footer; ?>