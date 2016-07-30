<?php
    echo $header; 
    global $config;
    $lang = $config->get('config_language_id');
	
?>
<?php if (trim($content_top)) : ?>
<div class="so-slider">
    <div class="container">
        <?php echo $content_top ?>
    </div> 
</div>
<?php endif; ?>

<div class="container">
  <div class="row">
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-8 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
		
	   <?php echo $content_block2 ?>
    </div>
    <?php echo $column_right; ?>
	</div>
</div>

<?php if (trim($content_block1)) : ?>
<div class="so-spotlight1">
    <div class="container">
        <div class="row">
            <?php echo $content_block3 ?>
        </div>
    </div> 
</div>
<?php endif; ?>



<?php echo $footer; ?>