
<a href="<?php echo str_replace('&', '&amp;', $home); ?>" ><?php echo $text_home; ?></a>

<!-- you can add static menu just like bellow -->
<?php if (!$logged) { ?>
<a href="<?php echo str_replace('&', '&amp;', $login); ?>" title="<?php echo $text_login; ?>"><?php echo $text_login; ?></a>
<?php } else { ?>
<a href="<?php echo str_replace('&', '&amp;', $logout); ?>" title="<?php echo $text_logout; ?>"><?php echo $text_logout; ?></a>
<?php } ?>

<a href="<?php echo str_replace('&', '&amp;', $account); ?>"><?php echo $text_account; ?></a>
<a href="<?php echo str_replace('&', '&amp;', $special); ?>"><?php echo $text_special; ?></a>
<a href="<?php echo str_replace('&', '&amp;', $cart); ?>"><?php echo $text_cart; ?></a>

<a href="<?php echo str_replace('&', '&amp;', $checkout); ?>"><?php echo $text_checkout; ?></a>
<a href="<?php echo str_replace('&', '&amp;', $contact); ?>"><?php echo $text_contact; ?></a>








 



