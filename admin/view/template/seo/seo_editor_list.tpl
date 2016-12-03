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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
       </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
                <td class="left"><?php echo $column_type; ?></td>
                <td class="left"><?php echo $column_name; ?></td>
                <td class="right"><?php echo $column_keyword; ?></td>
                <td class="right"><?php echo $column_meta_keyword; ?></td>
                <td class="right"><?php echo $column_meta_description; ?></td>
                <td class="left"><?php echo $column_tags; ?></td>
                <td class="left"><?php echo $column_tags; ?></td>
           </tr>
          </thead>
          <tbody>
              <tr class="filter">
                  <td><select name="filter_type">
                          <option value="0"><?php echo $entry_all; ?></option>
                          <option value="1"><?php echo $entry_category; ?></option>
                          <option value="2"><?php echo $entry_product; ?></option>
                          <option value="3"><?php echo $entry_tags; ?></option>
                      </select>
                   </td>
                <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
                <td><input type="text" name="filter_keyword" value="<?php echo $filter_keyword; ?>" /></td>
                <td><input type="text" name="filter_meta_keyword" value="<?php echo $filter_meta_keyword; ?>" /></td>
                <td><input type="text" name="filter_meta_description" value="<?php echo $filter_meta_description; ?>" /></td>
                <td><input type="text" name="filter_tags" value="<?php echo $filter_tags; ?>" /></td>
               <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
                
           </tr>
            <?php if ($seo_editors) { ?>
            <?php foreach ($seo_editors as $seo_editor) { ?>
            <tr>
             <td class="left"><?php echo $seo_editor['type']; ?></td>
              <td class="left"><?php echo $seo_editor['name']; ?></td>
              <td class="right"><?php echo $seo_editor['keyword']; ?></td>
              <td class="right"><?php echo $seo_editor['meta_keyword']; ?></td>
              <td class="right"><?php echo $seo_editor['meta_description']; ?></td>
              <td class="left"></td>
              <td class="right"><?php foreach ($seo_editor['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=seo/seo_editor&token=<?php echo $token; ?>';
	
        var filter_type = $('select[name=\'filter_type\']').attr('value');
	
        if (filter_type) {
		url += '&filter_type=' + encodeURIComponent(filter_type);
	}
	var filter_name= $('input[name=\'filter_name\']').attr('value');
	
        if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
        var filter_keyword= $('input[name=\'filter_keyword\']').attr('value');
	
        if (filter_keyword) {
		url += '&filter_keyword=' + encodeURIComponent(filter_keyword);
	}
        
	var filter_meta_keyword = $('input[name=\'filter_meta_keyword\']').attr('value');
	
	if (filter_meta_keyword) {
		url += '&filter_meta_keyword=' + encodeURIComponent(filter_meta_keyword);
	}
        var filter_tags = $('input[name=\'filter_tags\']').attr('value');
	
	if (filter_tags) {
		url += '&filter_tags=' + encodeURIComponent(filter_tags);
	}
	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<?php echo $footer; ?>
