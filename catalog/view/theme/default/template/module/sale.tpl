<?php  $i=0; foreach ($banners as $banner) { $i++; ?>
<?php if ($i==1 || $i==count($banners)) { ?>

<?php if ($banner['image']) { ?>
<div  class="sale" ><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
<?php } else { ?>
<div  class="sale" ><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></div>
<?php } ?>

<?php } else { ?>

<?php if ($banner['image']) { ?>
<div  class=" sale sale_mid"><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
<?php } else { ?>
<div  class=" sale sale_mid"><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></div>
<?php } ?>

<?php } ?>
<?php } ?>
