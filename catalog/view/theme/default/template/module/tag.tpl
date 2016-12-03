<div class="content_tag">

    <h1 class="line"><?php echo $heading_title; ?></h1>

    <ul>
        <?php foreach ($tags as $tag) { ?>
        <li>
            <a title="<?php echo $tag['name']; ?>" href="<?php echo $tag['href']; ?>"><?php echo $tag['name']; ?></a>
        </li>

        <?php }?>
    </ul>

</div>

