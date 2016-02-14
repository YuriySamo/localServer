<?php if (!$logged) { ?>
<a href="<?php echo str_replace('&', '&amp;', $login); ?>" style="background-image: url('catalog/view/theme/default2/image/login.png');" title="<?php echo $text_login; ?>"><?php echo $text_login; ?></a>
<?php } else { ?>
<a href="<?php echo str_replace('&', '&amp;', $logout); ?>" style="background-image: url('catalog/view/theme/default2/image/logout.png');" title="<?php echo $text_logout; ?>"><?php echo $text_logout; ?></a>
<?php } ?>

<a href="<?php echo str_replace('&', '&amp;', $special); ?>" style="background-image: url('catalog/view/theme/default2/image/dollar.png');" title="<?php echo $text_special; ?>"><?php echo $text_special; ?></a>

<a onclick="bookmark(document.location, '<?php echo addslashes($title); ?>');" style="background-image: url('catalog/view/theme/default2/image/special.png');"title="<?php echo $text_bookmark; ?>"><?php echo $text_bookmark; ?></a>

<a href="<?php echo str_replace('&', '&amp;', $sitemap); ?>" style="background-image: url('catalog/view/theme/default2/image/sitemap.png');" title="<?php echo $text_sitemap; ?>"><?php echo $text_sitemap; ?></a>