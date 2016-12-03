<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" href="view/stylesheet/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="view/stylesheet/open.css" />
<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="view/javascript/jquery/superfish/js/superfish.js"></script>
<script type="text/javascript" src="view/javascript/common.js"></script>
<script type="text/javascript" src="view/javascript/jquery.formatCurrency-1.4.0.min.js"></script>
</head>
<body>
    <div id="container">
        <div class="header_logo">
            <a href="#"><img src="<?php echo $logo; ?>" title="Mitadress" alt="Mitadress" /></a>
        </div>
       <div id="content">
        <div class="box">
            <div class="heading">
            <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons">
                <a onclick="$('#form').submit(); return window.close();" class="button"><?php echo $button_save_close; ?></a>
                <a onclick="$('#form').submit();" class="button"><?php echo $button_save_new; ?></a>
                <a onclick="return window.close();" class="button"><?php echo $button_close; ?></a>
            </div>
        </div>
            <div class="content">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <div class="content">
                      
                        <div class="left-content border">
                            
                                <div id="tab-data">
                                    <table class="form">
                                        <thead>
                                            <tr>
                                                <td colspan="2">Data</td>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td><span class="required">*</span> <?php echo $entry_model; ?></td>
                                            <td><input type="text" name="model" value="<?php echo $model; ?>"/>
                                        </tr>
                                        <tr>
                                            <td><span class="required">*</span> <?php echo $entry_color; ?></td>
                                            <td>
                                                <select name="color"  style="width: 100px;">
                                                    <?php foreach($colors as $code) { ?>
                                                    <?php if($code['code']==$color) { ?>
                                                    <option value="<?php echo $code['code']; ?>" selected="selected"><?php echo $code['name']; ?></option>
                                                    <?php }else { ?>
                                                    <option value="<?php echo $code['code']; ?>"><?php echo $code['name']; ?></option>
                                                    <?php } ?>
                                                    <?php } ?>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span class="required">*</span> <?php echo $entry_size; ?></td>
                                            <td>
                                                <select name="size" style="width: 100px;">
                                                    <?php foreach($sizes as $code) { ?>
                                                    <?php if($code['code']==$size) { ?>
                                                    <option value="<?php echo $code['code']; ?>" selected="selected"><?php echo $code['name']; ?></option>
                                                    <?php } else { ?>
                                                    <option value="<?php echo $code['code']; ?>"><?php echo $code['name']; ?></option>
                                                    <?php } ?>
                                                    <?php } ?>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_price; ?></td>
                                            <td><input type="text" name="price" value="<?php echo $price; ?>" /></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_keyword; ?></td>
                                            <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
                                        </tr>

                                        <tr>
                                            <td><?php echo $entry_date_available; ?></td>
                                            <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" size="12" class="date" /></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_dimension; ?></td>
                                            <td><input type="text" name="length" value="<?php echo $length; ?>" size="4" />
                                                <input type="text" name="width" value="<?php echo $width; ?>" size="4" />
                                                <input type="text" name="height" value="<?php echo $height; ?>" size="4" /></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_length; ?></td>
                                            <td><select name="length_class_id">
                                                    <?php foreach ($length_classes as $length_class) { ?>
                                                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                                                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                                                    <?php } else { ?>
                                                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                                                    <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_weight; ?></td>
                                            <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_weight_class; ?></td>
                                            <td><select name="weight_class_id">
                                                    <?php foreach ($weight_classes as $weight_class) { ?>
                                                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                                                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                                                    <?php } else { ?>
                                                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                                                    <?php } ?>
                                                    <?php } ?>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_display; ?></td>
                                            <td><select name="display">
                                                    <?php if ($display) { ?>
                                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                    <option value="0"><?php echo $text_disabled; ?></option>
                                                    <?php } else { ?>
                                                    <option value="1"><?php echo $text_enabled; ?></option>
                                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                    <?php } ?>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_status; ?></td>
                                            <td><select name="status">
                                                    <?php if ($status) { ?>
                                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                    <option value="0"><?php echo $text_disabled; ?></option>
                                                    <?php } else { ?>
                                                    <option value="1"><?php echo $text_enabled; ?></option>
                                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                    <?php } ?>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $entry_sort_order; ?></td>
                                            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        <div class="right-content border">
                            <div style="text-align: center;">
                                <div class="image">
                                   <table>
                                       <tr>
                                           <td colspan="2"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                                            <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" /></td>
                                           
                                       </tr>
                                       <tr>
                                           <td><a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a></td>
                                            <td><a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></td>
                                       </tr>
                                   </table>
                                 </div>
                                
                              </div>
                            <div id="list-image">
                                <div class="button-image"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></div>
                               <?php $image_row = 0; ?>
                                <?php foreach ($product_images as $product_image) { ?>
                                <div id="image-row<?php echo $image_row; ?>">
                                    <table>
                                        <tr>
                                            <td class="left" colspan="3">
                                                <div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" width="50" height="50" />
                                                    <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>
                                            </td>
                                            <td>
                                                <a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                                            </td>
                                            <td>
                                                <a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <?php $image_row++; ?>
                                <?php } ?>
                                <div id="add-image"></div>
                            </div>
                    </div>
                    <div id="tab-links" class="bottom-content border">
                        <table class="form">
                            <thead>
                                <tr>
                                    <td colspan="6">
                                        Link
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><?php echo $entry_manufacturer; ?>
                                </td>
                                <td>
                                    <input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" />
                                    <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
                                </td>
                                <td><?php echo $entry_category; ?></td>
                                <td><input type="text" name="category" value="" /></td>
                                <td><?php echo $entry_tag; ?>
                                    <span class="help">(Add tags)</span>
                                </td>
                                <td><input type="text" name="tag" value="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><?php echo $entry_store; ?><br/>
                                    <div class="scrollbox">
                                        <?php $class = 'even'; ?>
                                        <div class="<?php echo $class; ?>">
                                            <?php if (in_array(0, $product_store)) { ?>
                                            <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                                            <?php echo $text_default; ?>
                                            <?php } else { ?>
                                            <input type="checkbox" name="product_store[]" value="0" />
                                            <?php echo $text_default; ?>
                                            <?php } ?>
                                        </div>
                                        <?php foreach ($stores as $store) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div class="<?php echo $class; ?>">
                                            <?php if (in_array($store['store_id'], $product_store)) { ?>
                                            <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                                            <?php echo $store['name']; ?>
                                            <?php } else { ?>
                                            <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                                            <?php echo $store['name']; ?>
                                            <?php } ?>
                                        </div>
                                        <?php } ?>
                                    </div>

                                </td>
                                <td colspan="2"><div id="product-category" class="scrollbox">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($product_categories as $product_category) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div id="product-category<?php echo $product_category['category_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_category['name']; ?><img src="view/image/delete.png" alt="" />
                                            <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                                        </div>
                                        <?php } ?>
                                    </div></td>

                                <td colspan="2">
                                    <div id="product-tag" class="scrollbox">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($product_tags as $product_tag) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div id="product-tag<?php echo $product_tag['tag_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_tag['name']; ?><img src="view/image/delete.png" alt="" />
                                            <input type="hidden" name="product_tag[]" value="<?php echo $product_tag['tag_id']; ?>" />
                                        </div>
                                        <?php } ?>
                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <td><?php echo $entry_filter; ?></td>
                                <td><input type="text" name="filter" value="" /></td>
                                <td><?php echo $entry_download; ?></td>
                                <td><input type="text" name="download" value="" /></td>
                                <td><?php echo $entry_related; ?></td>
                                <td><input type="text" name="related" value="" /></td>
                            </tr>

                            <tr>


                                <td colspan="2">
                                    <div id="product-filter" class="scrollbox">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($product_filters as $product_filter) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div id="product-filter<?php echo $product_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_filter['name']; ?><img src="view/image/delete.png" alt="" />
                                            <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                                        </div>
                                        <?php } ?>
                                    </div></td>

                                <td colspan="2"><div id="product-download" class="scrollbox">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($product_downloads as $product_download) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div id="product-download<?php echo $product_download['download_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_download['name']; ?><img src="view/image/delete.png" alt="" />
                                            <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                                        </div>
                                        <?php } ?>
                                    </div></td>

                                <td colspan="2"><div id="product-related" class="scrollbox">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($product_related as $product_related) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div id="product-related<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_related['name']; ?><img src="view/image/delete.png" alt="" />
                                            <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                                        </div>
                                        <?php } ?>
                                    </div></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="tab-general" class="bottom-content border">
                        <?php foreach ($languages as $language) { ?>
                        <div id="language<?php echo $language['language_id']; ?>">
                            <table class="form">
                                <thead>
                                <tr>
                                    <td colspan="6">
                                       General
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                                    <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" />
                                        <?php if (isset($error_name[$language['language_id']])) { ?>
                                        <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                                        <?php } ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_meta_description; ?></td>
                                    <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_meta_keyword; ?></td>
                                    <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_guide; ?></td>
                                    <td><textarea name="product_description[<?php echo $language['language_id']; ?>][guide]" id="guide<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['guide'] : ''; ?></textarea></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_introduction; ?></td>
                                    <td><textarea name="product_description[<?php echo $language['language_id']; ?>][introduction]" id="introduction<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['introduction'] : ''; ?></textarea></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_description; ?></td>
                                    <td><textarea name="product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea></td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_tag; ?></td>
                                    <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" size="80" /></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <?php } ?>
                    </div>
                </form>
            </div>
        </div>
           </div>
    </div>
</body></html>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('guide<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('introduction<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

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

// Category
$('input[name=\'category\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-category' + ui.item.value).remove();
		
		$('#product-category').append('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category[]" value="' + ui.item.value + '" /></div>');

		$('#product-category div:odd').attr('class', 'odd');
		$('#product-category div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-category div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-category div:odd').attr('class', 'odd');
	$('#product-category div:even').attr('class', 'even');	
});

$('input[name=\'tag\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=seo/tag/autocomplete&token=<?php echo $token; ?>&tag_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.tag_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-tag' + ui.item.value).remove();
		
		$('#product-tag').append('<div id="product-tag' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_tag[]" value="' + ui.item.value + '" /></div>');

		$('#product-tag div:odd').attr('class', 'odd');
		$('#product-tag div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
$('#product-tag div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-tag div:odd').attr('class', 'odd');
	$('#product-tag div:even').attr('class', 'even');	
});


// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-filter' + ui.item.value).remove();
		
		$('#product-filter').append('<div id="product-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_filter[]" value="' + ui.item.value + '" /></div>');

		$('#product-filter div:odd').attr('class', 'odd');
		$('#product-filter div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-filter div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-filter div:odd').attr('class', 'odd');
	$('#product-filter div:even').attr('class', 'even');	
});

// Downloads
$('input[name=\'download\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.download_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-download' + ui.item.value).remove();
		
		$('#product-download').append('<div id="product-download' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_download[]" value="' + ui.item.value + '" /></div>');

		$('#product-download div:odd').attr('class', 'odd');
		$('#product-download div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-download div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-download div:odd').attr('class', 'odd');
	$('#product-download div:even').attr('class', 'even');	
});

// Related
$('input[name=\'related\']').autocomplete({
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
		$('#product-related' + ui.item.value).remove();
		
		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');

		$('#product-related div:odd').attr('class', 'odd');
		$('#product-related div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-related div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-related div:odd').attr('class', 'odd');
	$('#product-related div:even').attr('class', 'even');	
});
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
        html  = '<div  id="image-row' + image_row + '">';
        html += '<div class="image-small">';
	html += '<table>';
        html += '<tr>';
        html += '  <td class="left" colspan="3">';
        html += '      <img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" />';
	html += '  </td>';
        html += '</tr>';
        html += '<tr>';
        html += '  <td class="left">';
        html += '   <a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '   <a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <a onclick="$(\'#image-row' + image_row + '\').remove();"><?php echo $button_remove; ?></a>';
        html += '  </td>';
        html += '</tr>';
	html += '</table>';
	html += '</div>';
	html += '</div>';
	$('#add-image').before(html);
	image_row++;
}
//--></script> 
<script type="text/javascript">
        function RefreshParent() {
            if (window.opener != null && !window.opener.closed) {
                window.opener.location.reload();
            }
        }
        window.onbeforeunload = RefreshParent;
    </script>
