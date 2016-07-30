<?php
if (count($currencies) > 1) :
?>

<div class="form-group currencies-block">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
	<a class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
        <span class="icon icon-credit "></span>
        <?php foreach ($currencies as $currency) : if ($currency['code'] == $code) :  echo $currency['title']; endif;  endforeach;?>
        <span class="fa fa-angle-down"></span>
    </a>
	<ul class="dropdown-menu btn-xs" >
		<?php foreach ($currencies as $currency) : ?>
		<?php
		 if ($currency['symbol_left']) {
		 $currency_symbol = $currency['symbol_left'];
		 } else {
		 $currency_symbol = $currency['symbol_right'];
		 }
		 ?>
			<li >
				<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency').submit();">(<?php echo $currency_symbol; ?>)
					&nbsp;<?php echo $currency['title']; ?>
				</a>
			</li>
		<?php endforeach; ?>
	</ul>
	<input type="hidden" name="code" value="" />
	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
</div>



<?php endif; ?>









