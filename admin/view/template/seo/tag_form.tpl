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
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
      <div class="content">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
              <table class="form">
                  <tr>
                      <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                      <td><input type="text" name="name" size="100" value="<?php echo $name; ?>" />
                          <?php if (isset($error_name)) { ?>
                          <span class="error"><?php echo $error_name; ?></span>
                          <?php } ?>
                      </td>
                  </tr>
                  <tr>
                      <td><?php echo $entry_keyword; ?></td>
                      <td><textarea name="keyword" cols="40" rows="5"><?php echo $keyword;?></textarea></td>
                  </tr>
                  <tr>
                      <td><?php echo $entry_meta_keyword; ?></td>
                      <td><textarea name="meta_keyword" cols="40" rows="5"><?php echo $meta_keyword;?></textarea></td>
                  </tr>
                  <tr>
                      <td><?php echo $entry_meta_description; ?></td>
                      <td><textarea name="meta_description" cols="40" rows="5"><?php echo $meta_description;?></textarea></td>
                  </tr>
              </table>

             
          </form>
      </div>
  </div>
</div>
<?php echo $footer; ?>