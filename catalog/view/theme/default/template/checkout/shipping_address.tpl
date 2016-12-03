<?php if ($shipping_addresses) { ?>
<div>
    <select name="shipping_address_id" class="large-field-address">
        <?php foreach ($shipping_addresses as $address) { ?>
        <?php if ($address['address_id']!= $payment_address_id) { ?>
        <?php if ($address['address_id']== $shipping_address_id) { ?>
        <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
        <?php }else { ?>
        <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
    </select>
</div>
<div id="shipping-content">
    <table class="form">
        <tr>
            <td><label><?php echo $entry_firstname; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_firstname; ?></span>
        </tr>
        <tr>
            <td> <label><?php echo $entry_lastname; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_lastname; ?></span>
        </tr>
        <tr>
            <td> <label><?php echo $entry_address_1; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_address_1; ?></span>
        </tr>
        <tr>
            <td><label><?php echo $entry_address_2; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_address_2; ?></span>
        </tr>
        <tr>
            <td><label><?php echo $entry_country; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_country;?></span>
            </td>
        </tr>
        <tr>
            <td><label><?php echo $entry_postcode; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_postcode; ?></span>
        </tr>
        <tr>
            <td><label><?php echo $entry_city; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_city; ?></span></td>
        </tr>

        <tr>
            <td><label><?php echo $entry_zone; ?></label></td>
            <td><span class="large-field"><?php echo $shipping_zone; ?></span>
            </td>
        </tr>
    </table>
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
                                            position: ['top',50,'center']
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
    
    $.ajax({
               
                url: 'index.php?route=checkout/shipping_address_new/validate',
		dataType: 'json',
		success: function(json) {
                if(json['error']){
                             $('#dialog').remove();
                             $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/filelogin" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                             $('#dialog').dialog({
                                     title: null,
                                             
                                     close: function () {
                                        $.ajax({
                                            url: 'index.php?route=checkout/shipping_address_new/validate',
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
 



