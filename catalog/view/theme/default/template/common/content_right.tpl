<!-- content-right-begin -->
<div class="content_right">

    <?php if (!empty($products)){ ?>
    <!-- content_items-open -->
    <div class="content_items">
        <div class="content_items_header">
            THỜI TRANG ĐƯỢC ƯA CHUỘNG >>
        </div>
        <?php
        $item=0;
        $more=0;
        foreach ($products as $product) {
        $item++;
         $more++;
        ?>
        <!-- items-open -->
        <div class="item_pub <?php if($item==2){echo 'item_pub_mid';} ?>">
            <div class="item_image">							

                <a href="<?php echo $product['href'];?>" title="<?php echo $product['name'];?>">
                    <img class="clsImage" src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?>" title="<?php echo $product['name'];?>" />
                </a>

                <p class="pub_special">
                </p>

                <div class="deal_event_noel">
                </div>
            </div>

            <div class="item_info">

                <div class="info_title">
                    <h1><a href="javascript:void(0);" title=""><?php echo $product['name'];?></a></h1>
                </div>

                <div class="info_price">

                    <p class="pub_price2">
                        <?php echo $product['price'];?> <span class="text_small">vnđ</span>
                    </p>

                </div>

            </div>
        </div>
        <?php if($item==3){ $item=0; } 
                if($more==5){ $more=0; 
        ?>
        
        <div class="item_pub_more">
            <a href="<?php echo $seemore; ?>" title=""></a>
        </div>

        
        <?php }} ?>
        <!-- items-end -->
        

    </div>
    <?php }  else { ?>
    <div class="content">
        <?php echo $empty_product; ?>
    </div>
    <?php } ?>
    <div class="pagination"><?php echo $pagination; ?></div>
   
</div>
