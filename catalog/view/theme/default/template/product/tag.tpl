<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <div class="content_left">
                <?php echo $column_left; ?>
            </div>
            <div class="content_right">
               <div id="content"><?php echo $content_top; ?>
                    <div class="breadcrumb">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        <?php } ?>
                    </div>
                   <?php if ($products) { ?>
                    <div class="product-filter">
                        <div class="limit"><b><?php echo $text_limit; ?></b>
                            <select onchange="location = this.value;" style="width:100px;">
                                <?php foreach ($limits as $limits) { ?>
                                <?php if ($limits['value'] == $limit) { ?>
                                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="sort"><b><?php echo $text_sort; ?></b>
                            <select onchange="location = this.value;" style="width:100px;" >
                                <?php foreach ($sorts as $sorts) { ?>
                                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
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
                                      <?php echo $product['model'];?>
                                     </div>
                                  

                                </div>
                            </div>
                            <?php } ?>
                            <!-- items-end -->
                        </div>
                   
                    <div class="pagination"><?php echo $pagination; ?></div>
                    <?php } ?>
                    <?php if (!$products) { ?>
                    <div class="content"><?php echo $text_empty; ?></div>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_continue; ?></a></div>
                    </div>
                    <?php } ?>
                    </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>