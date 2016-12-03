<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <div id="content">
                <div class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <div class="wishlist-info">
                    <div class="wishlist-info-loadding">
                        <td colspan="6" class="loading">
                            <div id="loading" style="display: none;"><img alt="" src="catalog/view/theme/default/Images/Mita/icon/loading.gif"></div>
                        </td>
                    </div>
                    <table id=cart-table >
                        <thead>
                            <tr>
                                <td class="image"><?php echo $column_image; ?></td>
                                <td class="name"><?php echo $column_name; ?></td>
                                <td class="model"><?php echo $column_model; ?></td>
                                <td class="stock"><?php echo $column_stock; ?></td>
                                <td class="price"><?php echo $column_price; ?></td>
                                <td class="action"><?php echo $column_action; ?></td>
                            </tr>
                        </thead>

                        <tbody id="wishlist-body">
                            <?php foreach ($products as $product) { ?>
                            <tr id="wishlist-row_<?php echo $product['product_id']; ?>"> 
                                <td class="image"><?php if ($product['thumb']) { ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                    <?php } ?></td>
                                <td class="name">
                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    <div>
                                        <small><span><?php echo $text_product_code;?></span> <?php echo $product['mc']; ?></small><br />
                                        <small><span><?php echo $text_color;?></span> <?php echo $product['color']; ?></small><br />
                                        <small><span><?php echo $text_size;?></span> <?php echo $product['size']; ?></small><br />
                                    </div>
                                </td>
                                <td class="model"><?php echo $product['model']; ?></td>
                                <td class="stock"><?php echo $product['stock']; ?></td>
                                <td class="price"><?php if ($product['price']) { ?>
                                    <div class="price">
                                        <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                        <?php } else { ?>
                                        <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
                                        <?php } ?>
                                    </div>
                                    <?php } ?></td>
                                <td class="action delete" id="remove_<?php echo $product['product_id']; ?>">
                                    <a title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');"><span class="fa fa-shopping-cart fa-lg"></span></a>&nbsp;&nbsp;
                                    <!-- <a  title="<?php echo $button_remove; ?>"href="<?php echo $product['remove']; ?>"><i class="remove fa fa-times-circle fa-lg" data-row="1"></i></a>-->
                                    <a title="<?php echo $button_remove; ?>"><i class="remove fa fa-times-circle fa-lg" data-row="<?php echo $product['product_id']; ?>" data-default="<?php echo $product['key']; ?>"></i></a>
                                </td>
                            </tr>

                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <div class="right"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
    jQuery(document).ready(function() {
        // This button will increment the value
        $('.remove').click(function(e) {
            e.preventDefault();
            key = $(this).attr('data-default');
            row = $(this).attr('data-row');
            $.ajax({
                url: 'index.php?route=account/wishlist/remove',
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
                     $('#wishlist-row_' + row).hide(200, function() {
                          $(this).remove();
                      });
                    if(json['empty']) {
                            html = '';
                            html+= '    <tr>';
                            html+= '      <td colspan="6" class="empty">'+json['empty']+'</td>';
                            html+= '   </tr>';
                            $('#wishlist-body').html(html);
                  }
                   $('#wishlist-total').html(json['total']);
                 
                 }});


        });
    });
</script>