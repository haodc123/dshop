<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <div id="content">
                <?php echo $content_top; ?>
                <div class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <h1><?php echo $heading_title; ?></h1>
               <div class="cart-info-w">
                   <?php if ($attention) { ?>
                   <div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
                   <?php } ?>
                   <?php if ($error_warning) { ?>
                   <div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
                   <?php } ?>
                </div>
               <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="cart-info">
                        <div class="cart-info-loadding">
                            <td colspan="6" class="loading">
                                <div id="loading" style="display: none;"><img alt="" src="catalog/view/theme/default/Images/Mita/icon/loading.gif"></div>
                            </td>
                        </div>
                        <table id=cart-table>
                            <thead>
                                <tr>
                                    <td class="image"><span><?php echo $column_image; ?></span></td>
                                    <td class="name"><?php echo $column_name; ?></td>

                                    <td class="price"><?php echo $column_price; ?></td>
                                    <td class="quantity"><?php echo $column_quantity; ?></td>

                                    <td class="total"><?php echo $column_total; ?></td>
                                    <td class="delete"><?php echo $column_delete; ?></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i=0; foreach ($products as $product) { $i++; ?>
                                <tr id="row_<?php echo $i; ?>"> 
                                    <td class="image"><?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                        <?php } ?></td>
                                    <td class="name">
                                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                         <?php if (!$product['stock']){ ?>
                                         <span class="stock" style="display:block"  id="stock_<?php echo $i; ?>">
                                            ***
                                            </span>
                                       <?php }else{ ?>
                                             <span class="stock" style="display:none"  id="stock_<?php echo $i; ?>">
                                           ***
                                         </span>
                                         <?php } ?>
                                        <div>
                                            <small><span><?php echo $text_product_code;?></span> <?php echo $product['mc']; ?></small><br />
                                            <small><span><?php echo $text_color;?></span> <?php echo $product['color']; ?></small><br />
                                            <small><span><?php echo $text_size;?></span> <?php echo $product['size']; ?></small><br />
                                            
                                            <?php foreach ($product['option'] as $option) { ?>
                                            <small><span><?php echo $option['name']; ?>:</span> <?php echo $option['value']; ?></small>
                                            <?php } ?>
                                            <?php if ($product['reward']) { ?>
                                            <small><?php echo $product['reward']; ?></small>
                                        <?php } ?>
                                        </div>
                                        </td>
                                    <td class="price" id="price"><?php echo $product['price']; ?></td>
                                    <td class="quantity">
                                        <?php if($product['quantity']){ ?>
                                        <input type='button' value='-' class='qtyminus' data-default="<?php echo $product['key']; ?>" data-row="<?php echo $i;?>" field="quantity_<?php echo $i;?>" />
                                        <input readonly="readonly" type='text' id="quantity_<?php echo $i; ?>" name="quantity[<?php echo $product['key']; ?>]"  size="1" value="<?php echo $product['quantity']; ?>" class='qty' />
                                        <input type='button'  value='+' class='qtyplus' data-default="<?php echo $product['key']; ?>" data-row="<?php echo $i;?>" field="quantity_<?php echo $i; ?>" />
                                        <?php } ?>
                                       
                                    </td>
                                    <td class="total" id="total_<?php echo $i; ?>"><?php echo $product['total']; ?></td>
                                      <td class="delete" id="remove_<?php echo $i; ?>"><i class="remove fa fa-times-circle fa-lg" data-row="<?php echo $i;?>" data-default="<?php echo $product['key']; ?>"></i></td>
                                </tr>

                                <?php } ?>
                                
                            </tbody>
                            <tfoot class="cart-total">
                                <tr><td colspan="6" class="theight"></td></tr>
                                <?php $i=0; foreach ($totals as $total) { $i++; ?>
                                <tr>
                                    <td colspan="4" <?php if(count($totals)==$i){ ?> class="total" <?php } ?>><?php echo $total['title']; ?>:</td>
                                    <td <?php if(count($totals)==$i){ ?> class="total" <?php } ?>><?php echo $total['text']; ?></td>
                                    <td></td>
                                </tr>
                                <?php } ?>
                                 <tr><td colspan="6" class="theight"></td></tr>
                            </tfoot>
                        </table>
                        <div class="buttons">
                              <div class="right"><a id="checkout" class="button_medium"><?php echo $button_checkout; ?></a></div>
                           
                            <div class="left"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_shopping; ?></a></div>
                        </div>
                    </div>
                    

            
                </form>
            </div>

        </div>


    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function() {
        // This button will increment the value
        $('.remove').click(function(e) {
            e.preventDefault();
            key = $(this).attr('data-default');
            row = $(this).attr('data-row');
            $.ajax({
                url: 'index.php?route=checkout/cart/remove',
                type: 'post',
                dataType: 'json',
                data: 'remove=' + key,
                	beforeSend: function() {
                       $("#loading").css("display", "block");
                 },
                 complete: function() { 
                    $('.attention').remove();
                },
                success: function(json) {
                   $('.warning').remove();
                   $("#loading").css("display", "none");
                    // if exit key then remove cart
                   $('#row_' + row).hide(100, function() {
                            $(this).remove();
                        });
                     html = '';
                     if(json['empty']!=true) {
                       $('#total_'+row).html(json['total']);
                       html+='  <tr><td colspan="6" class="theight"></td></tr>';
                        for (i = 0; i < json['totals'].length; i++) {
                            totals = json['totals'][i];
                            html+='<tr>';
                            if(json['totals'].length-1===i){ html+='<td colspan="4" class="total">';}else{ html+='<td colspan="4" >'; }
                            html+= totals['title']+":";
                            html+='</td>';
                            if(json['totals'].length-1===i){ html+='<td class="total">';}else{ html+='<td>'; }
                            html+= totals['text'];
                            html+='</td>';
                            html+='<td></td>';
                    }
                        html+='<tr><td colspan="6" class="theight"></td></tr>';
                        $('.cart-total').html(html);
                 } else {
                       html+='  <div class="cart-info-loadding">';
                       html+='   <td colspan="6" class="loading">';
                       html+='     </td>';
                       html+='  </div>';
                       html+='  <table  id="cart-info">';
                       html+='       <tr>';
                       html+='         <td class="image"><span><?php echo $column_image; ?></span></td>';
                       html+='         <td class="name"><?php echo $column_name; ?></td>';
                       html+='         <td class="price"><?php echo $column_price; ?></td>';
                       html+='         <td class="quantity"><?php echo $column_quantity; ?></td>';
                       html+='       <td class="total"><?php echo $column_total; ?></td>';
                       html+='       <td class="delete"><?php echo $column_delete; ?></td>';
                       html+='    </tr>';
                       html+='  </thead>';
                       html+='   <tbody class="cart-body">';
                       html+='      <tr>';
                       html+='          <td colspan="6">';
                       html+='         </td>';
                       html+='      </tr>';
                       html+='   </tbody>';
                       html+='  <tfoot class="cart-total-not-found">';
                       html+='        <tr>';
                       html+='        <td colspan="6"></td>';
                       html+='      </tr>';
                       html+='   </tfoot>';
                       html+='  </table>';
                       html+='   <div class="buttons">';
                       html+='       <div class="left"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_shopping; ?></a></div>';
                       html+='   </div>';
                       $('.cart-info').html(html);
                 }
                 $('#cart-quantity').html(json['total_quantity']);
                    //Reload small cart
                    $('#cartview').remove();
                    htmls = '';
                    htmls += ' <div id="cartview"> ';
                    htmls += '    <div id="cartview-content">';
                    htmls += '<ul class="items">';
                    for (i = 0; i < json['products'].length; i++) {
                    product = json['products'][i];
                    htmls += ' <li>';
                    htmls += ' <a href="' + product['href'] + '"> <img alt="" src="' + product['thumb'] + '"></a>';
                    htmls += ' <div class="prod_details">';
                    htmls += ' <strong>' + product['name'] + ':' + product['model'] + '</strong>';
                    htmls += '<dl>';
                    for (j = 0; j < product['option'].length; j++)
                    {
                            option = product['option'][j];
                            htmls += '  <dt>' + option['name'] + '</dt> <dd>' + option['value'] + '</dd>';
                    }
                            htmls += '  <dt>Quantity:</dt> <dd id="qt_' + i + '">' + product['quantity'] + '</dd>';
                            htmls += '</dl>';
                            htmls += ' <div class="price"><span id="pc_' + i + '">  ' + product['price'] + '</span></div>';
                            htmls += '</li>';
                    }
                    htmls += '</ul>';
                    htmls += '<div class="totals">';
                    htmls += '<dl id="dl">';
                    for (i = 0; i < json['totals'].length; i++) {
                        totals = json['totals'][i];
                        htmls += '<dt>' + totals['title'] + '</dt> <dd>' + totals['text'] + '</dd>';
                    }
                    htmls += '</dl>';
                    htmls += '</div>';
                    htmls += '</div>';
                    htmls += '<div class="action">';
                    htmls += '<a class="button checkout" href="' + json['checkout'] + '">Checkout<span class="sym">&gt;&gt;</span></a>';
                    htmls += '</div>';
                    htmls += '</div>';
                    $('#cart').after(htmls);

                      
                }}
                );


        });
    });
</script>
<script type="text/javascript">
    jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName= $(this).attr('field');
        key= $(this).attr('data-default');
        row= $(this).attr('data-row');
        // Get its current value
        var currentVal = parseInt($('#'+fieldName).val());
        // If is not undefined
        if (!isNaN(currentVal)){
            // Increment
              $('#'+fieldName).val(currentVal + 1);
          //  $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('#'+fieldName).val(0);
        }
        $.ajax({
		url: 'index.php?route=checkout/cart/update',
		type: 'post',
		data: "quantity=" + $('#'+fieldName).val()+ "& key=" + key,
		dataType: 'json',
                beforeSend: function() {
                
                    $("#loading").css("display", "block");
                 },
                complete: function() {
                   
                },
		success: function(json) {
                     $("#loading").css("display", "none");
                   if(json['key']){
                          $('#total_'+row).html(json['total']);
                           if(json['stock']===false){
                                $('#stock_' + row).css("display", "block");
                            }else{
                                $('#stock_' + row).css("display", "none");
                            }
                          html='';
                          html+='  <tr><td colspan="6" class="theight"></td></tr>';
                          for (i = 0; i < json['totals'].length; i++)
                          {
                            totals = json['totals'][i];
                            html+='<tr>';
                            if(json['totals'].length-1===i)
                            {
                                html+='<td colspan="4" class="total">'+totals['title']+':</td>';
                            } else { 
                                html+='<td colspan="4" >'+ totals['title']+':</td>';
                            }
                            if(json['totals'].length-1===i)
                            { 
                                html+='<td class="total">';
                                html+= totals['text'];
                                html+='</td>';
                                html+='<td></td>';
                            } else {
                                html+='<td>'; 
                                html+= totals['text'];
                                html+='</td>';
                                html+='<td></td>';
                            }
                          html+='</tr>';
                       }
                       html+='<tr><td colspan="6" class="theight"></td></tr>';
                       $('#cart-quantity').html(json['total_quantity']);
                       $('.cart-total').html(html);
                       if( json['error_warning']){
                       $('.cart-info-w').html('<div class="warning">'+ json['error_warning'] +'<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
                       }
                       // Reload small cart
                       $('#qt_' + row).html(json['quantity']);
                        $('#pc_' + row).html(json['total']);
                       
                      
                        htmls = '';
                        htmls += '<dl id="dl">';
                        for (i = 0; i < json['totals'].length; i++) {
                            totals = json['totals'][i];
                            htmls += '<dt>'+ totals['title'] + '</dt> <dd>'+ totals['text'] + '</dd>';
                        }
                        htmls += '</dl>';
                        $('.totals').html(htmls); 
                       }
                       }
            });
      });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
    // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
         key= $(this).attr('data-default');
        row= $(this).attr('data-row');
        // Get its current value
           var currentVal = parseInt($('#'+fieldName).val());
      
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 1) {
            // Decrement one
            $('#'+fieldName).val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('#'+fieldName).val(1);
        }
          $.ajax({
		url: 'index.php?route=checkout/cart/update',
		type: 'post',
		data: "quantity=" + $('#'+fieldName).val()+ "& key=" + key,
		dataType: 'json',
                 beforeSend: function() {
                    $("#loading").css("display", "block");
                },
                 complete: function() {
                       
                },
		success: function(json) {
                     $("#loading").css("display", "none");
                     
                     if(json['key']){
                          $('#total_'+row).html(json['total']);
                          if(json['stock']===false){
                                $('#stock_' + row).css("display", "block");
                            }else{
                                $('#stock_' + row).css("display", "none");
                                 $('.success, .warning').remove();
                            }
                          html='';
                          html+='  <tr><td colspan="6" class="theight"></td></tr>';
                          for (i = 0; i < json['totals'].length; i++)
                          {
                          totals = json['totals'][i];
                          html+='<tr>';
                          if(json['totals'].length-1===i)
                          {
                            html+='<td colspan="4" class="total">'+totals['title']+':</td>';
                           }else{ 
                            html+='<td colspan="4" >'+ totals['title']+':</td>';
                          }
                          if(json['totals'].length-1===i)
                           { 
                                html+='<td class="total">';
                                html+= totals['text'];
                                html+='</td>';
                                html+='<td></td>';
                            }else{
                                html+='<td>'; 
                                html+= totals['text'];
                                html+='</td>';
                                html+='<td></td>';
                            }
                          html+='</tr>';
                       }
                       html+='<tr><td colspan="6" class="theight"></td></tr>';
                       $('#cart-quantity').html(json['total_quantity']);
                       $('.cart-total').html(html);
                       if(json['error_warning']){
                        $('.cart-info-w').html('<div class="warning">'+ json['error_warning'] +'<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
                        }
                        // Reload small cart
                        $('#qt_'+row).html(json['quantity']);
                        $('#pc_'+row).html(json['total']);
                        htmls = '';
                        htmls += '<dl id="dl">';
                        for (i = 0; i < json['totals'].length; i++) {
                        totals = json['totals'][i];
                        htmls += '<dt>'+ totals['title'] + '</dt> <dd>'+ totals['text'] + '</dd>';
                        }
                        htmls += '</dl>';
                        $('.totals').html(htmls); 
                       }
                       }
        });
    });
   
});
</script>
<script type="text/javascript"><!--
$('#checkout').bind('click', function(){
         $.ajax({
		url: 'index.php?route=checkout/cart/validate',
		dataType: 'json',
		success: function(json) {
			if(json['stock']===false){
                              $('.cart-info-w').html('<div class="warning">'+json['error_warning'] +'<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
                              $('html, body').animate({ scrollTop: 200 }, 'slow'); 
                           
                        }else{
                            if(json['login']===false){
                            $('#dialog').remove();
                            $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=checkout/filelogin" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="no"></iframe></div>');
                            $('#dialog').dialog({
                                     title: null,
                                     autoOpen:true,
                                     bgiframe: false,
                                     minHeight: 200,
                                     width: 800,
                                     height: 370,
                                     resizable: false,
                                     modal: true,
                                     closeOnEscape: true,
                                     draggable: false,
                                     position: ['top',50,'center'],
                                     show: {effect: 'fade', duration: 250},
                                     hide: {effect: 'fade', duration: 250},
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
            }
               
	});
                        }else {
                          window.location.href = json['login'];
                    }
                            
            }
                }});
         
         
        


});
//--></script> 
<?php echo $footer; ?>
 