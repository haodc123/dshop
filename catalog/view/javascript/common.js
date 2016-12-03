$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#search input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
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
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
});

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 
function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
       
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
		
                    html = '';
                    html += ' <div id="cartview">';
                    html += '    <div id="cartview-content">';
                    html += '<ul class="items">';
                    for (i = 0; i < json['products'].length; i++) {
                        product = json['products'][i];
                        if (i === json['products'].length - 1) {
                            html += ' <li  style="background-color:#CCCCCC;" >';
                        } else {
                            html += ' <li>';
                        }

                        html += ' <a href="' + product['href'] + '"> <img alt="" src="' + product['thumb'] + '"></a>';
                        html += ' <div class="prod_details">';
                        html += ' <strong>' + product['name'] + ':' + product['mc'] + '</strong>';
                        html += '<dl>';
                        html += '  <dt>Color:</dt> <dd>' + product['color'] + '</dd>';
                        html += '  <dt>Size:</dt> <dd>' + product['size'] + '</dd>';
                        for (j = 0; j < product['option'].length; j++) {
                            option = product['option'][j];
                            html += '  <dt>' + option['name'] + '</dt> <dd>' + option['value'] + '</dd>';
                        }
                        html += '  <dt>Quantity:</dt> <dd>' + product['quantity'] + '</dd>';
                        html += '</dl>';
                        html += ' <div class="price">  ' + product['total'] + '</div>';
                        html += '</li>';
                    }
                    html += '</ul>';
                    html += '<div class="totals">';
                    html += '<dl>';
                    for (i = 0; i < json['totals'].length; i++) {
                        totals = json['totals'][i];
                        html += '<dt>' + totals['title'] + '</dt> <dd>' + totals['text'] + '</dd>';
                    }
                    html += '</dl>';
                    html += '</div>';
                    html += '</div>';
                    html += '<div class="action">';
                    html += '<a class="button checkout" href="' + json['checkout'] + '"><i class="fa fa-shopping-cart fa-lg"></i> Checkout</a>';
                    html += '</div>';
                    html += '</div>';
                    $('#cartview').remove();
                    $('#cart').after(html);
                    $('#cart-quantity').html(json['total_quantity']);
                    $('#cartview').css('visibility', 'visible');
                    $('#cartview').slideDown('slow', function() {
                        var self = this;
                        setTimeout(function() {
                            $(self).slideUp('slow', function() {
                                $('#cartview').css('visibility', '');
                                $('#cartview').css('display', '');
                            });
                        }, 2500);
                    });
                    //}
                }
            });
}
function addToWishList(product_id) {
     
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
       
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}