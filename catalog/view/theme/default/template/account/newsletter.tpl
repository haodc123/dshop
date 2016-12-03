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
                        <div class="content">
                            <h2><?php echo $entry_newsletter; ?></h2>
                            <table class="form">
                                <tr>
                                    <td><?php echo $entry_newsletter; ?></td>
                                    <td><?php if ($newsletter) { ?>
                                        <input type="radio" name="newsletter" value="1" checked="checked" />
                                        <?php echo $text_yes; ?>&nbsp;
                                        <input type="radio" name="newsletter" value="0" />
                                        <?php echo $text_no; ?>
                                        <?php } else { ?>
                                        <input type="radio" name="newsletter" value="1" />
                                        <?php echo $text_yes; ?>&nbsp;
                                        <input type="radio" name="newsletter" value="0" checked="checked" />
                                        <?php echo $text_no; ?>
                                        <?php } ?></td>
                                </tr>
                            </table>
                        </div>
                        
                    </form>
                    <div class="buttons">
                            <div class="left"><a href="<?php echo $back; ?>" class="button_small"><?php echo $button_back; ?></a></div>
                            <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button_small" /></div>
                        </div>
                </div>
                <div class="column_right"><?php echo $column_right; ?></div>
        </div>
    </div>
</div>

<?php echo $footer; ?>