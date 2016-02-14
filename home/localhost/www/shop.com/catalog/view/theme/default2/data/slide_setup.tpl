<script type="text/javascript">
$(window).load(function() {
	$('#slider').nivoSlider({
		effect:'random', 							//Specify sets like: 'sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft, fold, fade' for all effect or just keep it random
		slices:15,
		animSpeed:500,
		pauseTime:8000,
		startSlide:0, 								//Set starting Slide (0 index)
		directionNav:true,							//Next & Prev
		directionNavHide:true, 						//Only show on hover
		controlNav:false, 							//1,2,3...
		controlNavThumbs:false, 					//Use thumbnails for Control Nav
		controlNavThumbsFromRel:false, 				//Use image rel for thumbs
		controlNavThumbsSearch: '.jpg', 			//Replace this with...
		controlNavThumbsReplace: '_thumb.jpg', 		//...this in thumb Image src
		keyboardNav:true, 							//Use left & right arrows
		pauseOnHover:true, 							//Stop animation while hovering
		manualAdvance:false, 						//Force manual transitions
		captionOpacity:0.8, 						//Universal caption opacity
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){} 					//Triggers after all slides have been shown
	});
});
</script>
