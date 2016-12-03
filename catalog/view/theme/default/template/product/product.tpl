<?php echo $header; ?>
<div class="header_inner">
    <div id="notification"></div>
</div>
<!-- content-begin -->
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <!-- begin product info -->
            <div class="product-info">
                <div class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <!-- begin info left-->
                <?php if ($popup || $images) { ?>
                <div class="product-info-left">
                    <img id="img_01" src='<?php echo $thumb; ?>' data-zoom-image="<?php echo $popup; ?>"/>
                    <div id="gal1">
                        <?php $i=0; foreach ($images as $image) { $i++; ?>
                        <a href="#" data-image="<?php echo $image['thumb']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
                            <?php if($i==count($images)){ ?>
                            <img  class="last" id="img_01" src="<?php echo $image['additional']; ?>" />
                            <?php } else { ?>
                            <img id="img_01" src="<?php echo $image['additional']; ?>" />
                            <?php } ?>
                        </a>
                        <?php } ?>
                    </div>
                </div>
                <?php } ?>
                <!-- end info left-->
                <!-- Begin product info right-->
                <div class="product-info-right">
                    <div class="info-right-content">
                        <h1 class="title"><?php echo $heading_title;?></h1>
                        <div class="product_code">
                            <span>Product code:</span>
                            <span><?php echo $mc;?></span>
                        </div>
                        <?php if ($review_status) { ?>
                        <div class="review">
                            <div class="line"><img src="catalog/view/theme/default/image/star_<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>
                            <div class="product-love-share">
                                <div class="love">
                                     <iframe src="http://www.facebook.com/plugins/like.php?href=http://thoitrangdshop.vn&amp;layout=button_count&amp;show_faces=true&amp;width=450&amp;action=like&amp;font=arial&amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:20px; overflow:hidden;" allowTransparency="true"></iframe>
                                  
                                </div>
                                <div class="share"><!-- AddThis Button BEGIN -->
                                    <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
                                    <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
                                    <!-- AddThis Button END --> 
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        <div id="tabs" class="htabs">
                            <a href="#tab-description"><?php echo $tab_description; ?></a>
                            <a href="#tab-introduction"><?php echo $tab_introduction; ?></a>
                            <?php if ($review_status) { ?>
                            <a href="#tab-review"><?php echo $tab_review; ?></a>
                            <?php } ?>
                        </div>
                        <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
                        <div id="tab-introduction" class="tab-content"><?php echo $introduction; ?></div>
                        <?php if ($review_status) { ?>
                        <div id="tab-review" class="tab-content">
                            <div id="review"></div>
                            <div class="review_form">
                                <h3 class="title"><?php echo $text_write; ?></h3>
                                <table class="form">
                                    <tr><td><?php echo $entry_name; ?></td></tr>
                                    <tr><td><input type="text" name="name" value="" /></td></tr>

                                    <tr><td><?php echo $entry_review; ?></td></tr>
                                    <tr>
                                        <td>
                                            <textarea name="text" rows="3" style="width: 98%;"></textarea>
                                            <span style="font-size: 11px;"><?php echo $text_note; ?></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b><?php echo $entry_rating; ?></b> 
                                            <span><?php echo $entry_bad; ?></span>&nbsp;
                                            <input type="radio" name="rating" value="1" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="2" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="3" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="4" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="5" checked="checked" />
                                            &nbsp;<span><?php echo $entry_good; ?></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <?php echo $entry_captcha; ?>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <input type="text" name="captcha" value="" />
                                            <img src="index.php?route=product/product/captcha" alt="" id="captcha" />
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <div class="buttons">
                                                <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
                                            </div>
                                        </td>
                                    </tr> 
                                </table>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($tags) { ?>
                        <div class="tags">
                            <h4><?php echo $text_tags; ?></h4>
                            <?php foreach ($tags as $tag) { ?>
                            <a class="tag" title="<?php echo $tag['name']; ?>" href="<?php echo $tag['href']; ?>"><?php echo $tag['name']; ?></a>
                            <?php }?>
                        </div>
                        <?php } ?>


                    </div>
                    <div class="info-right">
                        <div class="info-right-box">
                            <div class="review_pro">
                                <div class="review-price">
                                    <?php if($special){ ?>
                                    <span><?php echo $special; ?></span>
                                    <?php } else { ?>
                                    <span><?php echo $price; ?></span>
                                    <?php }  ?>
                                </div>
                            </div>
                            <div class="line_box"></div>
                            <?php if($colors) { ?>
                            <div class="options" id="color">
                                <div class="option">
                                    <h2><?php echo $text_color;?></h2>
                                    <ul>
                                        <?php foreach ($colors as $color) { ?>
                                        <li>
                                            <a <?php if($color['mc']==$mc){ ?> class="current-color" <?php } ?> href="<?php echo $color['href']; ?>" >
                                                <?php echo $color['name']; ?>
                                        </a>
                                    </li>
                                    <?php } ?>
                                </ul>
                            </div>
                            <div class="option" id="option-size">
                                <h2><?php echo $text_size;?></h2>
                                <ul>
                                    <?php foreach ($sizes as $size) { ?>
                                    <li>
                                        <input type="radio" style="display: none;" name="product_id" id="<?php echo $size['product_id'];?>" value="<?php echo $size['product_id'];?>" />
                                        <span class="checksize option<?php echo $size['product_id'];?>" onclick="checksize('<?php echo $size['product_id'];?>');"><?php echo $size['name'];?></span>
                                    </li>
                                    <?php } ?>
                                </ul>
                            </div>

                        </div>
                        <?php } ?>
                        <?php if ($options) { ?>
                        <div class="options">
                            <?php foreach ($options as $option) { ?>
                            <?php if ($option['type'] == 'select') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <select name="option[<?php echo $option['product_option_id']; ?>]">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </option>
                                    <?php } ?>
                                </select>
                            </div>

                            <?php } ?>
                            <?php if ($option['type'] == 'radio') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <h2><?php echo $option['name']; ?>:</h2>
                                <ul>
                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                    <li>
                                        <input style="display: none;" hidden="hidden" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                        <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><span onclick="checkcolor( < ?php echo $option_value['product_option_value_id']; ? > );" class="checkcolor option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></span>
                                            <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </label>
                                    </li>
                                    <?php } ?>
                                </ul>
                            </div>

                            <?php } ?>
                            <?php if ($option['type'] == 'checkbox') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </label>
                                <br />
                                <?php } ?>
                            </div>
                            <br />
                            <?php } ?>
                            <?php if ($option['type'] == 'image') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <h2><?php echo $option['name']; ?>:</h2>
                                <ul class="option-image">
                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                    <li>
                                        <input style="display: none;" hidden="hidden"  type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                        <label style="display: none;" hidden="hidden" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label>
                                        <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                            <span  class="checksize option-value-<?php echo $option_value['product_option_value_id']; ?>" onclick="checksize( < ?php echo $option_value['product_option_value_id']; ? > );"><?php echo $option_value['name']; ?></span>
                                            <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </label>
                                    </li>
                                    <?php } ?>
                                </ul>
                            </div>

                            <?php } ?>
                            <?php if ($option['type'] == 'text') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                            </div>
                            <br />
                            <?php } ?>
                            <?php if ($option['type'] == 'textarea') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                            </div>
                            <br />
                            <?php } ?>
                            <?php if ($option['type'] == 'file') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                            </div>
                            <br />
                            <?php } ?>
                            <?php if ($option['type'] == 'date') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                            </div>
                            <br />
                            <?php } ?>
                            <?php if ($option['type'] == 'datetime') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                            </div>
                            <br />
                            <?php } ?>
                            <?php if ($option['type'] == 'time') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">

                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
                            </div>
                            <br />
                            <?php } ?>
                            <?php } ?>
                        </div>
                        <?php } ?>

                        <div class="product-quantity">
                            <h2>Quantity</h2>
                            <input type='button' value='-' class='qtyminus' field='quantity' />
                            <input type='text' name="quantity" readonly="readonly" value='1' class='qty' />
                            <input type='button' value='+' class='qtyplus' field='quantity' />
                        </div>
                        <div class="line_box"></div>
                        <div class="ad_to">
                            <div class="ad-to-cart">
                                <input type="button" value="Add to bag" class="button-cart"/>
                            </div>
                            <div class="ad-to-wishlist">
                             <!--   <input onclick="addToWishList($('input[name=\'product_id\']:checked').val());" type="button" value=""/>-->
                             <input id="button-wishlist" type="button" value=""/>
                            </div>
                        </div>
                        <div class="line_box"></div>
                        <div class="infomation">
                            <ul>
                                <li><span class="icon_1"></span><a href="">Easy Returns & Exchanges</a></li>
                                <li><span class="icon_2"></span><a href="">Shipping Information</a></li>
                                <li><span class="icon_3"></span><a href="">24/7 Customer Care</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <?php echo $content_bottom;?>

    </div>
</div>
</div>
<!-- content-end -->
<?php echo $footer; ?>
<style>
.main-dialog-class .ui-widget-header{ display:none;}
.main-dialog-class .ui-widget-content{ background-image:none; background-color: #fff; border:none; padding:20px; height:220px; text-align: center;}
.ui-widget-overlay{ background-image:none; background-color: #fff; }
.ui-dialog .ui-dialog-buttonpane{ margin:0px;}
.ui-dialog{ padding:0px;
           -webkit-box-shadow: 0px 0px 20px rgba(50, 50, 50, 0.2), 0px 0px 20px rgba(50, 50, 50, 0.1); -moz-box-shadow: 0px 0px 20px rgba(50, 50, 50, 0.2), 0px 0px 20px rgba(50, 50, 50, 0.1); box-shadow:  0px 0px 20px rgba(50, 50, 50, 0.2), 0px 0px 20px rgba(50, 50, 50, 0.1);
           
}
.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset{ text-align: center; float:none;}
.ui-dialog .ui-dialog-buttonpane{ padding:0px; height: 50px;}
.ui-dialog .ui-dialog-buttonpane button{ margin:0px;}
.ui-button {
    display: inline-block;
    overflow: visible;
    padding: 0;
    position: relative;
    text-align: center;
    text-decoration: none !important;
    
    
    background-color: #E76076;
    border: medium none;
    cursor: pointer;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
    font-weight: bold;
    line-height: 12px;
}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default{
    background-image: none;
     background-color: #EE314F;
     border:none;
     color: #FFFFFF;
     width:100px;
       border-radius: 5px 5px 5px 5px;
    -moz-border-radius:  5px 5px 5px 5px;
    -webkit-border-radius:  5px 5px 5px 5px;
    -ms-border-radius:  5px 5px 5px 5px;
    -o-border-radius:  5px 5px 5px 5px;
}
.content_dialog{
    font-size:11px;
    text-align: center;
    color: #737373; }
.content_dialog p{
    padding-bottom: 1em;
    margin: 0px;
}
h2{ 
    
    color: #EE314F;
    font-size: 18px;
    font-weight: bold;
    }
</style>
<script type="text/javascript">
    var currentImage;
    var currentIndex = -1;
    var interval;
    function showImage(index) {
        if (index < $('#bigPic img').length) {
            var indexImage = $('#bigPic img')[index]
            if (currentImage) {
                if (currentImage != indexImage) {
                    $(currentImage).css('z-index', 2);

                    $(currentImage).fadeOut(250, function() {

                        $(this).css({'display':'none','z-index':1})
                    });
                }
            }
            $(indexImage).css({'display':'block', 'opacity':1});
            currentImage = indexImage;
            currentIndex = index;
            $('#thumbs li').removeClass('active');
            $($('#thumbs li')[index]).addClass('active');
        }
    }

    function showNext() {
        var len = $('#bigPic img').length;
        var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
        showImage(next);
    }



    $(document).ready(function() {

        showNext(); //loads first image
        $('#thumbs li').click(function(e) {
            var count = $(this).attr('rel');
            showImage(parseInt(count) - 1);
        });
    });


</script>
<script type="text/javascript"><!--
$('.button-cart').bind('click', function() {
        if ($("input[name='product_id']").is(':checked')) {
            $.ajax({
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
                dataType: 'json',
                success: function(json) {
                    $('.success, .warning, .attention, information, .error').remove();
                    if (json['error']) {
                        if (json['error']['option']) {
                            for (i in json['error']['option']) {
                                $('#option-' + i).after('<span class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['option'][i] + '</span>');
                                $('html, body').animate({scrollTop: 200}, 'slow');
                            }
                        }
                    }
                    if (json['error_warning'] === true) {
                        $('.success, .warning, .attention, information, .error').remove();
                    } else {
                        $('#option-size').after('<span class="error"><i class="fa fa-exclamation-triangle"></i> You have reached the customer limit for this size. </span>');
                        $('html, body').animate({scrollTop: 200}, 'slow');
                    }

                    //	if (json['success']) {
                        
                    html = '';
                    html += ' <div id="cartview">';
                    html += '    <div id="cartview-content">';
                    html += '<ul class="items">';
                    for (i = 0; i < json['products'].length; i++) {
                        product = json['products'][i];
                        if (i === json['products'].length - 1) {
                            html += ' <li  style="background-color:#CCCCCC;" >';
                        } else {
                            html += ' <li>';
                        }

                        html += ' <a href="' + product['href'] + '"> <img alt="" src="' + product['thumb'] + '"></a>';
                        html += ' <div class="prod_details">';
                        html += ' <strong>' + product['name'] + ':' + product['mc'] + '</strong>';
                        html += '<dl>';
                        html += '  <dt>Color:</dt> <dd>' + product['color'] + '</dd>';
                        html += '  <dt>Size:</dt> <dd>' + product['size'] + '</dd>';
                        for (j = 0; j < product['option'].length; j++) {
                            option = product['option'][j];
                            html += '  <dt>' + option['name'] + '</dt> <dd>' + option['value'] + '</dd>';
                        }
                        html += '  <dt>Quantity:</dt> <dd>' + product['quantity'] + '</dd>';
                        html += '</dl>';
                        html += ' <div class="price">  ' + product['total'] + '</div>';
                        html += '</li>';
                    }
                    html += '</ul>';
                    html += '<div class="totals">';
                    html += '<dl>';
                    for (i = 0; i < json['totals'].length; i++) {
                        totals = json['totals'][i];
                        html += '<dt>' + totals['title'] + '</dt> <dd>' + totals['text'] + '</dd>';
                    }
                    html += '</dl>';
                    html += '</div>';
                    html += '</div>';
                    html += '<div class="action">';
                    html += '<a class="button checkout" href="' + json['checkout'] + '"><i class="fa fa-shopping-cart fa-lg"></i> Checkout</a>';
                    html += '</div>';
                    html += '</div>';
                    $('#cartview').remove();
                    $('#cart').after(html);
                    $('#cart-quantity').html(json['total_quantity']);
                    $('#cartview').css('visibility', 'visible');
                    $('#cartview').slideDown('slow', function() {
                        var self = this;
                        setTimeout(function() {
                            $(self).slideUp('slow', function() {
                                $('#cartview').css('visibility', '');
                                $('#cartview').css('display', '');
                            });
                        }, 2500);
                    });
                    //}
                }
            });
        } else {
            $('.success, .warning, .attention, information, .error').remove();
            $('#option-size').after('<span class="error"><i class="fa fa-exclamation-triangle"></i> Please select a Size.</span>');
            $('html, body').animate({scrollTop: 200}, 'slow');
        }

    });
//--></script>


<script type="text/javascript">

    jQuery(document).ready(function() {
        // This button will increment the value
        $('.qtyplus').click(function(e) {
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            fieldName = $(this).attr('field');
            // Get its current value
            var currentVal = parseInt($('input[name=' + fieldName + ']').val());
            // If is not undefined
            if (!isNaN(currentVal)) {
                // Increment
                $('input[name=' + fieldName + ']').val(currentVal + 1);
            } else {
                // Otherwise put a 0 there
                $('input[name=' + fieldName + ']').val(0);
            }
        });
        // This button will decrement the value till 0
        $(".qtyminus").click(function(e) {
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            fieldName = $(this).attr('field');
            // Get its current value
            var currentVal = parseInt($('input[name=' + fieldName + ']').val());
            // If it isn't undefined or its greater than 0
            if (!isNaN(currentVal) && currentVal > 1) {
                // Decrement one
                $('input[name=' + fieldName + ']').val(currentVal - 1);
            } else {
                // Otherwise put a 0 there
                $('input[name=' + fieldName + ']').val(1);
            }
        });
    });
</script>
<script type="text/javascript">
    function checksize(product_id) {
        document.getElementById(product_id).checked = true;
        $(".current-size").removeClass("current-size");
        $(".option" + product_id).addClass("current-size");
    }
</script>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			
$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
$('#button-review').bind('click', function() {

            
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=' + $('input[name=\'product_id\']:checked').val(),
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			//$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
                        if (data['error']) {
                                var text='';
                                //$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
                               if ( data['error']['error_name']) {
                                    $('input[name=\'name\']').css({border:'1px solid #E76076'});
                                    text +='<p>' + data['error']['error_name'] + '</p>';
                               }
                                if (data['error']['error_text']) {
                                   $('textarea[name=\'text\']').css({border:'1px solid #E86B7F'});
                               
                                  text += '<p>' + data['error']['error_text'] + '</p>';
                               }
                                if (data['error']['error_rating']) {
                                   $('input[name=\'rating\']').css({border:'1px solid #E86B7F'});
                                     text += '<p>' + data['error']['error_rating'] + '</p>';
                               
                               }
                                 if (data['error']['error_captcha']) {
                                   $('input[name=\'captcha\']').css({border:'1px solid #E86B7F'});
                                    text += '<p>' + data['error']['error_captcha'] + '</p>';
                               }
                         htmll='';
                         htmll+='<div style="display:none;" id="dialog_err" title="Basic dialog">';
                         htmll+='<h2>Write a review</h2>';
                         htmll+='<i class="fa fa-exclamation-triangle fa-2x"></i>';
                         htmll+='  <div class="content_dialog">';
                         htmll+=  text;
                         htmll+=' </div>';
                         htmll+='</div>';
                                $('body').after(htmll);
                                $('#dialog_err').dialog({
                                        buttons: {
                                        "Ok": function(){
                                          $(this).dialog("close"); 
                                   }
                                    },
                                          create: function(event, ui) {
                $(event.target).parent().css('position', 'fixed');
            },
                    resizeStop: function(event, ui) {
                    var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                         (Math.floor(ui.position.top) - $(window).scrollTop())];
                    $(event.target).parent().css('position', 'fixed');
                    $('#dialog_err').dialog('option','position',position);
            },
                                    title: 'Detalhes do produto',
                                    modal: true,
                                    resizable: false,
                                    width: 300,
                                    height: 220,
                                    closeText: 'fechar',
                                    draggable: true,
                                    show: 'fade',
                                    hide: 'fade',
                                    dialogClass: 'main-dialog-class'
		});
                                }
			if (data['success']) {
                         html='';
                         html+='<div style="display:none;" id="dialog_success" title="Basic dialog">';
                         html+='<h2>Write a review</h2>';
                         html+='<i class="fa fa-exclamation-triangle fa-2x"></i>';
                         html+='  <div class="content_dialog">';
                         html+=  data['success'];
                         html+=' </div>';
                                html+='</div>';
                                $('body').after(html);
                                $('#dialog_success').dialog({
                                        buttons: {
                                        "Ok": function(){
                                          $(this).dialog("close"); 
                                            
                                $('input[name=\'name\']').val('');
                                $('textarea[name=\'text\']').val('');
				//$('input[name=\'rating\']:checked').attr('checked','');
				$('input[name=\'captcha\']').val('');
                                
                                $('textarea[name=\'text\']').css({border:'1px solid #CCCCCC'});
                                $('input[name=\'captcha\']').css({border:'1px solid #CCCCCC'});
                                $('input[name=\'name\']').css({border:'1px solid #CCCCCC'});
                                    }
                                    },
                                            create: function(event, ui) {
                $(event.target).parent().css('position', 'fixed');
            },
                    resizeStop: function(event, ui) {
                    var position = [(Math.floor(ui.position.left) - $(window).scrollLeft()),
                         (Math.floor(ui.position.top) - $(window).scrollTop())];
                    $(event.target).parent().css('position', 'fixed');
                    $('#dialog_success').dialog('option','position',position);
            },
                                        
                                    title: 'Detalhes do produto',
                                    modal: true,
                                    resizable: false,
                                    width: 300,
                                    height: 240,
                                    closeText: 'fechar',
                                    draggable: true,
                                    show: 'fade',
                                    hide: 'fade',
                                    dialogClass: 'main-dialog-class'
		
        });
			}
                       
		}
	});
});
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $("#tabs a").tabs();
    });
    </script>
    
<script type="text/javascript">
$(document).ready(function () {
   //initiate the plugin and pass the id of the div containing gallery images
    $("#img_01").elevateZoom({
            gallery:'gal1', 
            borderSize: 1,
            easing : true,
            scrollZoom : false,
            lensSize:100,
            tintColour:'#333',
            zoomWindowWidth:401,
            zoomWindowHeight:501,
            lensFadeIn:200,
            zoomWindowFadeIn:200,
            zoomTintFadeIn:200,
            zoomWindowPosition: 1,
            zoomWindowOffetx: 10,
            cursor: 'pointer',
            galleryActiveClass: 'active',
            imageCrossfade: true,
            loadingIcon: 'http://mitadress.com/spinner.gif'
}); 

    //pass the images to Fancybox
    $("#img_01").bind("click", function(e) {  
    var ez =   $('#img_01').data('elevateZoom');	
        $.fancybox(ez.getGalleryList());
    return false;
});
}); 
</script>
<script type="text/javascript"><!--
$('#button-wishlist').bind('click', function() {
        if ($("input[name='product_id']").is(':checked')) {
           $.ajax({
                url: 'index.php?route=account/wishlist/add',
                type: 'post',
                data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
                dataType: 'json',
                success: function(json) {
                        $('.success, .warning, .attention, .information, .error').remove();
						
                        if (json['success']) {
                              //  $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
                                $('.success').fadeIn('slow');
				
                                $('#wishlist-total').html(json['total']);
				
                                $('html, body').animate({ scrollTop: 0 }, 'slow');
                        }	
                }
        });
        } else {
            $('.success, .warning, .attention, information, .error').remove();
            $('#option-size').after('<span class="error"><i class="icon-warning-sign"></i> Please select a Size.</span>');
            $('html, body').animate({scrollTop: 200}, 'slow');
        }

    });
//--></script>



