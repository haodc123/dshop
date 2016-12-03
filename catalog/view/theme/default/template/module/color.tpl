<!-- color-begin -->		
<?php if($colors){ ?>
<div class="menu_color">
    <div class="menu_color_header">
        <?php echo $heading_title; ?>
    </div>

    <div class="menu_color_top">
    </div>

    <div class="menu_color_center">
        <ul>
            <?php foreach($colors as $color){ ?>
            <li>
                <a  style=" background-color: <?php echo $color['color']; ?>;" class="menu_color_1" href="<?php echo $color['href']; ?>" title="<?php echo $color['name']; ?>">
                </a>
            </li>
            <?php } ?>
            
            </ul>
    </div>

    <div class="menu_color_bottom">
    </div>
</div>
<?php } ?>
<!-- color-end -->




