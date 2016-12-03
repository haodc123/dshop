<?php echo $header; ?>
<div class="content_outer">
    <div class="content_inner">
        <div class="content">
            <div id="content">
                <?php echo $content_top; ?>
                <div class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <div class="content_account">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <h2><?php echo $text_password; ?></h2>
                        <div class="content">
                            <table class="form">
                                <tr>
                                    <td><label><?php echo $entry_password; ?><span class="required">*</span></label></td>
                                    <td><input type="password" name="password" value="<?php echo $password; ?>" />
                                        <?php if ($error_password) { ?>
                                        <span class="error"><?php echo $error_password; ?></span>
                                        <?php } ?></td>
                                </tr>
                                <tr>
                                    <td><label> <?php echo $entry_confirm; ?></label><span class="required">*</span></td>
                                    <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
                                        <?php if ($error_confirm) { ?>
                                        <span class="error"><?php echo $error_confirm; ?></span>
                                        <?php } ?></td>
                                </tr>
                            </table>
                        </div>
                        <div class="buttons">
                            <div class="left"><a href="<?php echo $back; ?>" class="button_medium"><?php echo $button_back; ?></a></div>
                            <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button_medium" /></div>
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