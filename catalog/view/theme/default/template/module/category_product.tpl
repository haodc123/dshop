<?php if ($products) { ?>
<!-- content_items-open -->
<div class="content_items">
    <div class="content_items_header">
        <?php echo $heading_title; ?>
    </div>
    <?php
    $item=1;
    $more=0;
    foreach ($products as $product) {
    $item++;
    $more++;
    ?>
    <!-- items-open -->
    <div class="item_pub <?php if($item==3){echo 'item_pub_mid'; $item=0;} ?>">
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
                <a title="<?php echo $product['name'];?>" href="<?php echo $product['href'];?>"><?php echo $product['name'];?></a>
            </div>

            <div class="info_price">

                <p class="pub_price2">
                    <?php if($product['special']){ ?>
                    <span class="price-old"><?php echo $product['price'];?></span>
                    <span class="price-new"><?php echo $product['special']; ?></span>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['price'];?></span>
                    <?php } ?>
                </p>

            </div>
            <div class="info_model">
                <?php echo $text_model;?><?php echo $product['model'];?>
            </div>

        </div>
    </div>
    <?php if($more%5==0){ ?>
    <div class="item_pub_more">
        <a href="<?php echo $seemore; ?>" title=""></a>
    </div>
    <?php } ?>
    <?php } ?>
</div>
<?php } ?>