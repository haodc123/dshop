<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jstree/jquery.tree.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.validate.min.js"></script>
  <link rel="stylesheet" href="catalog/view/theme/default/App_Themes/Deal14/font-awesome/css/font-awesome.min.css">
        <!--[if IE 7]>
        <link rel="stylesheet" href="catalog/view/theme/default/App_Themes/Deal14/font-awesome/css/font-awesome-ie7.min.css">
        <![endif]-->
      
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
        color:#000;
}
a{    color: #737373;
    outline: medium none;
    text-decoration: none;}
h1{
    float:left;
    color:#EE314F;
    font: bold 35px Arial, Helvetica, sans-serif;
    text-transform: uppercase;
    margin: 0px 0px 5px 0px;
  
}
.dialog_title{
   float:left;
   width:100%;
}
.wait{ float:right; margin-top: 20px;}
.left{
    float:left;
}
.right{
    float:right;
}
#container{
    float:left;
      
}
#content{
     overflow-y: auto;
       float:left;
        height: 350px;
        width: 800px;
        border-top: 1px dashed #E23D57;
        padding-top: 20px;
}
.login-content {
    margin-bottom: 20px;
}
.login-content .left{ float:left; }
.login-content .right{ float:right; }
.login-content .left, .login-content .right {
    height: 245px;
    width: 49%;
    border: 1px solid #EEEEEE;
}
.login-content .left h2, .login-content .right h2 {
    border-bottom: 1px solid #E76076;
    color: #EB3752;
    font-size: 13px;
    font-weight: bold;
    padding: 5px 0px 5px 10px;
    text-transform: uppercase;
   
}
.breadcrumb {
    color: #999999;
    font-family: arial;
    font-size: 0.75em;
    margin-bottom: 12px;
}
.login-content > .right > p {
    float: left;
    margin: 10px;
}
.login-content > .left > p{
    float:left;
    margin: 10px;
}
.content_login > div {
    clear: left;
    float: left;
    margin-bottom: 10px;
    text-align: right;
    width: 100%;
}
.content_login > div > b {
    float: left;
    height: 25px;
    padding-right: 10px;
    line-height: 25px;
    width: 30%;
   
}
input[type="text"], input[type="password"]{
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #B3B3B3;
    height: 22px;
    margin: 0;
    padding: 2px 4px;
    width: 189px;
    float:left;
    font-family: futura-book,sans-serif,Verdana,Arial;
    font-size: 12px;
    border-radius: 5px 5px 5px 5px;
    -moz-border-radius:  5px 5px 5px 5px;
    -webkit-border-radius:  5px 5px 5px 5px;
    -ms-border-radius:  5px 5px 5px 5px;
    -o-border-radius:  5px 5px 5px 5px;
   
}
select[name="country_id"], select[name="zone_id"] {
     background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #B3B3B3;
    height: 28px;
    width: 200px;
    float:left;
    padding: 3px;
      border-radius: 5px 5px 5px 5px;
    -moz-border-radius:  5px 5px 5px 5px;
    -webkit-border-radius:  5px 5px 5px 5px;
    -ms-border-radius:  5px 5px 5px 5px;
    -o-border-radius:  5px 5px 5px 5px;
   

}
/*a.button, input.button {
border: none;
cursor: pointer;
color: #FFFFFF;
font-family: Arial, Helvetica, sans-serif;
font-size: 12px;
font-weight: bold;
background-color:#E76076;
float:left;
text-align: center;
text-transform: uppercase;
padding: 8px 0px;
width: 200px;
}*/
a.button, input.button { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding:3px 6px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
a.button_small, input.button_small { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding: 6px 12px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
a.button_medium, input.button_medium { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding: 12px 24px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
a.button_big, input.button_big { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding: 24px 48px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
.button_right{ margin-right:40%;}
.login-content .buttons{
    float: right;
    padding:10px 40px 0 0;
}


.content_login > div > a{
    color:#595959;
    font-size: 11px;
    text-decoration:underline;
    float:left;
}
.content_login > div > a:hover{
    cursor: pointer;
}
.content_dialog p{ padding-bottom: 1em;}
.content_login > div > div{
    padding-right: 10px;
}
.content .content-info{
    border-bottom: 1px dotted #E23D57;
}
.content .content-info,.content> .content-acount, .content> .content-detail{
    float:left;
    width: 100%;
    
}
.content h2 {
    margin-bottom: 10px;
    margin-top: 20px;
}
.content-acount label,.content-detail label{ 
    clear: left;
    font: normal 11px Arial;
    height: 30px;
    line-height: 30px;
    float: left;
    width: 130px;
}
.content label, .content input, .content select{
    margin-bottom: 8px;
}
#content> .right label{ 
    clear: left;
     float: left;
    font: normal 11px Arial;
    padding: 10px 0px 5px 0px;
  
}
#content> .left input,#content> .right input,#content> .right select[name='country_id']{
    clear: left;
    float:left;
}
.left-top{ float:left;}
.left-bottom{ float:left; margin-top: 20px;}


#content> .right select[name='country_id']{
    width:200px;
    height:28px;
}
.control{ 
    padding: 5px 0px;
    float:left;
    width:100%;
    font: normal 11px Arial;
}
.control> label> a{
    color:#000;
    text-transform: lowercase;
    cursor: pointer;
    font-weight: bold;
    text-decoration: underline;
    
}
#content> .buttons {
   margin-bottom: 20px;
    padding: 6px 0px;
   float:left;
    width:100%;
}
.error {
   
    display: block;
    float: left;
    font: 10px Arial;
    margin-left: 5px;
    background-color: #FFECED;
    border: 1px solid #E23D57;
    color: #E23D57;
    float: left;
    padding: 2px 10px;
    height: 22px;
    line-height: 22px;
    font-style: italic;
    border-radius: 5px 5px 5px 5px;
    -moz-border-radius:  5px 5px 5px 5px;
    -webkit-border-radius:  5px 5px 5px 5px;
    -ms-border-radius:  5px 5px 5px 5px;
    -o-border-radius:  5px 5px 5px 5px;
}
.error i{margin-right: 5px;}
.forgotten_buttons{float:left;width:100%; margin-top:20px;}
.forgotten_buttons a.button, input.button{
    float:left;
    margin: 20px 20px 0px 0px;
}
</style>
</head>
<body>
    <div id="container">
        <div class="dialog_title">
          <h1><?php echo $heading_title;?></h1>
          <div id="loading" class="wait" style="display: none;"><img src="catalog/view/theme/default/Images/Mita/icon/loading.gif" alt="" /></div>
         </div>
          <div id="content">
              <div class="login-content">
                  <div class="left">
                      <h2><?php echo $text_new_customer; ?></h2>
                      <p><?php echo $text_register_account; ?></p>
                      <div class="buttons">
                          <a id="button-account" class="button_medium"><?php echo $button_continue; ?></a>
                      </div>
                  </div>
                  <div class="right" id="login">
                      <h2><?php echo $text_returning_customer; ?></h2>
                      <p><?php echo $text_i_am_returning_customer; ?></p>
                      <div class="content_login">

                          <div><b><?php echo $entry_email; ?></b><input type="text" name="email" value="<?php echo $email; ?>" /></div>

                          <div><b><?php echo $entry_password; ?></b><input type="password" name="password" value="<?php echo $password; ?>" /> </div>

                          <div><b></b><a id="forgotten"><?php echo $text_forgotten; ?></a></div>

                          <div>
                              <b></b>
                              <input  id="button-login" type="button" value="<?php echo $button_login; ?>" class="button_medium button_right" onclick="$('#loading').show();" />
                          </div>
                          

                      </div>


                  </div>


              </div>
          </div>

    </div>

</body>
</html>

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
     background-color: #EE314F;
     border:none;
     color: #FFFFFF;
     width:100px;
       border-radius: 5px 5px 5px 5px;
    -moz-border-radius:  5px 5px 5px 5px;
    -webkit-border-radius:  5px 5px 5px 5px;
    -ms-border-radius:  5px 5px 5px 5px;
    -o-border-radius:  5px 5px 5px 5px;
}
.content_dialog{
    font-size:11px;
    text-align: center;
    color: #737373; }
.content_dialog p{
    padding-bottom: 1em;
    margin: 0px;
}
h2{ 
    
    color: #EE314F;
    font-size: 18px;
    font-weight: bold;
    }
</style>
<script type="text/javascript">
  
    // Login
    html='';
    html+='<div style="display:none;" id="dialog" title="Basic dialog">';
                                html+='<h2>Invalid access details.</h2>';
                                html+='<i class="fa fa-exclamation-triangle fa-2x"></i>';
                                html+='  <div class="content_dialog">';
                                html+='<?php echo $error_login; ?>';
                                html+=' </div>';
                                html+='</div>';
                                $('body').after(html);
        $('#button-login').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/filelogin/validate',
		type: 'post',
		data: $('#container #login :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-login').attr('disabled', true);
			$('.wait').css('display','block');
		},	
		complete: function() {
			$('#button-login').attr('disabled', false);
			$('.wait').css('display','none');
		},				
		success: function(json) {
			if (json['error']) {
                            $('#dialog').css('display',true);
                                $('#dialog').dialog({
                                        buttons: {
                                        "Ok": function(){ $(this).dialog("close"); }
                                    },
                                    title: 'Detalhes do produto',
                                    modal: true,
                                    resizable: false,
                                    width: 400,
                                    height: 300,
                                    closeText: 'fechar',
                                    draggable: true,
                                    show: 'fade',
                                    hide: 'fade',
                                    dialogClass: 'main-dialog-class'
		
        });
                                
			} else{
                            parent.$("#dialog").dialog('close');
                        }
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

</script>
<script type="text/javascript">
// Checkout
$('#button-account').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/register',
		dataType: 'html',
		beforeSend: function() {
			$('.wait').css('display','block');
                },		
		complete: function() {
			$('.wait').css('display','none');
		},			
		success: function(html) {
			
                      parent.$('#dialog').dialog({ 
                                  autoOpen:true,
                                  bgiframe: false,
                                  width: 800,
                                  height: 450,
                                  resizable: false,
                                  modal: true,
                                  closeOnEscape: true,
                                  draggable: false,
                                  position: ['top',50,'center'],
                             }).dialog('open');
                       
                     
                        $('#content').html(html);
                        
			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
    
</script>

<script type="text/javascript">
// Checkout
$('#forgotten').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/forgotten',
		dataType: 'html',
		beforeSend: function() {
			
		$('.wait').css('display','block');
            },		
		complete: function() {
			$('.wait').css('display','none');
		},			
		success: function(html) {
			parent.$('#dialog').dialog({ height:'350'}).dialog('open');
                        $('#content').html(html);
                        
			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
</script>







