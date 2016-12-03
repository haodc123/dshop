<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_code; ?></td>
                        <td><input type="text" name="code" value="<?php echo $code; ?>"/>
                            <?php if ($error_model) { ?>
                            <span class="error"><?php echo $error_model; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_name; ?></td>
                        <td><input type="text" name="name" value="<?php echo $name; ?>" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_date; ?></td>
                        <td><input type="text" name="date" value="<?php echo $date; ?>" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_supplier; ?></td>
                        <td><input type="text" name="supplier_id" value="<?php echo $supplier_id; ?>" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_manufacture; ?></td>
                        <td><input type="text" name="manufacture_id" value="<?php echo $manufacture_id; ?>" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<?php echo $footer; ?>