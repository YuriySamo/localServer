<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="contact">
    <h2 style="display:none"><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content">
<div class="map-left">      <div class="contact-box"><b><?php echo $text_address; ?></b><br />
        <?php echo $address; ?></div>
      <div class="contact-box-2">
        <?php if ($telephone) { ?>
        <b><?php echo $text_telephone; ?></b><br />
        <?php echo $telephone; ?><br />
        <br />
        <?php } ?>
        <?php if ($fax) { ?>
        <b><?php echo $text_fax; ?></b><br />
        <?php echo $fax; ?>
        <?php } ?>
      </div></div>
               <div class="map-content">         
               <figure>
               <iframe width="385" height="243"  src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Brooklyn,+New+York,+NY,+United+States&amp;aq=0&amp;sll=37.0625,-95.677068&amp;sspn=61.282355,146.513672&amp;ie=UTF8&amp;hq=&amp;hnear=Brooklyn,+Kings,+New+York&amp;ll=40.649974,-73.950005&amp;spn=0.01628,0.025663&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
                  </figure></div>
    </div>
    </div>
    
    <div class="content contact-f"><h2><?php echo $text_contact; ?></h2>
<div class="padd-content">   <div class="extra-wrap"> <div class="contact-form-left"><b><?php echo $entry_name; ?></b><br />
    <input class="q2" type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?></div>
    <div class="contact-form-right"><b><?php echo $entry_email; ?></b><br />
    <input class="q2" type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
</div></div></div>
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b class="cap-p"><?php echo $entry_captcha; ?></b><br />
    <input type="text" class="capcha" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <div class="buttons">    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
      <div class="right"><a onclick="$('#contact').submit();" class="button"><span><?php echo $button_continue; ?></span></a></div>
    </div>
    </div>

  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>