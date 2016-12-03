<div class="menu_cate">
    <div class="menu_cate_header">
          <?php echo $heading_title; ?>
    </div>
    <div class="menu_cate_top">
    </div>
    <div class="menu_cate_center">
        <ul>
            <?php foreach ($categories as $category) { ?>
            <li>
                <?php if ($category['category_id'] == $category_id) { ?>
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                <?php } else { ?>
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                <?php } ?>
               
            </li>
             <?php if ($category['children']) { ?>
                
                    <?php foreach ($category['children'] as $child) { ?>
                    <li class="cate_children">
                        <?php if ($child['category_id'] == $child_id) { ?>
                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                        <?php } ?>
                    </li>
                    <?php } ?>
                
                <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <div class="menu_cate_bottom">
    </div>
</div>
