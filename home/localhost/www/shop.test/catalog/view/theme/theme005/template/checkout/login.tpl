<div class="left">
  <h2><?php echo $text_new_customer; ?></h2>
  <p><?php echo $text_checkout; ?></p>
<div class="extra-wrap">  <div class="p1"><label for="register">
    <?php if ($account == 'register') { ?>
    <input type="radio" name="account" value="register" id="register" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="account" value="register" id="register" />
    <?php } ?>
    <b><?php echo $text_register; ?></b></label></div></div>
<div class="extra-wrap">
  <?php if ($guest_checkout) { ?>
  <label for="guest">
    <?php if ($account == 'guest') { ?>
    <input type="radio" name="account" value="guest" id="guest" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="account" value="guest" id="guest" />
    <?php } ?>
    <b><?php echo $text_guest; ?></b></label></div>

  <?php } ?>
  <br />
  <p class="login-padd"><?php echo $text_register_account; ?></p>
  <a id="button-account" class="button"><span><?php echo $button_continue; ?></span></a><br />
  <br />
</div>
<div id="login" class="right">
  <h2><?php echo $text_returning_customer; ?></h2>
  <p><?php echo $text_i_am_returning_customer; ?></p>
  <b><?php echo $entry_email; ?></b><br />
  <input class="d1" type="text" name="email" value="" />
  <br />
  <br />
  <b><?php echo $entry_password; ?></b><br />
  <input class="d1" type="password" name="password" value="" />
  <br /><br />
  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
  <br />
  <a id="button-login" class="button"><span><?php echo $button_login; ?></span></a><br />
  <br />
</div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-login').click();
	}
});
//--></script>   