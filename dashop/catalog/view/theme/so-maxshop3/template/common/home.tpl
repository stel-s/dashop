<?php
    echo $header; 
    global $config;
    $lang = $config->get('config_language_id');
	
?>


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
      
        <?php if ($content_top) : ?>
            <?php echo $content_top ?> 
        <?php endif; ?>
	   <?php echo $content_block2 ?>
	   <?php echo $content_block3 ?>
    </div>
    <?php echo $column_right; ?>
	</div>
</div>

<?php if (trim($content_block1)) : ?>
<div class="so-spotlight1">
    <div class="container">
        <div class="row">
            <?php echo $content_block1 ?>
        </div>
    </div> 
</div>
<?php endif; ?>


<?php echo $footer; ?>