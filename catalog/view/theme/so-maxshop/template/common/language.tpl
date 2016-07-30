<?php if (count($languages) > 1) :?>

<div class="form-group languages-block ">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="bt-language">
		<a class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
			<?php foreach ($languages as $language) { ?>
				<?php if ($language['code'] == $code) { ?>
					<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
					<span><?php echo $language['name']; ?></span> 
				<?php } ?>
			<?php } ?>
			<span class="fa fa-angle-down"></span>
		</a>
		<ul class="dropdown-menu">
		  <?php foreach ($languages as $language) { ?>
		  <li> 
				<a onclick="$('input[name=\'code\']').attr('value', '<?php echo $language['code']; ?>'); $('#bt-language').submit();">
                    <img class="image_flag" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                    <?php echo $language['name']; ?>
                </a>
			</li>
		  <?php } ?>
		</ul>
	  
	  <input type="hidden" name="code" value="" />
	  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
</div>


<?php endif; ?>
