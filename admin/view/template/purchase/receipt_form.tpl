<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/purchase.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div id="tab-product">
                    <div class="left-content">
                        <div id="tabs" class="htabs"><a href="#tab-code"><?php echo $tab_code; ?></a><a href="#tab-name"><?php echo $tab_name; ?></a></div>
                        <div id="tab-code">
                            <table class="list">
                                <thead>
                                    <tr>
                                        <td colspan="2" class="left"><?php echo $text_product; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="left"><?php echo $entry_code; ?></td>
                                        <td class="left">
                                            <input type="text" name="barcode" id="barcode" value=""/>
                                            <input type="button" id="btn_barcode" value="..."/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="tab-name">
                            <table class="list">
                                <thead>
                                    <tr>
                                        <td colspan="2" class="left"><?php echo $text_product; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="left"><?php echo $entry_name; ?></td>
                                        <td class="left"><input type="text" name="product" value="" />
                                            <input type="hidden" name="product_id" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td class="left"><?php echo $entry_quantity; ?></td>
                                        <td class="left"><input type="text" name="quantity" value="1" /></td>
                                    </tr>             
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td class="left">&nbsp;</td>
                                        <td class="left"><a id="button-product" class="button"><?php echo $button_add_product; ?></a></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="right-content">
                        <table class="form_purchase">
                            <thead>
                                <tr>
                                    <td colspan="2" class="left"><h2><?php echo $text_purchase; ?></h2></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="left" style="width: 150px;"><?php echo $entry_date;?></td>
                                    <td class="left">
                                        <input type="text" name="date_added" value="<?php echo $date_added;?>"  class="date"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="left"><?php echo $entry_reference_no;?></td>
                                    <td class="left">
                                        <input type="text" name="reference_no" value="<?php echo $reference_no;?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left"><?php echo $entry_warehouse;?></td>
                                    <td class="left">
                                        <select name="warehouse_id" id="warehouse_id">
                                            <?php if($warehouses){ ?>
                                            <?php foreach($warehouses as $warehouse) { ?> 
                                            <?php if($warehouse['warehouse_id']==$warehouse_id){ ?>
                                            <option value="<?php echo $warehouse['warehouse_id'];?>" selected="selected">
                                                <?php echo $warehouse['name'];?>
                                            </option>
                                            <?php }else { ?>
                                            <option value="<?php echo $warehouse['warehouse_id'];?>">
                                                <?php echo $warehouse['name'];?>
                                            </option>
                                            <?php } ?>
                                            <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </td>
                                </tr> 
                                <tr>
                                    <td class="left"><?php echo $entry_supplier;?></td>
                                    <td><input type="text" name="supplier" value="<?php echo $supplier; ?>" />
                                        <input type="hidden" name="supplier_id" value="<?php echo $supplier_id; ?>" /></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_note;?></td>
                                    <td>
                                        <textarea style="resize: none; width: 50%;" name="note"><?php echo $note; ?></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="list">
                            <thead>
                                <tr>

                                    <td class="left"><?php echo $column_product; ?></td>
                                    <td class="left"><?php echo $column_mcs; ?></td>
                                    <td class="right"><?php echo $column_quantity; ?></td>
                                    <td class="right"><?php echo $column_price; ?></td>
                                    <td class="right"><?php echo $column_total; ?></td>
                                    <td></td>
                                </tr>
                            </thead>
                            <?php $product_row = 0; ?>
                            <tbody id="product">
                                <?php if ($purchase_products) { ?>
                                <?php foreach ($purchase_products as $purchase_product) { ?>
                                <tr id="product-row<?php echo $product_row; ?>">

                                    <td class="left"><?php echo $purchase_product['name']; ?><br />
                                        - <small><?php echo $text_color; ?></small><small style="background-color:#fafafa; color:<?php echo $product['color_code']; ?>"><?php echo $purchase_product['color']; ?></small><br />
                                        - <small><?php echo $text_size; ?></small><small><?php echo $purchase_product['size']; ?></small><br />
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][size]" value="<?php echo $purchase_product['size']; ?>" />
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][color]" value="<?php echo $purchase_product['color']; ?>" />
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][product_id]" value="<?php echo $purchase_product['product_id']; ?>" />
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][name]" value="<?php echo $purchase_product['name']; ?>" />
                                    <td class="left"><?php echo $purchase_product['mcs']; ?>
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][model]" value="<?php echo $purchase_product['model']; ?>" />
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][mc]" value="<?php echo $purchase_product['mc']; ?>" />
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][mcs]" value="<?php echo $purchase_product['mcs']; ?>" />
                                    </td>
                                    <td class="right" onclick="edit( < ?php echo $product_row; ? > );" ><p id="quantity_<?php echo $product_row; ?>"><?php echo $purchase_product['quantity']; ?></p>
                                        <input type="hidden" class="quantity" name="purchase_product[<?php echo $product_row; ?>][quantity]" value="<?php echo $purchase_product['quantity']; ?>" /></td>                 
                                    <td class="right"><?php echo $purchase_product['price_text']; ?>
                                        <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][price]" value="<?php echo $purchase_product['price']; ?>" /></td>
                                    <td class="right">
                                        <p id="total_<?php echo $product_row; ?>">
                                            <?php echo $purchase_product['total_text']; ?>
                                        </p>
                                        <input class="total" type="hidden" name="purchase_product[<?php echo $product_row; ?>][total]" value="<?php echo $purchase_product['total']; ?>" />
                                    <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="Remove( < ?php echo $product_row; ? > );" /></td>
                                </tr>
                                <?php $product_row++;?>
                                <?php } ?>
                                <tr>
                                    <td class="right" colspan="4">
                                        <?php echo $column_total;?>
                                    </td>
                                    <td class="center" colspan="2">
                                        <p id="total"><?php echo $total_text; ?></p>
                                        <input type="hidden" name="total" value="<?php echo $total; ?>" />
                                        <input type="hidden" name="total_quantity" value="<?php echo $quantity; ?>" />
                                    </td>
                                </tr>
                                <?php } else { ?>
                                <tr>
                                    <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>

            </form>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    function edit(product_row){
     $("#quantity_"+ product_row).editInPlace({
               callback: function(unused,enteredText){
                $("input[name='purchase_product["+ product_row + "][quantity]']").val(enteredText);
               var price= parseFloat($("input[name='purchase_product["+ product_row + "][price]']").val());
               var quantity= parseFloat(enteredText);
               var total=price*quantity;
               $("input[name='purchase_product["+ product_row + "][total]']").val(total);
               $("#total_"+product_row).html(total).formatCurrency({ roundToDecimalPlace:0, eventOnDecimalsEntered: true });
             
               // total price purchase
               var totalPrices = 0;
              $('.total').each(function(index){
                if(!isNaN($("input[name='purchase_product[" + index + "][total]']").val())){
                        totalPrices += parseFloat($("input[name='purchase_product[" + index + "][total]']").val());
                    }
                    
                });
             $("input[type='hidden'][name='total']").val(totalPrices);
             $("#total").html(totalPrices).formatCurrency({ roundToDecimalPlace:0, eventOnDecimalsEntered: true });
             // total quantity purchase
              var quantity = 0;
              $('.quantity').each(function(index){
                if(!isNaN($("input[name='purchase_product[" + index + "][quantity]']").val())){
                    quantity += parseFloat($("input[name='purchase_product[" + index + "][quantity]']").val());
                    }
                });
             $("input[type='hidden'][name='total_quantity']").val(quantity);
         
                    return(enteredText);
             }
          });
                              
       }
</script>
<script type="text/javascript">
 function Remove(product_row){
 $('#product-row' + product_row).remove();
        if ($(this).attr('id') == 'button-product') {
		data = '#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea, ';
	} else {
		data = '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, ';
	}
	$.ajax({
		url:'index.php?route=purchase/purchase/addProduct&token=<?php echo $token; ?>',
		type: 'post',
		data: $(data),
		dataType: 'json',	
		beforeSend: function() {
                },			
		success: function(json) {
			
			if (json['purchase_product'] !== '') {
				var product_row = 0;
				html = '';
				
				for (i = 0; i < json['purchase_product'].length; i++) {
					product = json['purchase_product'][i];
					html += '<tr id="product-row' + product_row + '">';
					html += '  <td class="left">' + product['name'] + '<br /><input type="hidden" name="purchase_product[' + product_row + '][color]" value="'+product['color']+'" /><input type="hidden" name="purchase_product[' + product_row + '][size]" value="'+ product['size'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][product_id]" value="' + product['product_id'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][name]" value="' + product['name'] + '" />';
                                        html += '  - <small>' + json['text_color'] + ': ' + product['color'] + '</small><br />';
                                        html += '  - <small>' +  json['text_size'] + ': ' + product['name'] + '</small><br />';
					html += '  </td>';
					html += '  <td class="left">' + product['model'] + '<input type="hidden" name="purchase_product[' + product_row + '][model]" value="' + product['model'] + '" /></td>';
					html += '  <td class="right"><p id="quantity_'+ product_row +'" onclick="edit('+product_row+');">' + product['quantity'] + '</p><input class="quantity" type="hidden" name="purchase_product[' + product_row + '][quantity]" value="' + product['quantity'] + '" /></td>';
					html += '  <td class="right">' + product['price_text'] + '<input class="price" type="hidden" name="purchase_product[' + product_row + '][price]" value="' + product['price'] + '" /></td>';
					html += '  <td class="right"><p id="total_'+ product_row +'">' + product['total_text'] + '</p><input class="total" type="hidden" name="purchase_product[' + product_row + '][total]" value="' + product['total'] + '" /></td>';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="Remove('+ product_row +'); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '</tr>';
                                        product_row++;	
                                      
                                       
				}
				html += '</tr>';
				html += '  <td colspan="4" class="right"><?php echo $column_total;?></td><td colspan="2"><p id="total">'+json['total_text']+'</p></td>';
                              	html += '  <input type="hidden" name="total" value="'+json['total']+'"/>';
                                html += '  <input type="hidden" name="total_quantity" value="'+json['quantity']+'"/>';
				html += '</tr>';
			} else {
                                html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	
                               	
			}
			 $('#product').html(html);	
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
 }
</script>
<script type="text/javascript">
    // Manufacturer
$('input[name=\'supplier\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/supplier/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.supplier_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'supplier\']').attr('value', ui.item.label);
		$('input[name=\'supplier_id\']').attr('value', ui.item.value);
	
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
</script>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
        delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {	
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id,
						model: item.model,
                                                price: item.price
					}
				}));
                                
			}
		});
               
	}, 
	select: function(event, ui) {
		$('input[name=\'product\']').attr('value', ui.item['label']);
		$('input[name=\'product_id\']').attr('value', ui.item['value']);
                return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});	
//--></script> 
<script type="text/javascript"><!--
$('#button-product, #button-voucher, #button-update').live('click', function() {	
        
        if ($(this).attr('id') == 'button-product') {
		data = '#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea, ';
	} else {
		data = '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, ';
	}
	$.ajax({
		url:'index.php?route=purchase/purchase/addProduct&token=<?php echo $token; ?>',
		type: 'post',
		data: $(data),
		dataType: 'json',	
		beforeSend: function() {
				},			
		success: function(json) {
			if (json['purchase_product'] !== '') {
				var product_row = 0;
				html = '';
				for (i = 0; i < json['purchase_product'].length; i++) {
					product = json['purchase_product'][i];
					html += '<tr id="product-row' + product_row + '">';
					html += '  <td class="left">' + product['name'] + '<br /><input type="hidden" name="purchase_product[' + product_row + '][color]" value="'+product['color']+'" /><input type="hidden" name="purchase_product[' + product_row + '][size]" value="'+ product['size']+'" /><input type="hidden" name="purchase_product[' + product_row + '][product_id]" value="' + product['product_id'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][name]" value="' + product['name'] + '" />';
					html += '  - <small>' + json['text_color'] + ': ' + product['color'] + '</small><br />';
                                        html += '  - <small>' +  json['text_size'] + ': ' + product['name'] + '</small><br />';
					html += '  </td>';
					html += '  <td class="left">' + product['mcs'] + '<input type="hidden" name="purchase_product[' + product_row + '][mcs]" value="' + product['mcs'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][mc]" value="' + product['mc'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][model]" value="' + product['model'] + '" /></td>';
					html += '  <td class="right"><p id="quantity_'+ product_row +'" onclick="edit('+product_row+');">' + product['quantity'] + '</p><input class="quantity" type="hidden" name="purchase_product[' + product_row + '][quantity]" value="' + product['quantity'] + '" /></td>';
					html += '  <td class="right">' + product['price_text'] + '<input class="price" type="hidden" name="purchase_product[' + product_row + '][price]" value="' + product['price'] + '" /></td>';
					html += '  <td class="right"><p id="total_'+ product_row +'">' + product['total_text'] + '</p><input class="total" type="hidden" name="purchase_product[' + product_row + '][total]" value="' + product['total'] + '" /></td>';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="Remove('+ product_row +'); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '</tr>';
                                        product_row++;	
                                }
				html += '</tr>';
				html += '  <td colspan="4" class="right"><?php echo $column_total;?></td><td colspan="2"><p id="total">'+json['total_text']+'</p></td>';
                              	html += '  <input type="hidden" name="total" value="'+json['total']+'"/>';
                                html += '  <input type="hidden" name="total_quantity" value="'+json['quantity']+'"/>';
				html += '</tr>';
				$('#product').html(html);
			} else {
                                html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	
                                $('#product').html(html);	
			}
				
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
//--></script>
<script type="text/javascript">
    $("#btn_barcode").live('click', function() {
          if ($(this).attr('id') === 'button-product') {
		data = '#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea, ';
            } else {
		data = '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, ';
            }
              $.ajax({
		url: 'index.php?route=purchase/purchase/barcode&token=<?php echo $token; ?>&barcode=' + $('input[name=barcode]').val(),
		type: 'post',
                data: $(data),
		dataType: 'json',
		beforeSend: function() {
                },
		success: function(json) {
                    if (json['purchase_product'] !== '') {
				var product_row = 0;
				html = '';
				for (i = 0; i < json['purchase_product'].length; i++) {
					product = json['purchase_product'][i];
					html += '<tr id="product-row' + product_row + '">';
					html += '  <td class="left">' + product['name'] + '<br /><input type="hidden" name="purchase_product[' + product_row + '][color]" value="'+product['color']+'" /><input type="hidden" name="purchase_product[' + product_row + '][size]" value="'+ product['size']+'" /><input type="hidden" name="purchase_product[' + product_row + '][product_id]" value="' + product['product_id'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][name]" value="' + product['name'] + '" />';
					html += '  <small>' + json['text_color'] + product['color'] + '</small><br />';
                                        html += '  <small>' +  json['text_size'] + product['name'] + '</small><br />';
					html += '  </td>';
					html += '  <td class="left">' + product['mcs'] + '<input type="hidden" name="purchase_product[' + product_row + '][mcs]" value="' + product['mcs'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][mc]" value="' + product['mc'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][model]" value="' + product['model'] + '" /></td>';
					html += '  <td class="right"><p id="quantity_'+ product_row +'" onclick="edit('+product_row+');">' + product['quantity'] + '</p><input class="quantity" type="hidden" name="purchase_product[' + product_row + '][quantity]" value="' + product['quantity'] + '" /></td>';
                                        html += '  <td class="right">' + product['price_text'] + '<input class="price" type="hidden" name="purchase_product[' + product_row + '][price]" value="' + product['price'] + '" /></td>';
					html += '  <td class="right"><p id="total_'+ product_row +'">' + product['total_text'] + '</p><input class="total" type="hidden" name="purchase_product[' + product_row + '][total]" value="' + product['total'] + '" /></td>';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="Remove('+ product_row +'); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '</tr>';
                                        product_row++;	
                                           
				}
				html += '</tr>';
				html += '  <td colspan="4" class="right"><?php echo $column_total;?></td><td colspan="2"><p id="total">'+json['total_text']+'</p></td>';
                              	html += '  <input type="hidden" name="total" value="'+json['total']+'"/>';
                                html += '  <input type="hidden" name="total_quantity" value="'+json['quantity']+'"/>';
				html += '</tr>';
			  //  $('#barcode').val('');
                       } else {
                                html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	
                              	
			}
			$('#product').html(html);
		
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
         $("#barcode").val('');
            return false;
	 });  
</script>
<script type="text/javascript">
    $(function(){
        $("#barcode").keypress(function(e){
            if(e.keyCode===13){ 
             if ($(this).attr('id') === 'button-product') {
		data = '#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea, ';
            } else {
		data = '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, ';
            }
              $.ajax({
		url: 'index.php?route=purchase/purchase/barcode&token=<?php echo $token; ?>&barcode=' + this.value,
		type: 'post',
                data: $(data),
		dataType: 'json',
		beforeSend: function() {
                },
		success: function(json) {
                    if (json['purchase_product'] !== '') {
				var product_row = 0;
				html = '';
				for (i = 0; i < json['purchase_product'].length; i++) {
					product = json['purchase_product'][i];
					html += '<tr id="product-row' + product_row + '">';
					html += '  <td class="left">' + product['name'] + '<br /><input type="hidden" name="purchase_product[' + product_row + '][color]" value="'+product['color']+'" /><input type="hidden" name="purchase_product[' + product_row + '][size]" value="'+ product['size']+'" /><input type="hidden" name="purchase_product[' + product_row + '][product_id]" value="' + product['product_id'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][name]" value="' + product['name'] + '" />';
					html += '  <small>' + json['text_color'] + product['color'] + '</small><br />';
                                        html += '  <small>' +  json['text_size'] + product['name'] + '</small><br />';
					html += '  </td>';
					html += '  <td class="left">' + product['mcs'] + '<input type="hidden" name="purchase_product[' + product_row + '][mcs]" value="' + product['mcs'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][mc]" value="' + product['mc'] + '" /><input type="hidden" name="purchase_product[' + product_row + '][model]" value="' + product['model'] + '" /></td>';
					html += '  <td class="right"><p id="quantity_'+ product_row +'" onclick="edit('+product_row+');">' + product['quantity'] + '</p><input class="quantity" type="hidden" name="purchase_product[' + product_row + '][quantity]" value="' + product['quantity'] + '" /></td>';
                                        html += '  <td class="right">' + product['price_text'] + '<input class="price" type="hidden" name="purchase_product[' + product_row + '][price]" value="' + product['price'] + '" /></td>';
					html += '  <td class="right"><p id="total_'+ product_row +'">' + product['total_text'] + '</p><input class="total" type="hidden" name="purchase_product[' + product_row + '][total]" value="' + product['total'] + '" /></td>';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="Remove('+ product_row +'); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '</tr>';
                                        product_row++;	
                                           
				}
				html += '</tr>';
				html += '  <td colspan="4" class="right"><?php echo $column_total;?></td><td colspan="2"><p id="total">'+json['total_text']+'</p></td>';
                              	html += '  <input type="hidden" name="total" value="'+json['total']+'"/>';
                                html += '  <input type="hidden" name="total_quantity" value="'+json['quantity']+'"/>';
				html += '</tr>';
			  //  $('#barcode').val('');
                       } else {
                                html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	
                        }
			$('#product').html(html);
		
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
         $("#barcode").val('');
            return false;
	    }
          }
        );

    });

</script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
//$('.date').datepicker({dateFormat: 'dd-mm-yy'}).datepicker("setDate", new Date());
$('.date').datepicker({dateFormat: 'dd/mm/yy'});
$('.datetime').datetimepicker({
	dateFormat: 'dd/mm/yy',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script> 
<?php echo $footer; ?>