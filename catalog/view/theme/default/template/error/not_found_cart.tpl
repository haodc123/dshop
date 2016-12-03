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
               <div class="cart-info">
                        <div class="cart-info-loadding">
                            <td colspan="6" class="loading">
                                <div id="loading" style="display: none;"><img alt="" src="catalog/view/theme/default/Images/Mita/icon/loading.gif"></div>
                            </td>
                        </div>
                        <table  id="cart-info">
                            <thead>
                                <tr>
                                    <td class="image"><span><?php echo $column_image; ?></span></td>
                                    <td class="name"><?php echo $column_name; ?></td>

                                    <td class="price"><?php echo $column_price; ?></td>
                                    <td class="quantity"><?php echo $column_quantity; ?></td>

                                    <td class="total"><?php echo $column_total; ?></td>
                                    <td class="delete"><?php echo $column_delete; ?></td>
                                </tr>
                            </thead>
                            <tbody class="cart-body">
                                <tr>
                                    <td colspan="6">
                                          
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot class="cart-total-not-found">
                                   <tr>
                                    <td colspan="6"></td>
                                  </tr>
                            </tfoot>
                        </table>
                        <div class="buttons">
                            <div class="left"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_shopping; ?></a></div>
                        </div>
                    </div>
                    
            </div>

        </div>


    </div>
</div>
<?php echo $footer; ?>