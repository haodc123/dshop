<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <div id="content"><?php echo $content_top; ?>
                <div class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <div class="checkout">
                    <div id="payment-address">
                        <div class="checkout-heading"><span class="line"><?php echo $text_checkout_payment_address; ?></span></div>
                        <div class="checkout-content">
                            <div id="payment-existing">
                                <div>
                                    <p><?php echo $text_payment_note;?></p><br/>
                                    <select style="display: none;" name="payment_address_id" class="large-field-address" >
                                        <option value="<?php echo $payment_address_id; ?>" selected="selected"><?php echo $payment_firstname; ?> <?php echo $payment_lastname;?>, <?php echo $payment_address_1; ?>, <?php echo $payment_city; ?>, <?php echo $payment_zone; ?>, <?php echo $payment_country; ?></option>
                                    </select>
                                </div>
                                <div class="payment-content">
                                    <table class="form">
                                        <tr>
                                            <td><label><?php echo $entry_firstname; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_firstname; ?></span></td>
                                        </tr>
                                        <tr>
                                            <td> <label><?php echo $entry_lastname; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_lastname; ?></span></td>
                                        </tr>
                                        <tr>
                                            <td><label><?php echo $entry_address_1; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_address_1; ?></span></td>
                                        </tr>
                                        <tr>
                                            <td><label><?php echo $entry_address_2; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_address_2; ?></span></td>
                                        </tr>
                                        <tr>
                                            <td><label><?php echo $entry_country; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_country;?></span>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label><?php echo $entry_postcode; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_postcode; ?></span></td>
                                        </tr>
                                        <tr>
                                            <td><label><?php echo $entry_city; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_city; ?></span></td>
                                        </tr>

                                        <tr>
                                            <td><label><?php echo $entry_zone; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_zone; ?></span>

                                        </tr>
                                        <tr>
                                            <td><label><?php echo $entry_phone; ?></label></td>
                                            <td><span class="large-field"><?php echo $payment_telephone; ?></span></td>
                                        </tr>


                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                    <?php if ($shipping_required) { ?>
                    <div id="shipping-address">
                        <div class="checkout-heading"><span class="line"><?php echo $text_checkout_shipping_address; ?></span></div>
                        <div class="checkout-content">
                            <div class="col">
                                <input type="checkbox" name="shipping_address" value="existing" id="shipping-address-existing" checked="checked" />
                                <label for="shipping-address-existing"><?php echo $text_existing;?></label>
                            </div>
                            <div id="shipping-existing" style="display: none;">
                                <?php if ($shipping_addresses) { ?>
                                <div>
                                    <select name="shipping_address_id" class="large-field-address">
                                        <?php foreach ($shipping_addresses as $address) { ?>
                                        <?php if ($address['address_id']==$shipping_address_id|| !$shipping_address_id) { ?>
                                        <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div id="shipping-content">
                                    <!--content-->
                                </div>
                                <div class="buttons">
                                    <input value="<?php echo $text_address_edit;?>" class="button" id="shipping-address-edit"/>
                                    <input value="<?php echo $text_address_new; ?>" class="button" id="shipping-address-new"/>
                                </div>
                                <?php } else { ?>
                                <div class="buttons">
                                    <input value="<?php echo $text_address_new; ?>" class="button" id="shipping-address-new"/>
                                </div>
                                <?php } ?>

                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <div id="checkout-cart">
                        <div class="checkout-heading"><span><?php echo $text_checkout_your_cart; ?></span></div>
                        <div class="checkout-content">
                            <table  class="cart-table">
                                <thead class="visuallyhidden">
                                    <tr>
                                        <th scope="col"><?php echo $text_product; ?></th>
                                        <th scope="col" id="item-col"><?php echo $text_item; ?></th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach($products as $product ) { ?>
                                    <tr>
                                        <td class="prod_details" id="product-col"><a href="<?php echo $product['href'];?>"> 
                                            <img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?> :: <?php echo $product['model'];?>"/> </a>
                                            <strong><a href="<?php echo $product['href'];?>"><?php echo $product['name'];?></a></strong>
                                            <dl>
                                                
                                                <dt><?php echo $text_product_code; ?></dt>
                                                <dd><?php echo $product['mc'];?></dd>
                                                <dt><?php echo $text_color; ?></dt>
                                                <dd><?php echo $product['color'];?></dd>
                                                <dt><?php echo $text_size; ?></dt>
                                                <dd><?php echo $product['size'];?></dd>
                                                <?php foreach($product['option'] as $option ) { ?>
                                                <dt><?php echo $option['name'];?></dt>
                                                <dd><?php echo $option['value'];?></dd>
                                                <?php } ?>
                                                <dt><?php echo $text_quantity; ?></dt>
                                                <dd><div class="qtyfield"><?php echo $product['quantity'];?></div></dd>
                                            </dl>
                                        </td>
                                        <td class="item-total"><?php echo $product['total'];?></td>
                                    </tr>
                                    <?php } ?>
                                    <tr class="total side-totals">
                                        <td colspan="2">
                                            <a id="edit-cart" href="<?php echo $button_edit_cart;?>"><?php echo $text_edit_cart;?></a>
                                            <dl>
                                                <dd>
                                                    <div class="order-totals">
                                                        <?php foreach($totals as $total ){ ?>
                                                        <div><label><?php echo $total['title'];?></label><?php echo $total['text'];?></div>
                                                        <?php } ?>
                                                    </div>
                                                </dd>
                                            </dl>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="shipping-method">
                        <div class="checkout-heading"><span class="line"><?php echo $text_checkout_shipping_method; ?></span></div>
                        <div class="checkout-content">
                            <?php if ($shipping_methods) { ?>
                            <p><?php echo $text_shipping_method; ?></p>
                            <table class="radio">
                                <?php foreach ($shipping_methods as $shipping_method) { ?>
                                <tr>
                                    <td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
                                </tr>
                                <?php if (!$shipping_method['error']) { ?>
                                <?php foreach ($shipping_method['quote'] as $quote) { ?>
                                <tr class="highlight">
                                    <td><?php if ($quote['code'] == $shipping_code || !$shipping_code) { ?>
                                        <?php $shipping_code = $quote['code']; ?>
                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
                                        <?php } else { ?>
                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
                                        <?php } ?></td>
                                    <td>
                                        <label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label>
                                    </td>
                                    <td style="text-align: right;">
                                        <label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label>
                                    </td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
                                </tr>
                                <?php } ?>
                                <?php } ?>
                            </table>

                            <?php } ?>
                        </div>
                    </div>
                    <?php if ($text_agree) { ?>
                    <div class="buttons">
                        <div class="right">
                            <label for="agree"><?php echo $text_agree; ?> <a onClick="return window.open('<?php echo $href; ?>', '<?php echo $title; ?>', 'width=800, height=400, scrollbars=yes');"><?php echo $title; ?></a></label>
                            <?php if ($agree) { ?>
                            <input type="checkbox" name="agree" value="1" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="agree" value="1" />
                            <?php } ?>
                            <input class="button_medium" type="button" id="button-order" value="Continue"/>
                        </div>
                    </div>
                    <?php } else { ?>
                    <div class="buttons">
                        <div class="right">
                            <input class="button_medium" type="button" id="button-order" value="Continue"/>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    <?php if($shipping_addresses) { ?>
    $(document).ready(function() {
        $.ajax({
		url: 'index.php?route=checkout/shipping_address_select/validate',
		type: 'post',
		data: $('#shipping-address select[name=shipping_address_id]'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(json) {
		//	$('.warning, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
				}
				
			} else {
                                    $.ajax({
					url: 'index.php?route=checkout/shipping_address_select&shipping_address_id='+ $('#shipping-address select[name=shipping_address_id]').val(),
					dataType: 'html',
					success: function(html) {
                                            
						$('#shipping-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}},	
                        error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
           // show shipping 
                $.ajax({
		url: 'index.php?route=checkout/shipping_method&shipping_address='+ $('#shipping-address input[name=\'shipping_address\']:checked').val(),
		type: 'post',
		//data: $('#shipping-address select[name=shipping_address_id], #payment-address select[name=payment_address_id]'),
		dataType: 'html',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(html) {
                  
                         $('#shipping-method').html(html);
                         
                }
                });
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
    $('#shipping-address input[name=\'shipping_address\']').live('change', function() {
        if (this.checked) {
            $('#shipping-existing').hide();
        }else {
            $('#shipping-existing').show();
        }
       $.ajax({
		url: 'index.php?route=checkout/shipping_method&shipping_address='+ $('#shipping-address input[name=\'shipping_address\']:checked').val(),
		type: 'post',
		//data: $('#shipping-address select[name=shipping_address_id], #payment-address select[name=payment_address_id]'),
		dataType: 'html',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(html) {
                  
                         $('#shipping-method').html(html);
                        
                        
                }
                });
               
                
});

//--></script>
<script type="text/javascript">
    // Payment Address	
$('#shipping-address select[name=shipping_address_id]').live('change', function() {
    $.ajax({
		url: 'index.php?route=checkout/shipping_address_select/validate',
		type: 'post',
		data: $('#shipping-address select[name=shipping_address_id]'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(json) {
		//	$('.warning, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					$('.warning').fadeIn('slow');
				}
				
			} else {
                                    $.ajax({
					url: 'index.php?route=checkout/shipping_address_select',
					dataType: 'html',
					success: function(html) {
                                            
						$('#shipping-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
                                $.ajax({
		url: 'index.php?route=checkout/shipping_method&shipping_address='+ $('#shipping-address input[name=\'shipping_address\']:checked').val(),
		type: 'post',
		//data: $('#shipping-address select[name=shipping_address_id], #payment-address select[name=payment_address_id]'),
		dataType: 'html',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(html) {
                  
                         $('#shipping-method').html(html);
                         
                }
                });
                                
			}},	
                        error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

</script>
<script type="text/javascript">
    // Payment Address	
$('#payment-address select[name=payment_address_id]').live('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_address/validate',
		type: 'post',
		data: $('#payment-address select[name=payment_address_id]'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(json) {
		//	$('.warning, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
				}
				
			} else {
                                    $.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-existing').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}},	
                        error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

</script>

<script type="text/javascript">
    $('#payment-address-edit').bind('click', function(){
    $.ajax({
                
                url: 'index.php?route=checkout/payment_address_edit/validate',
		dataType: 'json',
		success: function(json) {
                if(json['error']){
                              $('#dialog').remove();
                             $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/filelogin" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                             $('#dialog').dialog({
                                     title: null,
                                     close: function () {
                                        $.ajax({
                                            url: 'index.php?route=checkout/filelogin/validate',
                                            dataType: 'json',
                                            success: function(json) {
                                            if (json['redirect']) {
                                            window.location = json['redirect'];
                                            } else if (json['error']) {
                                            $('#checkout .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
                                            }
                                            }
                                            });
                                            
                                        },
                                        create: function(event, ui) {
                                        $(event.target).parent().css('position', 'fixed');
                                        },
                                        resizeStop: function(event, ui) {
                                        var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                                        (Math.floor(ui.position.top) - $(window).scrollTop())];
                                        $(event.target).parent().css('position', 'fixed');
                                        $('#dialog').dialog('option','position',position);
                                        },
                                         autoOpen:true,
                                            bgiframe: false,
                                            minHeight: 200,
                                            width: 800,
                                            height: 350,
                                            resizable: false,
                                            modal: true,
                                            closeOnEscape: true,
                                            draggable: false,
                                            position: ['top',50,'center'],
                                             show: {effect: 'fade', duration: 250},
                                            hide: {effect: 'fade', duration: 250}
                });
                }else{
                        $('#dialog').remove();
                        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/payment_address_edit&payment_address_id='+ $('#payment-address select[name=payment_address_id]').val()+'" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                        $('#dialog').dialog({
                        title: null,
                         
                        close: function () {
                            $.ajax({
                                url: 'index.php?route=checkout/payment_address',
                                dataType: 'html',
                                success: function(html) {
                                $('#payment-existing').html(html);
                              }
                              });   
                             // show shipping 
                              $.ajax({
		url: 'index.php?route=checkout/shipping_method&shipping_address='+ $('#shipping-address input[name=\'shipping_address\']:checked').val(),
		type: 'post',
		//data: $('#shipping-address select[name=shipping_address_id], #payment-address select[name=payment_address_id]'),
		dataType: 'html',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(html) {
                  
                         $('#shipping-method').html(html);
                         
                }
                });
		
                },
                
                create: function(event, ui) {
                $(event.target).parent().css('position', 'fixed');
            },
                    resizeStop: function(event, ui) {
                    var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                         (Math.floor(ui.position.top) - $(window).scrollTop())];
                    $(event.target).parent().css('position', 'fixed');
                    $('#dialog').dialog('option','position',position);
            },
                autoOpen:true,
		bgiframe: false,
                minHeight: 200,
		width: 800,
		height: 500,
		resizable: false,
		modal: true,
                closeOnEscape: true,
                draggable: false,
                position: ['top',50,'center'],
                 show: {effect: 'fade', duration: 250},
                 hide: {effect: 'fade', duration: 250}
	});
                    
                    }
                //----------
		}});
              
 });
</script>

<script type="text/javascript">
    $('#shipping-address-edit').bind('click', function(){
    $.ajax({
                
                url: 'index.php?route=checkout/shipping_address_edit/validate',
		dataType: 'json',
		success: function(json) {
                if(json['error']){
                              $('#dialog').remove();
                             $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/filelogin" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                             $('#dialog').dialog({
                                     title: null,
                                             
                                     close: function () {
                                        $.ajax({
                                            url: 'index.php?route=checkout/shipping_address_edit/validate',
                                            dataType: 'json',
                                            success: function(json) {
                                            if (json['redirect']) {
                                            window.location = json['redirect'];
                                            } else if (json['error']) {
                                            $('#checkout .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
                                            }
                                            }
                                            });
                                        },
                                        create: function(event, ui) {
                                        $(event.target).parent().css('position', 'fixed');
                                        },
                                        resizeStop: function(event, ui) {
                                        var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                                        (Math.floor(ui.position.top) - $(window).scrollTop())];
                                        $(event.target).parent().css('position', 'fixed');
                                        $('#dialog').dialog('option','position',position);
                                        },
                                         autoOpen:true,
                                            bgiframe: false,
                                            minHeight: 200,
                                            width: 800,
                                            height: 350,
                                            resizable: false,
                                            modal: true,
                                            closeOnEscape: true,
                                            draggable: false,
                                            position: ['top',50,'center'],
                                            show: {effect: 'fade', duration: 250},
                                            hide: {effect: 'fade', duration: 250}
                });
                }else{
                        $('#dialog').remove();
                        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/shipping_address_edit&shipping_address_id='+ $('#shipping-address select[name=shipping_address_id]').val()+'" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                        $('#dialog').dialog({
                        title: null,
                        close: function () {
                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                $('#shipping-existing').html(html);
                              }
                             });   
                             // show shipping 
                             $.ajax({
		url: 'index.php?route=checkout/shipping_method&shipping_address='+ $('#shipping-address input[name=\'shipping_address\']:checked').val(),
		type: 'post',
		//data: $('#shipping-address select[name=shipping_address_id], #payment-address select[name=payment_address_id]'),
		dataType: 'html',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(html) {
                  
                         $('#shipping-method').html(html);
                        
                }
                });
                        },
                
               
                create: function(event, ui) {
                $(event.target).parent().css('position', 'fixed');
            },
                    resizeStop: function(event, ui) {
                    var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                         (Math.floor(ui.position.top) - $(window).scrollTop())];
                    $(event.target).parent().css('position', 'fixed');
                    $('#dialog').dialog('option','position',position);
            },
                autoOpen:true,
		bgiframe: false,
                minHeight: 200,
		width: 800,
		height: 500,
		resizable: false,
		modal: true,
                closeOnEscape: true,
                draggable: false,
                position: ['top',50,'center'],
                show: {effect: 'fade', duration: 250},
                  hide: {effect: 'fade', duration: 250}
	});
                    
                    }
                //----------
		}});
              
 });
</script>

<script type="text/javascript">
    $('#shipping-address-new').bind('click', function(){
       
                        $('#dialog').remove();
                        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/shipping_address_new" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                        $('#dialog').dialog({
                        title: null,
                        close: function () {
                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                $('#shipping-existing').html(html);
                              }
                              }); 
                                // show shipping 
                             $.ajax({
		url: 'index.php?route=checkout/shipping_method&shipping_address='+ $('#shipping-address input[name=\'shipping_address\']:checked').val(),
		type: 'post',
		//data: $('#shipping-address select[name=shipping_address_id], #payment-address select[name=payment_address_id]'),
		dataType: 'html',
		beforeSend: function() {
			//$('#button-payment-address').attr('disabled', true);
			//$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-address').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(html) {
                  
                         $('#shipping-method').html(html);
                        
                }
                });
                              
                        },
                
               
                create: function(event, ui) {
                $(event.target).parent().css('position', 'fixed');
            },
                    resizeStop: function(event, ui) {
                    var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                         (Math.floor(ui.position.top) - $(window).scrollTop())];
                    $(event.target).parent().css('position', 'fixed');
                    $('#dialog').dialog('option','position',position);
            },
                autoOpen:true,
		bgiframe: false,
                minHeight: 200,
		width: 800,
		height: 500,
		resizable: false,
		modal: true,
                closeOnEscape: true,
                draggable: false,
                position: ['top',50,'center'],
                show: {effect: 'fade', duration: 250},
                hide: {effect: 'fade', duration: 250}
              
	});
                    
              });
</script>

<script type="text/javascript">
    $('#button-order').bind('click', function(){
   
            $.ajax({
                url: 'index.php?route=checkout/checkout/validate',
                type: 'post',
                data: $('#content input[type=\'text\'], #content input[type=\'password\'], #content input[type=\'checkbox\']:checked, #content input[type=\'radio\']:checked, #content input[type=\'hidden\'], #content select'),
		dataType: 'json',
                beforeSend: function() {
                        //$('#button-payment-address').attr('disabled', true);
                        //$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                },	
                complete: function() {
                        //$('#button-payment-address').attr('disabled', false);
                        //$('.wait').remove();
                },			
                success: function(json) {
                //	$('.warning, .error').remove();
			
			if(json['error']){
                                
                                $('#dialog').remove();
                                html='';
                                html+='<div style="display:none;" id="dialog">';
                                html+='<link rel="stylesheet" href="catalog/view/theme/default/App_Themes/Deal14/dialog.css">';
                              
                                html+='<h2>Notice</h2>';
                                html+='<i class="fa fa-exclamation-triangle fa-2x"></i>';
                                html+='  <div class="content_dialog">';
                                html+= json['error']['warning'];
                                html+=' </div>';
                                html+='</div>';
                                $('body').after(html);
                                $('#dialog').css('display',true);
                               $('#dialog').dialog({
                                    title: 'Detalhes do produto',
                                    modal: true,
                                    resizable: false,
                                    width: 400,
                                    height: 200,
                                    closeText: 'fechar',
                                    draggable: true,
                                    show: 'fade',
                                    hide: 'fade',
                                    dialogClass: 'main-dialog-class',
                                    show: {effect: 'fade', duration: 250},
                                    hide: {effect: 'fade', duration: 250},
                                   close: function () {
                                   $('#dialog').remove();
                                 },
                                   buttons: {
                                        "Ok": function(){ 
                                        $(this).dialog("close");
                                        
                                    }
                                    },
                                        create: function(event, ui) {
                                        $(event.target).parent().css('position', 'fixed');
                                },
                                        resizeStop: function(event, ui) {
                                            var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),(Math.floor(ui.position.top) - $(window).scrollTop())];
                                            $(event.target).parent().css('position', 'fixed');
                                            $('#dialog').dialog('option','position',position);
                                        }
                                });
                   
                    } else {
                          location=json['redirect'];
                      
                    }
                 },
                    error: function(xhr, ajaxOptions, thrownError) {
                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                        }
                      
        });	 
                    
              });
</script>

<?php echo $footer; ?>