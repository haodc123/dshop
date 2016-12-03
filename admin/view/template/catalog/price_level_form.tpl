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
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td>
              <input type="text" name="name" value="<?php echo $name;?>" />
             </td>
          </tr>
          
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
          </tr>
        </table>
        <table id="price-value" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_name; ?></td>
              <td class="left"><?php echo $entry_price_min; ?></td>
              <td class="right"><?php echo $entry_price_max; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $price_level_value_row = 0; ?>
          <?php foreach ($price_level_values as $price_level_value) { ?>
          <tbody id="price-value-row<?php echo $price_level_value_row; ?>">
              <tr>
                  <td class="left">
                      <input type="hidden" name="price_level_value[<?php echo $price_level_value_row; ?>][price_level_value_id]" value="<?php echo $price_level_value['price_level_value_id']; ?>" />
                      <input type="text" name="price_level_value[<?php echo $price_level_value_row; ?>][name]" value="<?php echo $price_level_value['name']; ?>" />
                     
                  </td>
                  <td class="left">
                       <input type="text" name="price_level_value[<?php echo $price_level_value_row; ?>][min]" value="<?php echo $price_level_value['min']; ?>" />
                     
                   </td>
                  <td class="left"> 
                      <input type="text" name="price_level_value[<?php echo $price_level_value_row; ?>][max]" value="<?php echo $price_level_value['max']; ?>" />
                  </td>
                  <td class="left"><a onclick="$('#price-value-row<?php echo $price_level_value_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
          </tbody>
           <?php $price_level_value_row++; ?>
          <?php } ?>
         
         
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addOptionValue();" class="button"><?php echo $button_add; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--

var price_level_value_row = '<?php echo $price_level_value_row; ?>';

function addOptionValue() {
	html  = '<tbody id="option-value-row' + price_level_value_row + '">';
	html += '  <tr>';	
        html += '    <td class="left"><input type="hidden" name="price_level_value[' + price_level_value_row + '][price_level_value_id]" value="" />';
	
	html += '<input type="text" name="price_level_value[' + price_level_value_row + '][name]" value="" />';
   
	html += '    </td>';
        html += '  <td class="left">';
        html += ' <input type="text" name="price_level_value[' + price_level_value_row + '][min]" value="" />';
           html += '         </td>';
            html += '        <td class="left"> ';
            html += '            <input type="text" name="price_level_value[' + price_level_value_row + '][max]" value="" />';
            html += '        </td>';
            html += '    <td class="left"><a onclick="$(\'#price-value-row' +  price_level_value_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
           
         
	html += '  </tr>';	
    html += '</tbody>';
	
	$('#price-value tfoot').before(html);
	
	price_level_value_row++;
}
//--></script> 

<?php echo $footer; ?>