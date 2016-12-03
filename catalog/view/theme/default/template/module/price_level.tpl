<div class="menu_filter_price">
    <div class="menu_filter_price_header">
         <?php echo $heading_title; ?>
    </div>

    <div class="menu_filter_price_top">
    </div>

    <div class="menu_filter_price_center">
        <ul>
              <?php 
              $item=0;
              foreach($menu_price as $price) { 
                $item++;
              ?>
              <li <?php if($last==$item){ echo "class='last'"; }?>><a href="<?php echo $price['href'];?>"><?php echo $price['name'];?></a></li>
              <?php } ?>
               </ul>
    </div>

    <div class="menu_filter_price_bottom">
    </div>
</div>



