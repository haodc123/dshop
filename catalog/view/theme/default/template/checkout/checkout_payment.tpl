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
      <div class="checkout-heading"><?php echo $text_checkout_payment_method; ?></div>
      <div class="checkout-content"></div>
    </div>
    <div id="confirm">
      <div class="checkout-heading"><?php echo $text_checkout_confirm; ?></div>
      <div class="checkout-content">
                     <?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<table class="radio">
  <?php foreach ($payment_methods as $payment_method) { ?>
  <tr class="highlight">
    <td><?php if ($payment_method['code'] == $code || !$code) { ?>
      <?php $code = $payment_method['code']; ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
      <?php } else { ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
      <?php } ?></td>
    <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
  </tr>
  <?php } ?>
</table>
<br />
<?php } ?>
<b><?php echo $text_comments; ?></b>
<textarea name="comment" rows="8" style="width: 98%;"><?php echo $comment; ?></textarea>
<br />
<br />
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="right"><?php echo $text_agree; ?>
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button_small" />
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button_small" />
  </div>
</div>
<?php } ?>
      </div>
    </div>
          </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#payment-address-edit').bind('click', function(){
        $.ajax({
                
                url: 'index.php?route=checkout/fileaddress/validate',
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
                                            position: ['top',50,'center']
                });
                }else{
                        $('#dialog').remove();
                        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/fileaddress&address_id='+ $('#payment-existing select[name=address_id]').val()+'" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                        $('#dialog').dialog({
                        title: null,
                        close: function () {
                            $.ajax({
                                url: 'index.php?route=checkout/fileaddress/address',
                                dataType: 'json',
                                success: function(json) {
                                html='';
                               for (i = 0; i < json['addresses'].length; i++) {
                                 address =  json['addresses'][i];
                                
                                 html += '<input type="radio" name="address_id" value="' + address['address_id'] + '" checked="checked"/>';
                                 html += '<strong>'+ address['firstname']+' '+ address['lastname']+'</strong>,<br/>';
                                 html += address['address_1']+',<br/>';
                                 html += address['city']+',<br/>';
                                 html += address['zone']+', <br/>';
                                  html += address['country']+'<br/>';
                             
                              }
                              $('#payment-existing').html(html);
                              
                               
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
                position: ['top',50,'center']
	});
                    
                    }
                //----------
		}});
              
 });
</script>
<script type="text/javascript">
    $('#shipping-address-new').bind('click', function(){
   /* $.ajax({
		url: 'index.php?route=checkout/cart/validate',
		dataType: 'json',
		success: function(json) {
			
		}
                });
         */
         
        $('#dialog').remove();
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/file_shipping_address" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
	$('#dialog').dialog({
		title: null,
                close: function () {
                $.ajax({
		url: 'index.php?route=checkout/file_shipping_address',
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
		height: 400,
		resizable: false,
		modal: true,
                closeOnEscape: true,
                draggable: false,
                position: ['top',50,'center']
	});


});
</script>
<?php echo $footer; ?>