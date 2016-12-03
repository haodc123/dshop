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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="contact-info">
                        <h2><?php echo $text_location; ?></h2>
                        <div class="content">
                            <b><?php echo $text_address; ?> </b>
                            <?php echo $store; ?>,
                            <?php echo $address; ?><br/><br/>
                            <?php if ($telephone) { ?>
                            <b><?php echo $text_telephone; ?> </b><?php echo $telephone; ?><br /><br/>
                            <?php } ?>
                            <?php if ($fax) { ?>
                            <b><?php echo $text_fax; ?> </b><?php echo $fax; ?><br /><br/>
                            <?php } ?>

                        </div>
                        <div class="content">
                            <h2><?php echo $text_contact; ?></h2>
                            <div class="contact_input">
                                <label><?php echo $entry_name; ?></label>
                                <input type="text" name="name" value="<?php echo $name; ?>" />
                                <?php if ($error_name) { ?>
                                <span class="error"><?php echo $error_name; ?></span>
                                <?php } ?>
                            </div>
                            <div class="contact_input">
                                <label><?php echo $entry_email; ?></label>
                                <input type="text" name="email" value="<?php echo $email; ?>" />
                                <?php if ($error_email) { ?>
                                <span class="error"><?php echo $error_email; ?></span>
                                <?php } ?>
                            </div>
                            <div class="contact_input">
                            <label><?php echo $entry_enquiry; ?></label>
                            <textarea name="enquiry" id='enquiry' cols="100" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                             <span class="error"><?php echo $error_enquiry; ?></span>
                            <?php } ?>
                            </div>
                            <div class="contact_input">
                            <label><?php echo $entry_captcha; ?></label>
                            <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
                            <br />
                            <img src="index.php?route=information/contact/captcha" alt="" />
                            <?php if ($error_captcha) { ?>
                             <span class="error"><?php echo $error_captcha; ?></span>
                            <?php } ?>
                            </div>
                        </div>
                    </div>
                   

                    <div class="buttons">
                        <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button_medium" /></div>
                    </div>
                </form>
                <?php echo $content_bottom; ?>
            </div>
            
        </div>
        
    </div>
</div>
<?php echo $footer; ?>
<!--
<script type="text/javascript" src="catalog/view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
CKEDITOR.replace('enquiry', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager',
        filebrowserUploadUrl: 'index.php?route=common/filemanager',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager'
});
</script> -->