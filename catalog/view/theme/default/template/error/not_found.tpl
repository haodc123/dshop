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
               
                <div class="content"><?php echo $text_error; ?></div>
                <div class="buttons">
                    <div class="right"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
                
            </div>

        </div>
    </div>
</div>
<?php echo $footer; ?>