<div class="content">
    <h2><?php echo $heading_title; ?></h2>
    <p><?php echo $text_email; ?></p>
    <h3><?php echo $text_your_email; ?></h3>
    <table class="form">
        <tr>
            <td><?php echo $entry_email; ?></td>
            <td><input type="text" name="email" value="" /></td>
        </tr>
    </table>
</div>
<div class="forgotten_buttons">
    <a id="button-back" class="button_medium"><?php echo $button_back; ?></a>
    <a id="buttion-continue" class="button_medium"><?php echo $button_continue; ?></a>
</div>
 <script type="text/javascript">
// Checkout
$('#buttion-continue').live('click', function() {
        $.ajax({
		url: 'index.php?route=checkout/forgotten/validate',
                type: 'post',
		data: $('input[name=email]'),
		dataType: 'json',
		beforeSend: function() {
			
			$('.wait').css('display','block');
                    },		
		complete: function() {
			
			$('.wait').css('display','none');
		},			
		success: function(json) {
                        if(json['error']){
                        
                        html='';
                        html+='<div style="display:none;" id="dialog-warning" title="Basic dialog">';
                        html+='<h2>Invalid access details.</h2>';
                        html+='<i class="icon-exclamation-sign icon-2x"></i>';
                        html+='  <div class="content_dialog">';
                        html+=  json['error']['warning'];
                        html+=' </div>';
                        html+='</div>';
                        $('body').after(html);
                        $('#dialog-warning').css('display',true);
                                $('#dialog-warning').dialog({
                                        buttons: {
                                        "Ok": function(){ $(this).dialog("close"); }
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
                                } else{
                                
                               
                                        if(json['redirect']){
                                          html='';
                                 html+='<div style="display:none;" id="dialog-successful" title="Basic dialog">';
                                 html+='<h2>Invalid access details.</h2>';
                                 html+='<i class="icon-exclamation-sign icon-2x"></i>';
                                 html+='  <div class="content_dialog">';
                                 html+=  json['error']['warning'];
                                 html+=' </div>';
                                 html+='</div>';
                                 $('body').after(html);
                                        
                                        $('#dialog-successful').dialog({
                                         close:function(){
                                                $.ajax({
                                                    url: 'index.php?route=checkout/login',
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
$('#button-back').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/login',
		dataType: 'html',
		beforeSend: function() {
		  $('.wait').css('display','block');
              },		
		complete: function() {
			
			  $('.wait').css('display','none');
		},			
		success: function(html) {
			$('.warning, .error').remove();
                         parent.$('#dialog').dialog({ height:'350'}).dialog('open');
                     
                        $('#content').html(html);
                        
			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
</script>    
 