<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
            <div id="content">
                <div class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <div class="content_voucher">
                    <p><?php echo $text_description; ?></p><br/>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <table class="form">
                            <tr>
                                <td><label><?php echo $entry_to_name; ?><span class="required">*</span></label></td>
                                <td><input type="text" name="to_name" value="<?php echo $to_name; ?>" />
                                    <?php if ($error_to_name) { ?>
                                    <span class="error"><?php echo $error_to_name; ?></span>
                                    <?php } ?></td>
                            </tr>
                            <tr>
                                <td><label><?php echo $entry_to_email; ?><span class="required">*</span></label></td>
                                <td><input type="text" name="to_email" value="<?php echo $to_email; ?>" />
                                    <?php if ($error_to_email) { ?>
                                    <span class="error"><?php echo $error_to_email; ?></span>
                                    <?php } ?></td>
                            </tr>
                            <tr>
                                <td><label><?php echo $entry_from_name; ?><span class="required">*</span></label></td>
                                <td><input type="text" name="from_name" value="<?php echo $from_name; ?>" />
                                    <?php if ($error_from_name) { ?>
                                    <span class="error"><?php echo $error_from_name; ?></span>
                                    <?php } ?></td>
                            </tr>
                            <tr>
                                <td><label><?php echo $entry_from_email; ?><span class="required">*</span></label></td>
                                <td><input type="text" name="from_email" value="<?php echo $from_email; ?>" />
                                    <?php if ($error_from_email) { ?>
                                    <span class="error"><?php echo $error_from_email; ?></span>
                                    <?php } ?></td>
                            </tr>
                            <tr>
                                <td><label><?php echo $entry_theme; ?><span class="required">*</span></label></td>
                                <td><?php foreach ($voucher_themes as $voucher_theme) { ?>
                                    <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                                    <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
                                    <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
                                    <?php } else { ?>
                                    <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
                                    <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
                                    <?php } ?>
                                    <br />
                                    <?php } ?>
                                    <?php if ($error_theme) { ?>
                                    <span class="error"><?php echo $error_theme; ?></span>
                                    <?php } ?></td>
                            </tr>
                            <tr>
                                <td><label><?php echo $entry_message; ?></label></td>
                                <td><textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea></td>
                            </tr>
                            <tr>
                                <td><label><?php echo $entry_amount; ?></label></td>
                                <td><input type="text" name="amount" value="<?php echo $amount; ?>" size="5" />
                                    <?php if ($error_amount) { ?>
                                    <span class="error"><?php echo $error_amount; ?></span>
                                    <?php } ?></td>
                            </tr>
                        </table>
                        <div class="buttons">
                            <div class="right"><?php echo $text_agree; ?>
                                <?php if ($agree) { ?>
                                <input type="checkbox" name="agree" value="1" checked="checked" />
                                <?php } else { ?>
                                <input type="checkbox" name="agree" value="1" />
                                <?php } ?>
                                <input type="submit" value="<?php echo $button_continue; ?>" class="button_small" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<?php echo $footer; ?>