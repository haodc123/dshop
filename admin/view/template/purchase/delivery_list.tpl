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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/purchase.png" alt="" /> <?php echo $heading_title; ?></h1>
       <?php if ($this->user->hasPermission('modify', 'purchase/delivery')){ ?>
      <div class="buttons">
          <?php if ($this->user->hasPermission('invoice', 'purchase/delivery')){ ?>
          <a onclick="$('#form').attr('action', '<?php echo $invoice; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button"><?php echo $button_invoice; ?></a>
           <?php } ?>
            <?php if ($this->user->hasPermission('insert', 'purchase/delivery')){ ?>
          <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
             <?php } ?> 
          <?php if ($this->user->hasPermission('delete', 'purchase/delivery')){ ?>
          <a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><?php echo $button_delete; ?></a>
         <?php } ?>
      </div>
     <?php } ?>
    </div>
    <div class="content">
      <form action="" method="post" enctype="multipart/form-data" id="form">
           <table class="form">
        <tr>
          <td class="left">
              <?php echo $entry_warehouse; ?>
            <select name="filter_warehouse">
              <option value="0"><?php echo $text_all_warehouse; ?></option>
              <?php foreach ($warehouses as $warehouse) { ?>
              <?php if ($warehouse['warehouse_id'] == $filter_warehouse) { ?>
              <option value="<?php echo $warehouse['warehouse_id']; ?>" selected="selected"><?php echo $warehouse['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $warehouse['warehouse_id']; ?>"><?php echo $warehouse['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
           </td>
          <td class="left">
              <?php echo $entry_supplier; ?>
            <select name="filter_supplier">
                <option value="0"><?php echo $text_all_supplier; ?></option>
              <?php foreach ($suppliers as $supplier) { ?>
              <?php if ($supplier['supplier_id'] == $filter_supplier) { ?>
              <option value="<?php echo $supplier['supplier_id']; ?>" selected="selected"><?php echo $supplier['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $supplier['supplier_id']; ?>"><?php echo $supplier['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
           </td>
          <td><?php echo $entry_date_start; ?>
            <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" /></td>
          <td><?php echo $entry_date_end; ?>
            <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" /></td>
         
          <td style="text-align: right;"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
        </tr>
      </table>
      <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="right">
                <a><?php echo $column_index; ?></a>
              </td>
              <td class="left"><?php if ($sort == 'purchase_id') { ?>
                <a href="<?php echo $sort_purchase_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_purchase_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_purchase_id; ?>"><?php echo $column_purchase_id; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'reference_no') { ?>
                <a href="<?php echo $sort_reference_no; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_reference_no; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_reference_no; ?>"><?php echo $column_reference_no; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'quantity') { ?>
                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'total') { ?>
                <a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_total; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_total; ?>"><?php echo $column_total; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'date_added') { ?>
                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'date_modified') { ?>
                <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
              <tr class="filter">
                  <td></td>
                  <td></td>
                  <td><input type="text" name="filter_purchase_id" value="<?php echo $filter_purchase_id; ?>" /></td>
                  <td><input type="text" name="filter_reference_no" value="<?php echo $filter_reference_no; ?>" /></td>
                  <td class="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" /></td>
                  <td class="right"><input type="text" name="filter_total" value="<?php echo $filter_total; ?>" /></td>
                  <td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" size="12" class="date" /></td>
                  <td><input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" size="12" class="date" /></td>
                  <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
              </tr>
            <?php if ($purchases) { ?>
            <?php foreach ($purchases as $purchase) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($purchase['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $purchase['purchase_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $purchase['purchase_id']; ?>" />
                <?php } ?></td>
              <td class="right"><?php echo $purchase['index']; ?></td>
              <td class="left"><?php echo $purchase['purchase_id']; ?></td>
              <td class="left"><?php echo $purchase['reference_no']; ?></td>
              <td class="right"><?php echo $purchase['quantity']; ?></td>
              <td class="right"><?php echo $purchase['total']; ?></td>
              <td class="left"><?php echo $purchase['date_added']; ?></td>
              <td class="left"><?php echo $purchase['date_modified']; ?></td>
              <td class="right">
                  <?php if ($this->user->hasPermission('modify', 'purchase/delivery')){ ?>
                  <?php foreach ($purchase['action'] as $action){ ?>
                  <?php if($action['index']==0){ ?>
                   <?php if ($this->user->hasPermission('invoice', 'purchase/delivery')){ ?>
                  <a onclick="return openWin('<?php echo $action['href']; ?>','Receipt No',1000,600);return false;" title="<?php echo $action['text']; ?>"><i class="fa fa-search-plus fa-2x"></i></a>
                 <?php } ?>
                  <?php }elseif($action['index']==1){ ?>
                  <?php if ($this->user->hasPermission('edit', 'purchase/delivery')){ ?>
                <a href="<?php echo $action['href'];?>" title="<?php echo $action['text']; ?>"><i class="fa fa-pencil-square-o fa-2x"></i></a> 
                  <?php } ?>
                <?php }elseif($action['index']==2){ ?>
                 <?php if ($this->user->hasPermission('delete', 'purchase/delivery')){ ?>
                  <a onclick="$('#form').attr('action', '<?php echo $action['href']; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" title="<?php echo $action['text']; ?>"><i class="fa fa-times-circle-o fa-2x"></i></a> 
                 <?php } ?>
                  <?php }elseif($action['index']==3){ ?>
                   <?php if ($this->user->hasPermission('comfirm', 'purchase/delivery')){ ?>
                   <a href="<?php echo $action['href']; ?>" title="<?php echo $action['text']; ?>"><i class="fa fa-eject fa-2x"></i></a> 
                    <?php } ?>
                   <?php } ?>
                  <?php } ?>
                    <?php } ?>
                  
                  
              </td>
               </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="9"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date-start').datepicker({dateFormat: 'dd/mm/yy'});
	
	$('#date-end').datepicker({dateFormat: 'dd/mm/yy'});
});
//--></script> 
<script type="text/javascript">
    function openWin(url, title, w, h){
 
    // Fixes dual-screen position  Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

    var left = ((screen.width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((screen.height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
  }
</script>
</script>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=purchase/purchase&token=<?php echo $token; ?>';
	
        var filter_supplier = $('select[name=\'filter_supplier\']').attr('value');
        if (filter_supplier) {
		url += '&filter_supplier=' + encodeURIComponent(filter_supplier);
	}
        
        var filter_warehouse = $('select[name=\'filter_warehouse\']').attr('value');
	if (filter_warehouse) {
		url += '&filter_warehouse=' + encodeURIComponent(filter_warehouse);
	}
       var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}
        
        var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
        var filter_reference_no = $('input[name=\'filter_reference_no\']').attr('value');
	if (filter_reference_no) {
		url += '&filter_reference_no=' + encodeURIComponent(filter_reference_no);
	}
        
        var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
        if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}	
	
	var filter_total = $('input[name=\'filter_total\']').attr('value');

	if (filter_total) {
		url += '&filter_total=' + encodeURIComponent(filter_total);
	}	
	
	var filter_date_added = $('input[name=\'filter_date_added\']').attr('value');
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
	
	var filter_date_modified = $('input[name=\'filter_date_modified\']').attr('value');
	
	if (filter_date_modified) {
		url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
	}
      
	location = url;
}
//--></script>  
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_supplier\']').autocomplete({
	delay: 500,
	source: function(request, response) {
        
		$.ajax({
			url: 'index.php?route=purchase/purchase/autocomplete&token=<?php echo $token; ?>&filter_supplier=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.supplier,
						value: item.purchase_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_supplier\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_warehouse\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=purchase/purchase/autocomplete&token=<?php echo $token; ?>&filter_warehouse=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.warehouse,
						value: item.purchase_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_warehouse\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_reference_no\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=purchase/purchase/autocomplete&token=<?php echo $token; ?>&filter_reference_no=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.reference_no,
						value: item.purchase_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_reference_no\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script>
<?php echo $footer; ?>