<!-- footer-begin -->
<div class="footer_outer">
    <div class="footer_inner">
        <div class="footer_contact">
            <div class="contact_info">
                <strong>Follow us on</strong>
                <a href="javascript:void(0);" title="">
                    <i class="fa fa-facebook-square fa-2x" style="color:#3B5998;"></i>
                </a>
                <a href="javascript:void(0);"  title="">
                <i class="fa fa-tumblr-square fa-2x" style="color:#019AD2;"></i>
                </a>
                <a href="javascript:void(0);" title="">
                 <i class="fa fa-google-plus fa-2x" style="color:#E76076;"></i>
                </a>
            </div>



            <div class="contact_info">
                <a href="mailto:hotro@deal14.vn"><i class="fa fa-envelope-o fa-2x" style="color:#E76076;"></i><span class="text_bold">hotro@deal14.vn</span></a>
            </div>

            <div class="contact_info">
                <i class="fa fa-phone-square fa-2x"></i><span> 1900 66 41</span>
            </div>
        </div>

        <div id="footer" class="line_up">
            <?php if ($informations) { ?>
            <div class="column">
                <h3><?php echo $text_information; ?></h3>
                <ul>
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
            <div class="column">
                <h3><?php echo $text_service; ?></h3>
                <ul>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>
            </div>
            <div class="column">
                <h3><?php echo $text_extra; ?></h3>
                <ul>
                   
                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                   <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul>
            </div>
            <div class="column">
                <h3><?php echo $text_account; ?></h3>
                <ul>
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>
        </div>
        <!--
        OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
        Please donate via PayPal to donate@opencart.com
        //-->
        <div id="powered" class="line_up"><?php echo $powered; ?></div>

        <div class="footer_cart">
            <ul>
                <li><a href=""><img src="catalog/view/theme/default/Images/product/icon-cash.png"/></a></li>
                <li><a href=""><img src="catalog/view/theme/default/Images/product/icon-visa.png"/></a></li>
                <li><a href=""><img src="catalog/view/theme/default/Images/product/icon-mater.png"/></a></li>

            </ul>
        </div>


    </div>
</div>
</div>
</div>
<!-- footer-end -->
</body>
</html>

<script type="text/javascript">
    jQuery(document).ready(function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/smallCart',
            type: 'post',
            dataType: 'json',
            success: function(json) {
                html = '';
                html += ' <div id="cartview"> ';
                html += '    <div id="cartview-content">';
                html += '<ul class="items">';
                for (i = 1; i <= json['products'].length; i++) {
                    product = json['products'][i - 1];
                    html += ' <li>';
                    html += ' <a href="' + product['href'] + '"> <img alt="' + product['name'] + '" src="' + product['thumb'] + '"></a>';
                    html += ' <div class="prod_details">';
                    html += ' <strong>' + product['name'] + ':' + product['mc'] + '</strong>';
                    html += '<dl>';
                    html += '  <dt>Color:</dt> <dd>' + product['color'] + '</dd>';
                    html += '  <dt>Size:</dt> <dd>' + product['size'] + '</dd>';
                    for (j = 0; j < product['option'].length; j++) {
                        option = product['option'][j];
                        html += '  <dt>' + option['name'] + '</dt> <dd>' + option['value'] + '</dd>';
                    }
                    html += '  <dt>Quantity:</dt> <dd id="qt_' + i + '">' + product['quantity'] + '</dd>';
                    html += '</dl>';
                    html += ' <div class="price"><span id="pc_' + i + '">' + product['total'] + '</span></div>';
                    html += '</li>';
                }
                html += '</ul>';
                html += '<div class="totals">';
                html += '<dl id="dl">';
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
                $('#cart').after(html);


            }
        });
    });

</script>