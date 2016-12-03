<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/user-group.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php  } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_access; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($permissions as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $access)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
                </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          
          <tr>
            <td><?php echo $entry_modify; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($permissions as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $modify)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_insert; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($permissions as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $insert)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[insert][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[insert][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_edit; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($permissions as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $edit)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[edit][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[edit][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_delete; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($permissions as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $delete)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[delete][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[delete][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
            <tr>
            <td><?php echo $entry_coppy; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($coppies as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $coppy)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[coppy][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[coppy][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_view; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($views as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $view)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[view][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[view][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_export; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($exports as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $export)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[export][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[export][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_barcode; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($barcodes as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $barcode)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[barcode][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[barcode][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_invoice; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($invoices as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $invoice)) { ?>
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[invoice][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[invoice][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($statuss as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $status)) { ?>
                 
                       <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[status][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[status][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_display; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($displaies as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $display)) { ?>
                    <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[display][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[display][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
           <tr>
            <td><?php echo $entry_comfirm; ?></td>
            <td><div class="scrollbox-one">
                <?php $class = 'odd'; ?>
                <?php $i=0; foreach ($comfirms as $permission) { $i++; ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($permission, $comfirm)) { ?>
                    <div class="index"><?php echo $i;?></div>
                       <div class="permission">
                          <input type="checkbox" name="permission[comfirm][]" value="<?php echo $permission; ?>" checked="checked" />
                          <?php echo $permission; ?>
                       </div>
                  
                  <?php } else { ?>
                        <div class="index"><?php echo $i;?></div>
                          <div class="permission">
                          <input type="checkbox" name="permission[comfirm][]" value="<?php echo $permission; ?>" />
                          <?php echo $permission; ?>
                       </div>
                <?php } ?>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
          
           
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 