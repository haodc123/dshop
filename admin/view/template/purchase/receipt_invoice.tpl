<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
    <head>
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
    </head>
    <body>
        <?php foreach ($purchases as $purchase) { ?>
        <div style="page-break-after: always;">
            <h1><?php echo $text_invoice; ?></h1>
            <table class="store">
                <tr>
                    <td>
                        <table>
                        <?php if ($purchase['store_owner']) { ?>
                        <tr>
                            <td><b><?php echo $text_owner; ?></b></td>
                            <td><?php echo $purchase['store_owner']; ?></td>
                        </tr>
                       <?php } ?>
                       <?php if ($purchase['store_name']) { ?>
                         <tr>
                            <td><b><?php echo $text_store; ?></b></td>
                            <td><?php echo $purchase['store_name']; ?></td>
                        </tr>
                       <?php } ?>
                        
                        <?php if ($purchase['store_address']) { ?>
                         <tr>
                            <td><b><?php echo $text_address; ?></b></td>
                            <td><?php echo $purchase['store_address']; ?></td>
                        </tr>
                        <?php } ?>
                        
                        <?php if ($purchase['store_telephone']) { ?>
                         <tr>
                            <td><b><?php echo $text_telephone; ?></b></td>
                            <td><?php echo $purchase['store_telephone']; ?></td>
                        </tr>
                        <?php } ?>
                        
                        <?php if ($purchase['store_fax']) { ?>
                         <tr>
                            <td><b><?php echo $text_fax; ?></b></td>
                            <td><?php echo $purchase['store_fax']; ?></td>
                        </tr>
                      <?php } ?>
                      
                        <?php if ($purchase['store_email']) { ?>
                         <tr>
                            <td><b><?php echo $text_email; ?></b></td>
                            <td><?php echo $purchase['store_email']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php if ($purchase['store_url']) { ?>
                         <tr>
                            <td><b><?php echo $text_url; ?></b></td>
                            <td><?php echo $purchase['store_url']; ?></td>
                        </tr>
                       <?php } ?>
                        </table>
                    </td>
                    <td align="right" valign="top"><table>
                            <tr>
                                <td><b><?php echo $text_date_added; ?></b></td>
                                <td><?php echo $purchase['date_added']; ?></td>
                            </tr>
                            <?php if ($purchase['reference_no']) { ?>
                            <tr>
                                <td><b><?php echo $text_reference_no; ?></b></td>
                                <td><?php echo $purchase['reference_no']; ?></td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <td><b><?php echo $text_purchase_id; ?></b></td>
                                <td><?php echo $purchase['purchase_id']; ?></td>
                            </tr>


                        </table></td>
                </tr>
            </table>

            <table class="product">
                <tr class="heading">
                    <td><b><?php echo $column_product; ?></b></td>
                    <td><b><?php echo $column_mcs; ?></b></td>
                    <td align="right"><b><?php echo $column_quantity; ?></b></td>
                    <td align="right"><b><?php echo $column_price; ?></b></td>
                    <td align="right"><b><?php echo $column_total; ?></b></td>
                </tr>
                <?php foreach ($purchase['purchase'] as $product) { ?>
                <tr>
                    <td><?php echo $product['name']; ?>
                        <br />
                        &nbsp;<small> - <?php echo $text_color; ?><?php echo $product['color']; ?></small>
                        <br />
                        &nbsp;<small> - <?php echo $text_size; ?><?php echo $product['size']; ?></small>
                    </td>
                    <td><?php echo $product['mcs']; ?></td>
                    <td align="right"><?php echo $product['quantity']; ?></td>
                    <td align="right"><?php echo $product['price']; ?></td>
                    <td align="right"><?php echo $product['total']; ?></td>
                </tr>
                <?php } ?>
                <tr>
                    <td  colspan="4" align="right"><?php echo $text_total; ?></td>
                    <td  colspan="2" align="right"><?php echo $purchase['total']; ?></td>
                </tr>
            </table>
        </div>
        <?php } ?>
    </body>
</html>