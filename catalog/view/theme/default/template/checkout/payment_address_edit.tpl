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
    color: #EE314F;
    font: bold 35px Arial, Helvetica, sans-serif;
    text-transform: uppercase;
    margin: 0px 0px 10px 0px;
   
}

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
}
.login-content {
    margin-bottom: 20px;
}
.login-content .left{ float:left; }
.login-content .right{ float:right; }
.login-content .left, .login-content .right {
    height: 250px;
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

a.button, input.button { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding:3px 6px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
a.button_small, input.button_small { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding: 6px 12px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
a.button_medium, input.button_medium { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding: 12px 24px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}
a.button_big, input.button_big { background-color: #EE314F;border: medium none;color: #FFFFFF;cursor: pointer;font-family:Arial,Helvetica,sans-serif;font-size: 12px; font-weight: bold;padding: 24px 48px;text-align: center;text-transform: uppercase;-webkit-border-radius: 5px 5px 5px 5px;-moz-border-radius: 5px 5px 5px 5px;-khtml-border-radius: 5px 5px 5px 5px;border-radius: 5px 5px 5px 5px;}


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
.forgotten_buttons{
    float:left;
    width:100%;
    }
.forgotten_buttons a.button, input.button{
    float:left;
    margin: 20px 20px 0px 0px;
}
h2{ 
    
    color: #EE314F;
    font-size: 18px;
    font-weight: bold;
    }
</style>
</head>
<body>
    <div id="container">
        <h1><?php echo $heading_title;?></h1>

        <div id="content">
            <div class="content">
                <h2><?php echo $text_edit_address; ?></h2>
                    
                        <table class="form">
                            <tr>
                                <td><?php echo $entry_firstname; ?> <span class="required">*</span></td>
                                <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
                                    </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_lastname; ?> <span class="required">*</span></td>
                                <td><input type="text" name="lastname" value="<?php echo $lastname; ?>" />
                                    </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_address_1; ?> <span class="required">*</span></td>
                                <td><input type="text" name="address_1" value="<?php echo $address_1; ?>" />
                                    </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_address_2; ?></td>
                                <td><input type="text" name="address_2" value="<?php echo $address_2; ?>" /></td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_country; ?><span class="required">*</span></td>
                                <td><select name="country_id">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $country_id) { ?>
                                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                   </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_postcode; ?> <span id="postcode-required" class="required">*</span></td>
                                <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" />
                                  </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_city; ?><span class="required">*</span></td>
                                <td><input type="text" name="city" value="<?php echo $city; ?>" />
                                   </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_zone; ?> <span class="required">*</span></td>
                                <td><select type="text" name="zone_id" value="<?php echo $zone_id; ?>">
                                    </select>
                                   </td>
                            </tr>
                            <tr>
                                <td><?php echo $entry_phone; ?><span class="required">*</span></td>
                                <td><input type="text"  name="telephone" value="<?php echo $telephone; ?>" class="large-field" /></td>
                            </tr>
                            <tr style="display: none;">
                                <td><?php echo $entry_default; ?></td>
                                <td><?php if ($default) { ?>
                                    <input type="radio" name="default" value="1" checked="checked" />
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="default" value="0" />
                                    <?php echo $text_no; ?>
                                    <?php } else { ?>
                                    <input type="radio" name="default" value="1" />
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="default" value="0" checked="checked" />
                                    <?php echo $text_no; ?>
                                    <?php } ?></td>
                            </tr>
                        </table>
                   
                    <div class="buttons">
                       <div class="right">
                            <input id="button_update" type="button" value="<?php echo $button_update; ?>" class="button_medium" />
                        </div>
                    </div>
             

            </div>
        </div>

    </div>
</body>
 </html>
 <script type="text/javascript">
    $(document).ready(function() {


        $('input[name=firstname]').focus(function() {
            $('#firstname').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'firstname\']').after('<span id="firstname" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
    $('#firstname').fadeIn(300);
}
});
  $('input[name=lastname]').focus(function() {
            $('#lastname').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'lastname\']').after('<span id="lastname" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
     $('#lastname').fadeIn(300);
}
});
 $('input[name=address_1]').focus(function() {
            $('#address_1').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'address_1\']').after('<span id="address_1" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
     $('#address_1').fadeIn(300);
}
});
  $('select[name=country_id]').focus(function() {
           $('#country_id').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'country_id\']').after('<span id="country_id" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
     $('#country_id').fadeIn(300);
}
});
$('input[name=postcode]').focus(function() {
           $('#postcode').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'postcode\']').after('<span id="postcode" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
    $('#postcode').fadeIn(300);
}
});
$('input[name=city]').focus(function() {
            $('#city').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'city\']').after('<span id="city" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
     $('#city').fadeIn(300);
}
});
$('select[name=zone_id]').focus(function() {
             $('#zone_id').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'zone_id\']').after('<span id="zone_id" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
     $('#zone_id').fadeIn(300);
}
});
 $('input[name=telephone]').focus(function() {
           $('#telephone').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'telephone\']').after('<span id="telephone" class="error" style="display:none;"><i class="icon-warning-sign"></i><?php echo $error_empty;?></span>');
    $('#telephone').fadeIn(300);
}
});
});
</script>
 <script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			//$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			//$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script> 
<script type="text/javascript" >
// Register
$('#button_update').live('click', function() {
     
        $.ajax({
		url: 'index.php?route=checkout/payment_address_edit/update&payment_address_id=<?php echo $payment_address_id;?>',
		type: 'post',
		data: $('#content input[type=\'text\'], #content input[type=\'password\'], #content input[type=\'checkbox\']:checked, #content input[type=\'radio\']:checked, #content input[type=\'hidden\'], #content select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-register').attr('disabled', true);
			$('#button-register').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-register').attr('disabled', false); 
			$('.wait').remove();
		},			
		success: function(json) {
                        $('.warning, .error').remove();
                       
			if (json['error']){
                        
                          var top=0;
                          
                                if (json['error']['firstname']) {
					$('#content input[name=\'firstname\']').after('<span id="firstname" class="error"><i class="icon-warning-sign"></i> ' + json['error']['firstname'] + '</span>');
                                          if(top==0){ top= $('#content input[name=\'firstname\']').offset().top;}
                                      }
                                     
                                if (json['error']['lastname']) {
					$('#content input[name=\'lastname\']').after('<span id="lastname" class="error"><i class="icon-warning-sign"></i> ' + json['error']['lastname'] + '</span>');
                                        if(top==0){ top= $('#content input[name=\'lastname\']').offset().top;}  
                               
                                }	
				if (json['error']['address_1']) {
					$('#content input[name=\'address_1\']').after('<span id="address_1" class="error"><i class="icon-warning-sign"></i> ' + json['error']['address_1'] + '</span>');
				 if(top==0){ top= $('#content input[name=\'address_1\']').offset().top;}  
                               
                                }
                                if (json['error']['address_2']) {
					$('#content input[name=\'address_2\']').after('<span id="address_2" class="error"><i class="icon-warning-sign"></i> ' + json['error']['address_2'] + '</span>');
				 if(top==0){ top= $('#content input[name=\'address_2\']').offset().top;}  
                               
                                    }
				
				if (json['error']['city']) {
					$('#content input[name=\'city\']').after('<span id="city" class="error"><i class="icon-warning-sign"></i>' + json['error']['city'] + '</span>');
				 if(top==0){ top= $('#content input[name=\'city\']').offset().top;}  
                               
                                }	
				
				if (json['error']['postcode']) {
					$('#content input[name=\'postcode\']').after('<span id="postcode" class="error"><i class="icon-warning-sign"></i>' + json['error']['postcode'] + '</span>');
                                             if(top==0){ top= $('#content input[name=\'postcode\']').offset().top;}  
                               

                                }	
				
				if (json['error']['country']) {
					$('#content select[name=\'country_id\']').after('<span id="country_id" class="error"><i class="icon-warning-sign"></i> ' + json['error']['country'] + '</span>');
				 if(top==0){ top= $('#content input[name=\'email\']').offset().top;}  
                               

                                }	
				
				if (json['error']['telephone']) {
					$('#content input[name=\'telephone\']').after('<span id="telephone" class="error"><i class="icon-warning-sign"></i> ' + json['error']['telephone'] + '</span>');
			 if(top==0){ top= $('#content input[name=\'telephone\']').offset().top;}  
                               
                                }
                               
                                if (json['error']['zone']) {
					$('#content select[name=\'zone_id\']').after('<span id="zone_id" class="error"><i class="icon-warning-sign"></i> ' + json['error']['zone'] + '</span>');
				 if(top==0){ top= $('#content select[name=\'zone_id\']').offset().top;}  
                               
                                    }
                                   
                                   $('#content').animate({ scrollTop:top }, 'slow');  																																
			}else {
                               
                                parent.$("#dialog").dialog('close'); 
                            }
                        
                        },
                              error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
	});	
});
</script>






