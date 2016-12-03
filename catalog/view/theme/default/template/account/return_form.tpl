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
                
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                   <div class="content_return">
                       <div class='content'>
                            <h2><?php echo $text_order; ?></h2>
                           <?php echo $text_description; ?><br />
                        <div class="left">
                            <label><?php echo $entry_firstname; ?><span class="required">*</span></label>
                            <input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
                           <?php if ($error_firstname) { ?>
                            <span class="error"><?php echo $error_firstname; ?></span>
                            <?php } ?>
                            <label><?php echo $entry_lastname; ?><span class="required">*</span></label>
                            <input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field" />
                            <?php if ($error_lastname) { ?>
                            <span class="error"><?php echo $error_lastname; ?></span>
                            <?php } ?>
                            <label><?php echo $entry_email; ?><span class="required">*</span></label>
                            <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />
                            <?php if ($error_email) { ?>
                            <span class="error"><?php echo $error_email; ?></span>
                            <?php } ?>
                             <label><?php echo $entry_telephone; ?><span class="required">*</span></label>
                            <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
                            <?php if ($error_telephone) { ?>
                            <span class="error"><?php echo $error_telephone; ?></span>
                            <?php } ?>
                        </div>
                        <div class="right">
                            <label><?php echo $entry_order_id; ?><span class="required">*</span></label>
                            <input type="text" name="order_id" value="<?php echo $order_id; ?>" class="large-field" />
                            <?php if ($error_order_id) { ?>
                            <span class="error"><?php echo $error_order_id; ?></span>
                            <?php } ?>
                            <label><?php echo $entry_date_ordered; ?> </label>
                            <input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="large-field date" />
                            <br />
                        </div>
                       </div>
                        
                    </div>
                    <div class="content_return">
                       <div class="content">
                            <h2><?php echo $text_product; ?></h2>
                            <div class="return-product">
                                <div class="return-name">
                                    <label><?php echo $entry_product; ?><span class="required">*</span></label>
                                    <input type="text" name="product" value="<?php echo $product; ?>" />
                                    <?php if ($error_product) { ?>
                                    <span class="error"><?php echo $error_product; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="return-model">
                                    <label><?php echo $entry_model; ?><span class="required">*</span></label>
                                    <input type="text" name="model" value="<?php echo $model; ?>" />
                                    <?php if ($error_model) { ?>
                                    <span class="error"><?php echo $error_model; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="return-quantity"><label><?php echo $entry_quantity; ?></label>
                                    <input type="text" name="quantity" value="<?php echo $quantity; ?>" />
                                </div>
                            </div>
                            <div class="return-detail">
                                <div class="return-reason">
                                    <label><?php echo $entry_reason; ?><span class="required">*</span></label>
                                    <table>
                                        <?php foreach ($return_reasons as $return_reason) { ?>
                                        <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
                                        <tr>
                                            <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /></td>
                                            <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
                                        </tr>
                                        <?php } else { ?>
                                        <tr>
                                            <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /></td>
                                            <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
                                        </tr>
                                        <?php  } ?>
                                        <?php  } ?>
                                    </table>
                                    <?php if ($error_reason) { ?>
                                    <span class="error"><?php echo $error_reason; ?></span>
                                    <?php } ?>
                                </div>
                                <div class="return-opened">
                                    
                                    <label><?php echo $entry_opened; ?></label>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td width="5"><?php if ($opened) { ?>
                                    <input type="radio" name="opened" value="1" id="opened" checked="checked" />
                                    <?php } else { ?>
                                    <input type="radio" name="opened" value="1" id="opened" />
                                    <?php } ?></td>
                                                <td><label for="opened"><?php echo $text_yes; ?></label></td>
                                            </tr>
                                            <tr>
                                                <td width="5">
                                                <?php if (!$opened) { ?>
                                    <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
                                    <?php } else { ?>
                                    <input type="radio" name="opened" value="0" id="unopened" />
                                    <?php } ?>
                                                </td>
                                                <td> <label for="unopened"><?php echo $text_no; ?></label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><label for="unopened"><?php echo $entry_fault_detail; ?></label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"> <textarea name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                <div class="return-captcha">
                                    <label><?php echo $entry_captcha; ?></label>
                                    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
                                    <img src="index.php?route=account/return/captcha" alt="" />
                                    <?php if ($error_captcha) { ?>
                                    <span class="error"><?php echo $error_captcha; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <?php if ($text_agree) { ?>
                    <div class="buttons">
                        <div class="left"><a href="<?php echo $back; ?>" class="button_medium"><?php echo $button_back; ?></a></div>
                        <div class="right">
                             <label for="agree"><?php echo $text_agree; ?> <a onClick="return window.open('<?php echo $href; ?>', '<?php echo $title; ?>', 'width=800, height=400, scrollbars=yes');"><?php echo $title; ?></a></label>
                            <?php if ($agree) { ?>
                            <input type="checkbox" name="agree" value="1" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="agree" value="1" />
                            <?php } ?>
                            <input type="submit" value="<?php echo $button_continue; ?>" class="button_medium" />
                        </div>
                    </div>
                    <?php } else { ?>
                    <div class="buttons">
                        <div class="left"><a href="<?php echo $back; ?>" class="button_medium"><?php echo $button_back; ?></a></div>
                        <div class="right">
                            <input type="submit" value="<?php echo $button_continue; ?>" class="button_medium" />
                        </div>
                    </div>
                    <?php } ?>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>