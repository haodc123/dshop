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
                <div class="content_account">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <h2><?php echo $text_your_details; ?></h2>
                        <div class="content">
                            <table class="form">
                                <tr>
                                    <td><label><?php echo $entry_firstname; ?><span class="required">*</span></label></td>
                                    <td>
                                        <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
                                        <?php if ($error_firstname) { ?>
                                        <span class="error"><?php echo $error_firstname; ?></span>
                                        <?php } ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label><?php echo $entry_lastname; ?><span class="required">*</span></label></td>
                                    <td><input type="text" name="lastname" value="<?php echo $lastname; ?>" />
                                        <?php if ($error_lastname) { ?>
                                        <span class="error"><?php echo $error_lastname; ?></span>
                                        <?php } ?></td>
                                </tr>
                                <tr>
                                    <td><label><?php echo $entry_email; ?><span class="required">*</span></label></td>
                                    <td><input type="text" name="email" value="<?php echo $email; ?>" />
                                        <?php if ($error_email) { ?>
                                        <span class="error"><?php echo $error_email; ?></span>
                                        <?php } ?></td>
                                </tr>
                                <tr>
                                    <td><label><?php echo $entry_telephone; ?><span class="required">*</span></label></td>
                                    <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
                                        <?php if ($error_telephone) { ?>
                                        <span class="error"><?php echo $error_telephone; ?></span>
                                        <?php } ?></td>
                                </tr>
                                <tr>
                                    <td><label><?php echo $entry_fax; ?></label></td>
                                    <td><input type="text" name="fax" value="<?php echo $fax; ?>" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="buttons">
                            <div class="left"><a href="<?php echo $back; ?>" class="button_medium"><?php echo $button_back; ?></a></div>
                            <div class="right">
                                <input type="submit" value="<?php echo $button_continue; ?>" class="button_medium" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="column_right">
                    <?php echo $column_right; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>