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
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <?php if ($this->user->hasPermission('modify', 'catalog/product')){ ?>
       <div class="buttons"><!--<a onclick="return openWin('<?php echo $open;?>','<?php echo $button_insert_new; ?>',1000,600);" class="button"><?php echo $button_insert_new; ?></a>-->
            <?php if ($this->user->hasPermission('export', 'catalog/product')){ ?>
           <a href="<?php echo $export; ?>" class="button"><?php echo $button_export; ?></a>
           <?php } ?>
           <?php if ($this->user->hasPermission('insert', 'catalog/product')){ ?>
                <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
          <?php } ?>
           <?php if ($this->user->hasPermission('coppy', 'catalog/product')){ ?>
          <a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a>
          <?php } ?> 
          <?php if ($this->user->hasPermission('delete', 'catalog/product')){ ?>
          <a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a>
          <?php } ?>
           <?php if ($this->user->hasPermission('barcode', 'catalog/product')){ ?>
          <a onclick="$('#form').attr('action', '<?php echo $barcode; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button"><?php echo $button_barcode; ?></a>
          <?php } ?>
       </div>
        <?php } ?>
    
    </div>
    <div class="content">
     </form>
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td><?php echo $column_index; ?></td>
              <td class="left"><?php if ($sort == 'p.product_id') { ?>
                <a href="<?php echo $sort_product_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_product_id; ?>"><?php echo $column_product_id; ?></a>
                <?php } ?></td>
              <td class="center"><?php echo $column_image; ?></td>
              <td class="left"><?php if ($sort == 'pd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.mcs') { ?>
                <a href="<?php echo $sort_mcs; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_mcs; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_mcs; ?>"><?php echo $column_mcs; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.mc') { ?>
                <a href="<?php echo $sort_mc; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_mc; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_mc; ?>"><?php echo $column_mc; ?></a>
                <?php } ?></td>
             <td class="left"><?php if ($sort == 'p.model') { ?>
                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.price') { ?>
                <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'p.quantity') { ?>
                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?></td>
               <td class="left"><?php if ($sort == 'p.display') { ?>
                <a href="<?php echo $sort_display; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_display; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_display; ?>"><?php echo $column_display; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.status') { ?>
                <a href="<?php echo $sort_status;?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status;?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right action"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
               <td><input type="text" name="filter_mcs" value="<?php echo $filter_mcs; ?>" /></td>
               <td><input type="text" name="filter_mcs" value="<?php echo $filter_mc; ?>" /></td>
              <td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>
               <td align="left"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
              <td align="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>
              <td><select name="filter_display">
                  <option value="*"></option>
                  <?php if ($filter_display) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_display) && !$filter_display) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
            </tr>
            <?php if ($products) { ?>
            <?php $i=0; foreach ($products as $product) { $i++; ?>
            <tr <?php if ($i%2==0){ ?> class="color"<?php } ?>>
              <td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?>
              </td>
              <td class="left"><?php echo $product['index']; ?></td>
              <td class="left"><?php echo $product['product_id']; ?></td>
              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>"/></td>
              <td class="left"><?php echo $product['name']; ?>(<span style="color:<?php echo $product['color_code']; ?>"> <?php echo $product['color']; ?></span>/<?php echo $product['size']; ?>)
              </td>
               <td class="left"><?php echo $product['mcs']; ?></td>
                <td class="left"><?php echo $product['mc']; ?></td>
              <td class="left"><?php echo $product['model']; ?></td>
                <td class="left"><?php if ($product['special']) { ?>
                <span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
                <span style="color: #b00;"><?php echo $product['special']; ?></span>
                <?php } else { ?>
                <?php echo $product['price']; ?>
                <?php } ?></td>
              <td class="right"><?php if ($product['quantity'] <= 0) { ?>
                <span style="color: #FF0000; font-size: 16px;"><?php echo $product['quantity']; ?></span>
                <?php } elseif ($product['quantity'] <= 5) { ?>
                <span style="color: #FFA500; font-size: 16px;"><?php echo $product['quantity']; ?></span>
                <?php } else { ?>
                <span style="color: #008000;"><?php echo $product['quantity']; ?></span>
                <?php } ?></td>
              <td class="left">
                  
                  <?php foreach ($product['display'] as $display) { ?>
                   <?php if ($this->user->hasPermission('display', 'catalog/product')){ ?>
                  <?php if($display['display']){ ?>
                  <a  href="<?php echo $display['href'];?>" title="<?php echo $display['text'];?>"><i class="fa fa-check-square-o fa-2x"></i></a>
                  <?php } else { ?>
                  <a  href="<?php echo $display['href'];?>" title="<?php echo $display['text'];?>" ><i class="fa fa-square-o fa-2x"></i></a>
                  <?php } ?>
                   <?php }else { ?>
                    <?php echo $display['text'];?>
                   <?php } ?>
                  <?php } ?>
              </td>
              
              <td class="left">
                  <?php foreach ($product['status'] as $status) { ?>
                   <?php if ($this->user->hasPermission('status', 'catalog/product')){ ?>
                  <?php if($status['status']){ ?>
                  <a  href="<?php echo $status['href'];?>" title="<?php echo $status['text'];?>"><i class="fa fa-check-square-o fa-2x"></i></a>
                  <?php } else { ?>
                  <a  href="<?php echo $status['href'];?>" title="<?php echo $status['text'];?>" ><i class="fa fa-square-o fa-2x"></i></a>
                  <?php } ?>
                  <?php }else { ?>
                  <?php echo $display['text'];?>
                    <?php } ?>
                  <?php } ?>
              </td>
              <td class="right">
                  <?php if ($this->user->hasPermission('modify', 'catalog/product')){ ?>
                  <?php foreach ($product['action'] as $action) { ?>
                  <?php if ($this->user->hasPermission('edit', 'catalog/product')){ ?>
                  <?php if($action['index']==0){ ?>
                   <a href="<?php echo $action['href']; ?>" title="<?php echo $action['text']; ?>"><i class="fa fa-pencil-square-o fa-2x"></i></a> 
                  <?php } ?>
                   <?php } ?>
                  <?php if ($this->user->hasPermission('barcode', 'catalog/product')){ ?>
                  <?php if($action['index']==1){ ?>
                  <a onclick="return openWin('<?php echo $action['href']; ?>','Barcode',1000,600);return false;" title="<?php echo $action['text']; ?>"><i class="fa fa-barcode fa-2x"></i></a>
                  <?php } ?>
                   <?php } ?>
                  <?php if ($this->user->hasPermission('delete', 'catalog/product')){ ?>
                  <?php if($action['index']==2){ ?>
                  <a onclick="return deleteRow('<?php echo $action['href']; ?>');" title="<?php echo $action['text']; ?>"><i class="fa fa-times-circle-o fa-2x"></i></a>
                  <?php } ?>
                   <?php } ?>
                  <?php } ?>
                  <?php } ?>
              </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="13"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript">
    function openWin(url, title, w, h){
   // myWindow=window.open(url,name,'width=800,height=600');
 //   myWindow.document.close();
 //   myWindow.focus();
     // Fixes dual-screen position                       Most browsers      Firefox
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
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=catalog/product&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
        var filter_mcs = $('input[name=\'filter_mcs\']').attr('value');
	
	if (filter_mcs) {
		url += '&filter_mcs=' + encodeURIComponent(filter_mcs);
	}
       
        var filter_model = $('input[name=\'filter_model\']').attr('value');
	
	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}
        var filter_price = $('input[name=\'filter_price\']').attr('value');
	
	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}
	
	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
	
	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
        var filter_display = $('select[name=\'filter_display\']').attr('value');
	
	if (filter_display != '*') {
		url += '&filter_display=' + encodeURIComponent(filter_display);
	}
	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	delay: 500,
	source: function(request, response) {
        
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_mc\']').autocomplete({
	delay: 500,
	source: function(request, response) {
        
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_mc=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.mc,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_mc\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_mcs\']').autocomplete({
	delay: 500,
	source: function(request, response) {
               
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_mcs=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.mcs,
						value: item.product_id
					}
                                          
				}));
                                  
			}
		});
             
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_mcs\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_model\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

//--></script> 
<script type="text/javascript"><!--
function checkFileSize(id) {
	// See also http://stackoverflow.com/questions/3717793/javascript-file-upload-size-validation for details
	var input, file, file_size;

	if (!window.FileReader) {
		// The file API isn't yet supported on user's browser
		return true;
	}
        input = document.getElementById(id);
	if (!input) {
		// couldn't find the file input element
		return true;
	}
	else if (!input.files) {
		// browser doesn't seem to support the `files` property of file inputs
		return true;
	}
	else if (!input.files[0]) {
		// no file has been selected for the upload
		alert( "<?php echo $error_select_file; ?>" );
		return false;
	}
	else {
		file = input.files[0];
		file_size = file.size;
		<?php if (!empty($post_max_size)) { ?>
		// check against PHP's post_max_size
		post_max_size = <?php echo $post_max_size; ?>;
		if (file_size > post_max_size) {
			alert( "<?php echo $error_post_max_size; ?>" );
			return false;
		}
		<?php } ?>
		<?php if (!empty($upload_max_filesize)) { ?>
		// check against PHP's upload_max_filesize
		upload_max_filesize = <?php echo $upload_max_filesize; ?>;
		if (file_size > upload_max_filesize) {
			alert( "<?php echo $error_upload_max_filesize; ?>" );
			return false;
		}
		<?php } ?>
		return true;
	}
}

function upload() {
	if (checkFileSize('upload')) {
		$('#impform').submit();
	}
}
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
<script type="text/javascript">
    function deleteRow(url){
 
        if (confirm('Are you sure you want to delete this product into the database?')) {
        window.location.href = url;
} else {
  // alert('Delete product successfully');
}
  }
</script>

<?php echo $footer; ?>