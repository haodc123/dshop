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
                <div class="login-content">
                    <div class="left">
                        <h2><?php echo $text_new_customer; ?></h2>
                        <p><?php echo $text_register_account; ?></p>
                        <div class="buttons">
                            <a href="<?php echo $register; ?>" class="button_medium"><?php echo $button_continue; ?></a>
                        </div>
                    </div>
                    <div class="right">
                        <h2><?php echo $text_returning_customer; ?></h2>
                        <p><?php echo $text_i_am_returning_customer; ?></p>
                       
                        <form  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                            <div class="content_login">
                              
                                <div><b><?php echo $entry_email; ?></b><input type="text" name="email" value="<?php echo $email; ?>" /></div>

                                <div><b><?php echo $entry_password; ?></b><input type="password" name="password" value="<?php echo $password; ?>" /> </div>

                                <div><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>

                                <div>
                                    <input  id="opener" type="submit" value="<?php echo $button_login; ?>" class="button_medium" onclick="$('#loading').show();" />
                                 </div>
                                <div>
                                    <div id="loading" class="loading" style="display: none;"><img src="catalog/view/theme/default/Images/Mita/icon/loading.gif" alt="" /></div>
                                </div>
                                <?php if ($redirect) { ?>
                                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                                <?php } ?>
                            </div>
                        </form>
                       
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
(function (d) {
  d.getElementById('form').onsubmit = function () {
    d.getElementById('submit').style.display = 'block';
    d.getElementById('loading').style.display = 'block';
  };
}(document));
</script>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
        if (e.keyCode == 13) {
            $('#login').submit();
        }
    });
//--></script>
  <style>
.main-dialog-class .ui-widget-header{ display:none;}
.main-dialog-class .ui-widget-content{ background-image:none; background-color: #fff; border:none; padding:20px; height:220px; text-align: center;}
.ui-widget-overlay{ background-image:none; background-color: #fff; }
.ui-dialog .ui-dialog-buttonpane{ margin:0px;}
.ui-dialog{ padding:0px;
           -webkit-box-shadow: 0px 0px 20px rgba(50, 50, 50, 0.2), 0px 0px 20px rgba(50, 50, 50, 0.1); -moz-box-shadow: 0px 0px 20px rgba(50, 50, 50, 0.2), 0px 0px 20px rgba(50, 50, 50, 0.1); box-shadow:  0px 0px 20px rgba(50, 50, 50, 0.2), 0px 0px 20px rgba(50, 50, 50, 0.1);
           
}
.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset{ text-align: center; float:none;}
.ui-dialog .ui-dialog-buttonpane{ padding:0px; height: 50px;}
.ui-dialog .ui-dialog-buttonpane button{ margin:0px;}
.ui-button {
    display: inline-block;
    overflow: visible;
    padding: 0;
    position: relative;
    text-align: center;
    text-decoration: none !important;
    
    
    background-color: #E76076;
    border: medium none;
    cursor: pointer;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
    font-weight: bold;
    line-height: 12px;
}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default{
    background-image: none;
     background-color: #E76076;
     border:none;
     color: #FFFFFF;
     width:100px;
}
.content_dialog{
    font-size:11px;
    text-align: center;
    color: #737373; }
.content_dialog p{
    padding-bottom: 1em;
}
</style>
<?php if ($error_warning) { ?>     
<script>
$(function() {
 $('#dialog').dialog({
         
             buttons: {
        "Ok": function(){ $(this).dialog("close"); }
    },
            title: 'Detalhes do produto',
            modal: true,
            resizable: false,
            width: 400,
            height: 280,
            closeText: 'fechar',
            draggable: true,
            show: 'fade',
            hide: 'fade',
            dialogClass: 'main-dialog-class'
		
        });
});
</script>
<div id="dialog" title="Basic dialog">
    <h2>Invalid access details.</h2>
   <i class="fa fa-exclamation-triangle fa-2x"></i>
    <div class="content_dialog">
          <?php echo $error_warning; ?>
    </div>
   
</div>
<?php } ?>
<?php echo $footer; ?>