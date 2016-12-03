<?php if ($modules) { ?>
    <?php $i=0; foreach ($modules as $module) { $i++; ?>
    <div class="lef-slide <?php if($i%2==0){ ?>last<?php } ?>">
        <?php echo $module; ?>
    </div>
<?php } ?>
<?php } ?>  