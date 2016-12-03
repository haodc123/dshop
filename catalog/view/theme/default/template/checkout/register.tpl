<div class="content">
     
    <div class="content-info">
        <p>
            <?php echo $text_content_note;?>
        </p>
    </div>
   
    <div class="content-acount">
        <h2><?php echo $text_your_password; ?></h2>
        <label><?php echo $entry_email; ?><span class="required">*</span></label> 
        <input type="text" name="email" value="" class="large-field"/>
        <label> <?php echo $entry_password; ?><span class="required">*</span></label> 
        <input type="password" name="password" value="" class="large-field"/>
        <label><?php echo $entry_confirm; ?><span class="required">*</span></label>
        <input type="password" name="confirm" value="" class="large-field"/>
    </div>
    <div class="content-detail">
        <h2><?php echo $text_your_details; ?></h2>
        <div id="company-id-display">
            <label><?php echo $entry_company; ?></label> 
            <input type="text" name="company" value=""/>
            <label><?php echo $entry_company_id; ?><span id="company-id-required" class="required">*</span></label>
            <input type="text" name="company_id" value=""/>
        </div>
        
        <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
         <label><?php echo $entry_customer_group; ?></label>
          <?php foreach ($customer_groups as $customer_group) { ?>
            <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
            <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
            <br />
            <?php } else { ?>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
            <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
            <br />
            <?php } ?>
            <?php } ?>
        </div>      
       
        <div id="tax-id-display">
            <label><?php echo $entry_tax_id; ?><span id="tax-id-required" class="required">*</span></label>
            <input type="text" name="tax_id" value="" />
        </div>
       
        <label><?php echo $entry_firstname; ?><span class="required">*</span></label> 
        <input type="text" name="firstname" value="" class="large-field" />

        <label><?php echo $entry_lastname; ?><span class="required">*</span></label> 
        <input type="text" name="lastname" value="" class="large-field" />

        <label><?php echo $entry_phone; ?><span class="required">*</span> </label>
        <input type="text" name="telephone" value="" class="large-field" />
        
        <div style="display: none;">
         <label><?php echo $entry_fax; ?><span class="required">*</span> </label>
        <input type="text"  name="fax" value="" class="large-field" />
        </div>
        
        <label><?php echo $entry_address_1; ?><span class="required">*</span></label> 
        <input type="text" name="address_1" value="" class="large-field" />


        <label><?php echo $entry_address_2; ?></label>
        <input type="text" name="address_2" value="" class="large-field" />

        <label><?php echo $entry_country; ?><span class="required">*</span></label>
        <select name="country_id" class="large-field">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($countries as $country) { ?>
            <?php if ($country['country_id'] == $country_id) { ?>
            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
            <?php } ?>
            <?php } ?>
        </select>

        <label><?php echo $entry_postcode; ?><span id="postcode-required" class="required">*</span></label>
        <input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field" />

        <label><?php echo $entry_city; ?><span class="required">*</span></label>
        <input type="text" name="city" value="" class="large-field" />

        <label><?php echo $entry_zone; ?><span class="required">*</span></label>
        <select name="zone_id" class="large-field" />
        
        </select>
       
         
        </tr>
       
    </div>
    <div class="control">
        <input type="checkbox" name="newsletter" value="1" id="newsletter" />
        <label for="newsletter"><?php echo $entry_newsletter; ?></label>
    </div>
    

    <?php if ($text_agree) { ?>
    <div class="control">
        <input type="checkbox" name="agree" value="1"  checked="checked"/>
        <label for="agree"><?php echo $text_agree1; ?><a onClick="return window.open('<?php echo $href; ?>', '<?php echo $title; ?>', 'width=800, height=400, scrollbars=yes');"> <?php echo $title; ?></a></label>
    </div>
    <div class="buttons">
        <div class="right">
            <input type="submit" value="<?php echo $button_continue; ?>" id="button-register" class="button_medium" />
        </div>
    </div>
    <?php } else { ?>
    <div class="buttons">
        <div class="right">
            <input type="submit" value="<?php echo $button_continue; ?>" id="button-register" class="button_medium" />
        </div>
    </div>
    <?php } ?>
  
 </div>
<script type="text/javascript">
    $(document).ready(function() {
    
        $('input[name=email]').focus(function() {
          
            $('#email').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'email\']').after('<span id="email" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
        $('#email').fadeIn(300);
    }
});
  $('input[name=password]').focus(function() {
   $('#password').fadeOut(300, function(){ $(this).remove();});
         
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'password\']').after('<span id="password" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
         $('#password').fadeIn(300);
}
});
  $('input[name=confirm]').focus(function() {
            $('#confirm').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'confirm\']').after('<span id="confirm" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
    $('#confirm').fadeIn(300);
}
});
  $('input[name=firstname]').focus(function() {
            $('#firstname').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'firstname\']').after('<span id="firstname" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i></i><?php echo $error_empty;?></span>');
    $('#firstname').fadeIn(300);
}
});
  $('input[name=lastname]').focus(function() {
            $('#lastname').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'lastname\']').after('<span id="lastname" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
     $('#lastname').fadeIn(300);
}
});
  $('input[name=telephone]').focus(function() {
           $('#telephone').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'telephone\']').after('<span id="telephone" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
    $('#telephone').fadeIn(300);
}
});
  $('input[name=address_1]').focus(function() {
            $('#address_1').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'address_1\']').after('<span id="address_1" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
     $('#address_1').fadeIn(300);
}
});
  $('select[name=country_id]').focus(function() {
           $('#country_id').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'country_id\']').after('<span id="country_id" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
     $('#country_id').fadeIn(300);
}
});
$('input[name=postcode]').focus(function() {
           $('#postcode').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'postcode\']').after('<span id="postcode" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
    $('#postcode').fadeIn(300);
}
});
$('input[name=city]').focus(function() {
            $('#city').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'city\']').after('<span id="city" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
     $('#city').fadeIn(300);
}
});
$('select[name=zone_id]').focus(function() {
             $('#zone_id').fadeOut(300, function(){ $(this).remove();});
    }).blur(function() {
    if($(this).val() == '') {
        $('#content input[name=\'zone_id\']').after('<span id="zone_id" class="error" style="display:none;"><i class="fa fa-exclamation-triangle"></i><?php echo $error_empty;?></span>');
     $('#zone_id').fadeIn(300);
}
});

});
</script>
<script type="text/javascript"><!--
$('input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
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

$('#button-register').live('click', function() {
        $.ajax({
		url: 'index.php?route=checkout/register/validate',
		type: 'post',
		data: $('#content input[type=\'text\'], #content input[type=\'password\'], #content input[type=\'checkbox\']:checked, #content input[type=\'radio\']:checked, #content input[type=\'hidden\'], #content select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-register').attr('disabled', true);
                        $('.wait').css('display','block');
		},	
		complete: function() {
			$('#button-register').attr('disabled', false); 
			$('.wait').css('display','none');
		},			
		success: function(json) {
                        $('.warning, .error').remove();
			if (json['error']) {
                           
                                if(!json['error']['warning']){
                                
                                 var top=0;
                                if (json['error']['email']) {
                                    $('#content input[name=\'email\']').after('<span id="email" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['email'] + '</span>');
                                    if(top==0){ top=  $('#content').height() + $('#content input[name=\'email\']').offset().top}  
                                       
                               
                                }
                                if(json['error']['password']) {
					$('#content input[name=\'password\']').after('<span id="password" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['password'] + '</span>');
                                        if(top==0){ top=  $('#content').height()+ $('#content input[name=\'password\']').offset().top}  
                                      
                                    
                                }
                                if(json['error']['confirm']) {
					$('#content input[name=\'confirm\']').after('<span id="confirm" class="error"><i class="fa fa-exclamation-triangle"></i>' + json['error']['confirm'] + '</span>');
                                         if(top==0){ top=  $('#content').height() + $('#content input[name=\'confirm\']').offset().top}  
                                }
                                if (json['error']['firstname']) {
					$('#content input[name=\'firstname\']').after('<span id="firstname" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['firstname'] + '</span>');
                                         if(top==0){ top= $('#content').height() + $('#content input[name=\'firstname\']').offset().top}  
                                }
                                if(json['error']['lastname']) {
					$('#content input[name=\'lastname\']').after('<span id="lastname" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['lastname'] + '</span>');
                                        if(top==0){ top=  $('#content').height()+ $('#content input[name=\'lastname\']').offset().top}  
                                }
                                if(json['error']['company_id']) {
					$('#content input[name=\'company_id\']').after('<span id="company_id" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['company_id'] + '</span>');
                                          if(top==0){ top=  $('#content').height() + $('#content input[name=\'company_id\']').offset().top}  
                                }
                                if(json['error']['tax_id']) {
					$('#content input[name=\'tax_id\']').after('<span id="tax_id" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['tax_id'] + '</span>');
                                           if(top==0){ top=  $('#content').height() + $('#content input[name=\'tax_id\']').offset().top}  
                                }
                                if (json['error']['telephone']) {
					$('#content input[name=\'telephone\']').after('<span id="telephone" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['telephone'] + '</span>');
                                         if(top==0){ top=  $('#content').height() + $('#content input[name=\'telephone\']').offset().top}  
                                }
                                if (json['error']['address_1']) {
					$('#content input[name=\'address_1\']').after('<span id="address_1" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['address_1'] + '</span>');
                                          if(top==0){ top=  $('#content').height() + $('#content input[name=\'address_1\']').offset().top}  
                                }
                                if(json['error']['address_2']) {
					$('#content input[name=\'address_2\']').after('<span id="address_2" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['address_2'] + '</span>');
                                          if(top==0){ top=  $('#content').height() + $('#content input[name=\'address_2\']').offset().top} 
                                }
                                if(json['error']['country']) {
					$('#content select[name=\'country_id\']').after('<span id="country_id" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['country'] + '</span>');
                                         if(top==0){ top=  $('#content').height() + $('#content select[name=\'country_id\']').offset().top} 
                                }
                                if (json['error']['postcode']) {
					$('#content input[name=\'postcode\']').after('<span id="postcode" class="error"><i class="fa fa-exclamation-triangle"></i>' + json['error']['postcode'] + '</span>');
                                          if(top==0){ top=  $('#content').height() + $('#content input[name=\'postcode\']').offset().top} 
                                }
                                if (json['error']['city']) {
					$('#content input[name=\'city\']').after('<span id="city" class="error"><i class="fa fa-exclamation-triangle"></i>' + json['error']['city'] + '</span>');
                                         if(top==0){ top=  $('#content').height() + $('#content input[name=\'city\']').offset().top} 
                                }
                                if (json['error']['zone']) {
					$('#content select[name=\'zone_id\']').after('<span id="zone_id" class="error"><i class="fa fa-exclamation-triangle"></i> ' + json['error']['zone'] + '</span>');
				       if(top==0){ top=  $('#content').height() + $('#content select[name=\'zone_id\']').offset().top} 
                                }
                               
                                $('#content').animate({ scrollTop:top }, 'slow');  
                                } else {
                                
                                 html='';
                                html+='<div style="display:none;" id="dialog_register" title="Basic dialog">';
                                html+='<h2>Invalid access details.</h2>';
                                html+='<i class="icon-exclamation-sign icon-2x"></i>';
                                html+='  <div class="content_dialog">';
                                html+= json['error']['warning'];
                                html+=' </div>';
                                html+='</div>';
                                $('body').after(html);
                                $('#dialog_register').dialog({
                                        buttons: {
                                        "Ok": function(){ 
                                        $(this).dialog("close"); 
                                    }
                                    },
                                        show: {effect: 'fade', duration: 350},
                                        hide: {effect: 'fade', duration: 350},
                                        title:  null,
                                        modal: true,
                                        resizable: false,
                                        width: 400,
                                        height: 260,
                                        closeText: 'fechar',
                                        draggable: true,
                                        dialogClass: 'main-dialog-class'
                                    });
                                }																																	
			} else {
                        
                                parent.$("#dialog").dialog('close');         
                                window.location=json['redirect'];
                                             
                                              
                            
                         /*         html='';
                                 html+='<div style="display:none;" id="dialog-sucsess" title="Basic dialog">';
                                 html+='<h2>Invalid access details.</h2>';
                                 html+='<i class="icon-exclamation-sign icon-2x"></i>';
                                 html+='  <div class="content_dialog">';
                                 html+=  '343434343';
                                 html+=' </div>';
                                 html+='</div>';
                                 $('body').after(html);
                                 $('#dialog-sucsess').dialog({
                                         close:function(){
                                                $.ajax({
                                                    url: 'index.php?route=checkout/login',
                                                    dataType: 'html',
                                                    beforeSend: function() {
			
                                                    //$('#button-account').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                                    },		
                                                    complete: function() {
			
                                                  //  $('.wait').remove();
                                                },			
                                                    success: function(html) {
                                                    parent.$('#dialog').dialog({ height:'350'}).dialog('open');
                                                    $('#content').html(html);
                        
			
                                                    },
                                                            error: function(xhr, ajaxOptions, thrownError) {
                                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                    }
                                                });
                                             
                                             },        
                                        
                                        buttons: {
                                        "Ok": function(){ 
                                       $(this).dialog("close");                                      
                                         
                                    }
                                    },
                                        title: '',
                                        modal: true,
                                        resizable: false,
                                        width: 400,
                                        height: 260,
                                        closeText: 'fechar',
                                        draggable: true,
                                        show: 'fade',
                                        hide: 'fade',
                                        dialogClass: 'main-dialog-class'
                                    });
                                     
                               
                        
                        }
                         */
                        }
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
                        
	});	
});
</script>