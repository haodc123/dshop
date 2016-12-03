<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <div id="content">
                <?php if ($success) { ?>
                <div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
                <?php } ?>
                <div id="content"><?php echo $content_top; ?>
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
                        <table id="cart-table">
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
                                <tr>
                                    <td colspan="6" class="empty"><?php echo $text_empty;?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <div class="right"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_continue; ?></a></div>
                    </div>
                   <?php echo $content_bottom; ?></div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>