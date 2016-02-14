$(document).ready(function() {
/* Search */
$('.button-search').bind('click', function() {
url = 'index.php?route=product/search';
var filter_name = $('input[name=\'filter_name\']').attr('value')
if (filter_name) {
url += '&filter_name=' + encodeURIComponent(filter_name);
}
location = url;
});
$('#header input[name=\'filter_name\']').keydown(function(e) {
if (e.keyCode == 13) {
url = 'index.php?route=product/search';
var filter_name = $('input[name=\'filter_name\']').attr('value')
if (filter_name) {
url += '&filter_name=' + encodeURIComponent(filter_name);
}
location = url;
}
});
/* Ajax Cart */
$('#cart > .heading a').bind('click', function() {
$('#cart').addClass('active');
$.ajax({
url: 'index.php?route=checkout/cart/update',
dataType: 'json',
success: function(json) {
if (json['output']) {
//$('#cart .content').html(json['output']);
$('#cart .content, #module_cart .cart-module').html(json['output']);
}
}
});
$('#cart').bind('mouseleave', function() {
$(this).removeClass('active');
});
});
/* Mega Menu */
$('#menu ul > li > a + div').each(function(index, element) {
// IE6 & IE7 Fixes
if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
var category = $(element).find('a');
var columns = $(element).find('ul').length;
$(element).css('width', (columns * 143) + 'px');
$(element).find('ul').css('float', 'left');
}
var menu = $('#menu').offset();
var dropdown = $(this).parent().offset();
i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
if (i > 0) {
$(this).css('margin-left', '-' + (i + 5) + 'px');
}
});
// IE6 & IE7 Fixes
if ($.browser.msie) {
if ($.browser.version <= 6) {
$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
$('#column-right + #content').css('margin-right', '195px');
$('.box-category ul li a.active + ul').css('display', 'block');
}
if ($.browser.version <= 7) {
$('#menu > ul > li').bind('mouseover', function() {
$(this).addClass('active');
});
$('#menu > ul > li').bind('mouseout', function() {
$(this).removeClass('active');
});
}
}
});
$('.success span, .warning span, .attention span, .information span').live('click', function() {
$(this).parent().fadeOut('slow', function() {
$(this).remove();
});
});

function addToCart(product_id) {
$.ajax({
url: 'index.php?route=checkout/cart/update',
type: 'post',
data: 'product_id=' + product_id,
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, .information, .error').remove();
if (json['redirect']) {
location = json['redirect'];
}
if (json['error']) {
if (json['error']['warning']) {
$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<span class="close"><img src="catalog/view/theme/theme005/image/close.png" alt="" class="close" /></span></div>');
}
}
				if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"><img src="catalog/view/theme/theme005/image/close.png" alt="" class="close" /></span></div>');
				
				$('.success').fadeIn('slow');
$('#cart_total').html(json['total']);
$('#module_cart .cart-module').html(json['output']);
var image = $('#img_'+product_id).offset();
if (image) {
var cart = $('#module_cart').offset();
$('<img src="' + $('#img_'+product_id).attr('src') + '" id="temp" style="position: absolute; top: ' + image.top + 'px; left: ' + image.left + 'px;" />').appendTo('body');
params = {
top : cart.top + 'px',
left : cart.left + 'px',
opacity : 0.2,
width :$('#img_'+product_id).width(),
height : $('#img_'+product_id).height()
};
// uncomment line below if you also want to scroll up
//$('html, body').animate({ scrollTop: 0 }, 'slow');
$('#temp').animate(params,image.top-cart.top + 200 ,false, function () {
$('#temp').remove();
});
} else {
//alert("hi there");
}
}
}
});
}
function removeCart(key) {
$.ajax({
url: 'index.php?route=checkout/cart/update',
type: 'post',
data: 'remove=' + key,
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, .information').remove();
if (json['output']) {
$('#cart_total').html(json['total']);
//$('#cart .content').html(json['output']);
$('#cart .content, #module_cart .cart-module').html(json['output']);
}
}
});
}
function removeVoucher(key) {
$.ajax({
url: 'index.php?route=checkout/cart/update',
type: 'post',
data: 'voucher=' + key,
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, .information').remove();
if (json['output']) {
$('#cart_total').html(json['total']);
//$('#cart .content').html(json['output']);
$('#cart .content, #module_cart .cart-module').html(json['output']);
}
}
});
}
function addToWishList(product_id) {
$.ajax({
url: 'index.php?route=account/wishlist/update',
type: 'post',
data: 'product_id=' + product_id,
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, .information').remove();
		if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"><img src="catalog/view/theme/theme005/image/close.png" alt="" class="close" /></span></div>');
				
				$('.success').fadeIn('slow');
$('#wishlist_total').html(json['total']);
}
}
});
}
function addToCompare(product_id) {
$.ajax({
url: 'index.php?route=product/compare/update',
type: 'post',
data: 'product_id=' + product_id,
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, .information').remove();
		if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"><img src="catalog/view/theme/theme005/image/close.png" alt="" class="close" /></span></div>');
				
				$('.success').fadeIn('slow');
$('#compare_total').html(json['total']);
}
}
});
} 