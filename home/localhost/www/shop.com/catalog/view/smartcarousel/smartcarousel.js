$('document').ready(function(){
	setNextPrevControls();
	
	$('.sc-menu a').click(function(){
		var curCarouselId = '';
		$('.sc-menu a').removeClass('active');
		$(this).addClass('active');
		
		$('.sc_carousel').hide();
		if(this.id == 'sc-featured'){
			$('#featuredSlider').show();
			curCarouselId = 'carousel_featured';
		}else if(this.id == 'sc-mostnew'){
			$('#mostSlider').show();
			curCarouselId = 'carousel_mostnew';
		}
		else if(this.id == 'sc-lastview'){
			$('#lastviewSlider').show();
			curCarouselId = 'carousel_lastview';
		}
		else if(this.id == 'sc-wishlist'){
			$('#wishlistSlider').show();
			curCarouselId = 'carousel_wishlist';
		}
		
		$('#'+curCarouselId+' ul').jcarousel(carouselSetting);
		setNextPrevControls();
	});
});

function setNextPrevControls(){
	var nextObj = $('.sc-content .jcarousel-next');
	var prevObj = $('.sc-content .jcarousel-prev');
	var topPos = ( $('.sc-content').height() / 2 ) - ( nextObj.height() / 2 ) - 10;
	
	nextObj.css({'top':topPos});
	prevObj.css({'top':topPos});
}

function fixme(element, text, width)
{
   element.innerHTML = '<span id="fixme" style="white-space:nowrap;">' + text + '</span>';
   ts = document.getElementById('fixme');
   if(ts.offsetWidth > width)
   {
      var i = 1;
      ts.innerHTML = '';
      while(ts.offsetWidth < (width) && i < text.length)
      {
    	  ts.innerHTML = text.substr(0,i) + '...';
         i++; 
      } 

      returnText = ts.innerHTML; 
      element.innerHTML = '';
      return returnText;
   }
   
   return text;
}

$('document').ready(function(){
	if(document.getElementById('sc-mostnew'))
		$('#sc-mostnew').text(fixme(document.getElementById('sc-mostnew'), $('#sc-mostnew').text(), $('#sc-mostnew').width()-15));
	if(document.getElementById('sc-lastview'))
		$('#sc-lastview').text(fixme(document.getElementById('sc-lastview'), $('#sc-lastview').text(), $('#sc-lastview').width()-15));
	if(document.getElementById('sc-featured'))
		$('#sc-featured').text(fixme(document.getElementById('sc-featured'), $('#sc-featured').text(), $('#sc-featured').width()-15));
	if(document.getElementById('sc-wishlist'))
		$('#sc-wishlist').text(fixme(document.getElementById('sc-wishlist'), $('#sc-wishlist').text(), $('#sc-wishlist').width()-15));
});
