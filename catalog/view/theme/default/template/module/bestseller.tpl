<h1><?php echo $heading_title; ?></h1>
<div class="notice">
    <span>33%</span><strong>Khách hàng đã mua sản phẩm này, bạn đã mua chưa?</strong>
</div>
<div class="category-slider">
    <div  class="best_flexslider">
        <ul class="slides">
            <?php $i=0; foreach ($products as $product) { ?>
            <li>
                <a href="<?php echo $product['href'];?>" title="<?php echo $product['name'];?>">
                <img src="<?php echo $product['thumb'];?>" title="<?php echo $product['name'];?>" alt="<?php echo $product['name'];?>">

                <div class="info_title">
                    <a title="<?php echo $product['name'];?>" href="<?php echo $product['href'];?>"><?php echo $product['name'];?></a>
                </div>
                <div class="info_price">
                    <?php if($product['special']){ ?>
                                    <span class="price-old"><?php echo $product['price'];?></span></br>
                                    <span class="price-new"><?php echo $product['special']; ?></span>
                                    <?php } else { ?>
                                     <span class="price-new"><?php echo $product['price'];?></span>
                                    <?php } ?>
                </div>
                </a>
            </li>
            <?php } ?>

        </ul>
    </div>
</div>
<script type="text/javascript">

$(window).load(function() {
  $('.best_flexslider').flexslider({
    animation: "slide",
    animationLoop:true,
    itemWidth: 122,
    controlNav: false,
    directionNav: true
  });
});
</script>



