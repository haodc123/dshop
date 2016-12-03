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
            <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_new; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <div style="width: 400px; float: left;">
                <div id="list-product" style="overflow-y: auto; height: 400px;">
                    <table class="list">
                        <thead>
                            <tr>
                                <td class="center"><?php echo $column_image; ?></td>
                                <td class="left"><?php echo $column_model; ?></td>
                                <td class="left"><?php echo $column_name; ?></td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($products) { ?>
                            <?php foreach ($products as $product) { ?>
                            <tr>
                                <td class="left"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>"/></td>
                                <td class="left"><?php echo $product['model']; ?></td>
                                <td class="left"><?php echo $product['name']; ?></td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="width: 600px; float: left;">
                <table class="form">
                    <tr>
                        <td></td>
                        <td>
                            <input type="text" name="model_color" value=""/>
                            <input style="display: none;" type="text" name="product_id" value=""/>
                            <input type="text" name="quantity" value="" size="2"/>
                            <select name="size">
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XS">XS</option>
                                <option value="XLL">XLL</option>
                            </select>
                              <input type="button" id="update_receipt" name="update_receipt" value="Update"/>
                        </td>
                    </tr>
                       
              
                <div id="switcher" style="float:right"></div>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_code; ?></td>
                        <td><input type="text" name="code" value="<?php echo $code; ?>"/>
                            <?php if ($error_code) { ?>
                            <span class="error"><?php echo $error_code; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_name; ?></td>
                        <td><input type="text" name="name" value="<?php echo $name; ?>" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_date; ?></td>
                        <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_supplier; ?></td>
                        <td>
                            <input type="text" name="supplier" value="<?php echo $supplier ?>" />
                            <input style="display: none;" type="hidden" name="supplier_id" value="<?php echo $supplier_id; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_manufacture; ?></td>
                        <td>
                            <input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" />
                            <input style="display: none;" type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="overflow-x:auto; width: 100%;">
                <table class="list">
                <thead>
                    <tr>
                        <td class="left"><?php echo $column_index;?></td>
                        <td class="left"><?php echo $column_image;?></td>
                        <td class="left"><?php echo $column_code;?></td>
                        <td class="left"><?php echo $column_name;?></td>
                        <td class="left"><?php echo $column_color;?></td>
                        <td class="left"><?php echo $column_size;?></td>
                        <td class="left"><?php echo $column_quantity;?></td>
                        <td class="left"><?php echo $column_price;?></td>
                         <td class="left"><?php echo $column_action;?></td>
                     </tr>
                </thead>
                <tbody>
                     <tr>
                        <td class="left"><?php echo $column_index; ?></td>
                        <td class="left"><?php echo $column_image; ?></td>
                        <td class="left"><?php echo $column_code; ?></td>
                        <td class="left"><?php echo $column_name; ?></td>
                        <td class="left"><?php echo $column_color; ?></td>
                        <td class="left"><?php echo $column_size; ?></td>
                        <td class="left"><?php echo $column_quantity; ?></td>
                        <td class="left"><?php echo $column_price; ?></td>
                        <td class="left"><input type="button" value="<?php echo $button_edit; ?>"/><input type="button" value="<?php echo $button_delete;?>"/></td>
                     </tr>
                      <tr>
                        <td class="left"><?php echo $column_index; ?></td>
                        <td class="left"><?php echo $column_image; ?></td>
                        <td class="left"><?php echo $column_code; ?></td>
                        <td class="left"><?php echo $column_name; ?></td>
                        <td class="left"><?php echo $column_color; ?></td>
                        <td class="left"><?php echo $column_size; ?></td>
                        <td class="left"><?php echo $column_quantity; ?></td>
                        <td class="left"><?php echo $column_price; ?></td>
                        <td class="left"><input type="button" value="<?php echo $button_edit; ?>"/><input type="button" value="<?php echo $button_delete;?>"/></td>
                     </tr>
                </tbody>
            </table>
            </div>

        </div>
    </div>
</div>

      

<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
  $('input[name=\'model_color\']').autocomplete({
        delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=warehouse/receipt_note/autocomplete&token=<?php echo $token; ?>&model_color=' +  encodeURIComponent(request.term),
                        dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model_color,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'model_color\']').attr('value', ui.item.label);
		$('input[name=\'product_id\']').attr('value', ui.item.value);
	
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
</script>
<script type="text/javascript"><!--

// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.manufacturer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'manufacturer\']').attr('value', ui.item.label);
		$('input[name=\'manufacturer_id\']').attr('value', ui.item.value);
	
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

// Spplier
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
<?php echo $footer; ?>