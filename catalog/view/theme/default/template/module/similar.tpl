<?php if($products) { ?>
<div class="category-item-similar">
    <h3><?php echo $heading_title; ?></h3>
    <ul>
        <?php foreach ($products as $product) { ?>
        <li>
            <a href="<?php echo $product['href']; ?>">
                <img class="tooltip" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
            </a>
        <!--    <div class="price_block">
                <span><?php echo $product['price']; ?></span>
                <a class="button-buynow" href="<?php echo $product['href']; ?>"></a>
            </div>-->
        </li>
        <?php } ?>
    </ul>
</div>
<?php } ?>


