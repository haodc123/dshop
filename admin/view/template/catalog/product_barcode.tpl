<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
</head>
<body>
    <?php if($mcss) { ?> 
        <?php foreach ($mcss as $mcs) { ?>
            <img alt="barcode" src="<?php echo $base; ?>/barcode_1d.php?text=<?php echo $mcs['mcs']; ?>"><br/>
        <?php } ?>
    <?php } else { ?>
        <?php if($mcs) { ?>
            <img alt="barcode" src="<?php echo $base; ?>/barcode_1d.php?text=<?php echo $mcs; ?>">
        <?php } ?>
   <?php } ?>
</body>
</html>