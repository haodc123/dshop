<div id="bfb<?php echo $module; ?>" class="flexslider">
    <ul class="slides">
        <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
        <li>
            <a href="<?php echo $banner['link']; ?>">
                <img src="<?php echo $banner['image']; ?>" style="width:<?php echo $width; ?>px; height:<?php echo $height; ?>px" alt="<?php echo $banner['title']; ?>"/>
            </a>
        </li>
        <?php } else { ?>
        <li>
            <img src="<?php echo $banner['image']; ?>" style="width:<?php echo $width; ?>px; height:<?php echo $height; ?>px" alt="<?php echo $banner['title']; ?>"/>
        </li>
        <?php } ?>
        <?php } ?>

    </ul>
</div>

<script type="text/javascript">
$(document).ready(function () {
$('#bfb<?php echo $module; ?>').flexslider({
animation: "slide",
controlNav: false,
directionNav: true
});
});
</script>
  