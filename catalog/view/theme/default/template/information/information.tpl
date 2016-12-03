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
            <div class="content">
            <?php echo $description; ?>
            </div>
            <div class="buttons">
                <div class="right"><a href="<?php echo $continue; ?>" class="button_medium"><?php echo $button_continue; ?></a></div>
            </div>
        </div>
                </div>
    </div>
</div>
<?php echo $footer; ?>
