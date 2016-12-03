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
                   <div id="payment-method">
                         <div class="checkout-heading"><span class="line"><?php echo $text_checkout_payment_method; ?></span></div>
                        
                        <div class="checkout-content">
                            <!--PAYMENT METHOD-->
                            <?php if ($payment_methods) { ?>
                            <p><?php echo $text_payment_method; ?></p>
                            <table class="radio">
                                <?php foreach ($payment_methods as $payment_method) { ?>
                                <tr class="highlight">
                                    <td>
                                         <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"/>
                                    </td>
                                    <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
                                </tr>
                                <?php } ?>
                            </table>
                           
                            <?php } ?>
                        </div>
                        <div class="payment"></div>
                    </div>
                    <div id="shipping-address">
                        <div class="checkout-heading"><span><?php echo $text_checkout_shipping_address; ?></span></div>
                        <div class="checkout-content">
                            <div class="sidecart address_detail">
                                <h3>Billing Address</h3>
                                <ul>
                                    <li><span>First name:</span><?php echo $payment_firstname;?></li>

                                    <li><span>Last name:</span><?php echo $payment_lastname;?></li>

                                    <li><span>Street 1:</span><?php echo $payment_address_1;?></li>

                                    <li><span>Street 2:</span> <?php echo $payment_address_2;?></li>

                                    <li><span>Country:</span> <?php echo $payment_country;?></li>

                                    <li><span>Zip/Postcode:</span><?php echo $payment_postcode;?></li>

                                    <li><span>City/Suburb:</span><?php echo $payment_city;?></li>

                                    <li><span>State/Region:</span><?php echo $payment_zone;?></li>

                                    <li><span>Phone:</span><?php echo $payment_phone;?></li>

                                    <li><span>Email:</span><?php echo $payment_email;?></li>
                                </ul>
                                <h3>Shipping Address</h3>
                                <ul>
                                    <li><span>First name:</span><?php echo $shipping_firstname;?></li>

                                    <li><span>Last name:</span><?php echo $shipping_lastname;?></li>

                                    <li><span>Street 1:</span><?php echo $shipping_address_1;?></li>

                                    <li><span>Street 2:</span> <?php echo $shipping_address_2;?></li>

                                    <li><span>Country:</span> <?php echo $shipping_country;?></li>

                                    <li><span>Zip/Postcode:</span><?php echo $shipping_postcode;?></li>

                                    <li><span>City/Suburb:</span><?php echo $shipping_city;?></li>

                                    <li><span>State/Region:</span><?php echo $shipping_zone;?></li>


                                </ul>
                                <a class="sm_button" href="<?php echo $button_edit_address;?>">Edit details</a>

                            </div>
                        </div>
                    </div>

                    <div id="checkout-cart">
                        <div class="checkout-heading"><span><?php echo $text_checkout_shipping_address; ?></span></div>
                        <div class="checkout-content">


                            <table  class="cart-table">
                                <thead class="visuallyhidden">
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col" id="item-col">Item price</th>
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
                                            <a id="edit-cart" href="<?php echo $button_edit_cart;?>">Edit Cart</a>
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
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>
<script type=text/javascript>
$('#payment-method input[name=\'payment_method\']').live('change', function() {
   $.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-payment-method').attr('disabled', true);
			//$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			//$('#button-payment-method').attr('disabled', false);
			//$('.wait').remove();
		},			
		success: function(json) {
			//$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {
                                
                                          $('.payment').html(html);
                                            },
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

</script>
