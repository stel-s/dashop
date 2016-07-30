<?php
global $config, $loader, $registry;
$loader->model('custom/general');
$model = $registry->get('model_custom_general');
$layout_id = $model->getCurrentLayout();
$lang = $config->get('config_language_id');
$store_id = $config->get('config_store_id');
$template = $config->get('config_template');

if ($store_id == 0) {
    $soconfig_general = $config->get('soconfig_general');
    $soconfig_social = $config->get('soconfig_social');
} else {
    $soconfig_general = $config->get('soconfig_general_store');
    $soconfig_social = $config->get('soconfig_social_store');
	
/* GENERAL */
	$text_layout = array(
		'cpanel',
		'backtop',
		'copyright',
		'socials_status',
		'footerpayment_status',
		'footerpayment',
		'customblock_status',
	);
	foreach ($text_layout as $text) {
		if (isset($soconfig_general[$store_id][$text])) {$soconfig_general[$text] = $soconfig_general[$store_id][$text];}
	}
		if (isset($soconfig_general[$lang][$store_id]["footer_socials_title"])) 	{$soconfig_general[$lang]["footer_socials_title"]  = $soconfig_general[$lang][$store_id]["footer_socials_title"];}
		if (isset($soconfig_general[$lang][$store_id]["footer_socials"])) 			{$soconfig_general[$lang]["footer_socials"]  = $soconfig_general[$lang][$store_id]["footer_socials"];}
		if (isset($soconfig_general[$lang][$store_id]["custom_html_title"])) 		{$soconfig_general[$lang]["custom_html_title"]  = $soconfig_general[$lang][$store_id]["custom_html_title"];}
		if (isset($soconfig_general[$lang][$store_id]["customblock_html"])) 		{$soconfig_general[$lang]["customblock_html"]  = $soconfig_general[$lang][$store_id]["customblock_html"];}

/* SOCIAL ACCOUNT */
	$text_Social = array(
		'social_status',
		'facebook',
		'twitter',
		'video_code',
	);
	foreach ($text_Social as $text) {
		if (isset($soconfig_social[$store_id][$text])) 		{$soconfig_social[$text] = $soconfig_social[$store_id][$text];}
	}
}

?>
	
	<div class="footer-container">
		<?php if (trim($content_block4)) : ?>
		<div class="footer-top">
				<div class="container">
						<div class="row">
								<div class="col-xs-12">
										<?php echo $content_block4 ?>
								</div>            
						</div>
				</div> 
		</div>
		<?php endif; ?>
		<div class="footer-navbar ">
			<div class="container content">
				<div class="row">
					<?php if (isset($soconfig_general["socials_status"]) && $soconfig_general["socials_status"] != 0) : ?>
					<div class="col-md-3 col-sm-6 col-xs-12 collapsed-block footer-links box-footer">
						<div class="module clearfix">
							<?php if (isset($soconfig_general[$lang]["footer_socials_title"]) && $soconfig_general[$lang]["footer_socials_title"] != '' ) : ?>
							<h3 class="modtitle">
								<?php echo $soconfig_general[$lang]["footer_socials_title"];?>
							</h3>
							<?php endif;?>
							<div  class="modcontent" >
								<?php
								if (isset($soconfig_general[$lang]["footer_socials"]) && $soconfig_general[$lang]["footer_socials"] != '' && is_string($soconfig_general[$lang]["footer_socials"])) :
									echo html_entity_decode($soconfig_general[$lang]["footer_socials"], ENT_QUOTES, 'UTF-8');
								endif;
								?>
							</div>
						</div>
					</div>
					<?php endif; ?>
					
					 <div class="col-sm-6 col-md-3 box-account box-footer">
						<div class="module clearfix">
							<h3 class="modtitle"><?php echo $text_account; ?></h3>
							<div  class="modcontent" >
								<ul class="menu">
									<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
									<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
									<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
									<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
								</ul>
							</div>
						</div>
					</div>

					
					<?php if ($informations) : ?>
						<div class="col-sm-6 col-md-3 box-information box-footer">
							<div class="module clearfix">
								<h3 class="modtitle"><?php echo $text_information; ?></h3>
								<div  class="modcontent" >
									<ul class="menu">
										<?php foreach ($informations as $information) { ?>
										<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
										<?php } ?>
									</ul>
								</div>
							</div>
						</div>
					<?php endif; ?>

					

				  
					<?php if (isset($soconfig_general["customblock_status"]) && $soconfig_general["customblock_status"] != 0) : ?>
					<div class="col-sm-6 col-md-3 collapsed-block box-footer">
						<div class="module clearfix">
							<h3 class="modtitle">
								<?php
								if (isset($soconfig_general[$lang]["custom_html_title"]) && $soconfig_general[$lang]["custom_html_title"] != '' ) :
									echo $soconfig_general[$lang]["custom_html_title"];
								endif;
								?>
							</h3>
							<div  class="modcontent" >
								<?php
								if (isset($soconfig_general[$lang]["customblock_html"]) && $soconfig_general[$lang]["customblock_html"] != '' && is_string($soconfig_general[$lang]["customblock_html"])) :
								echo html_entity_decode($soconfig_general[$lang]["customblock_html"], ENT_QUOTES, 'UTF-8');
								endif;
								?>
							</div>
						</div>
					</div>
					<?php endif; ?>
					
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom-block <?php echo (isset($soconfig_general['homepage_mode']) && $soconfig_general['homepage_mode'] == 'boxed' ? 'boxed_home' : ''); ?>">
			<div class=" <?php echo (isset($soconfig_general['homepage_mode']) && $soconfig_general['homepage_mode'] == 'boxed' ? 'boxed_home' : 'container'); ?>">
				<div class="row">
					<div class="col-sm-5 copyright-text">
						<?php echo (!isset($soconfig_general["copyright"]) || !is_string($soconfig_general["copyright"]) ? $powered : html_entity_decode($soconfig_general["copyright"], ENT_QUOTES, 'UTF-8'));?>
					</div>

					<?php if (isset($soconfig_general["footerpayment_status"]) && $soconfig_general["footerpayment_status"] != 0) : ?>
					<div class="col-sm-7">
						<?php
							if (isset($soconfig_general["footerpayment"]) && $soconfig_general["footerpayment"] != '' && is_string($soconfig_general["footerpayment"])) {
								echo html_entity_decode($soconfig_general["footerpayment"], ENT_QUOTES, 'UTF-8');
							}
						?>
					</div>
					<?php endif; ?>

				</div>

			</div>
		</div>
	</div>
    <!-- //end Footer -->
	
	<?php if(isset($soconfig_general["backtop"]) && $soconfig_general["backtop"] == 1):?>
		<div class="back-to-top"><i class="fa fa-angle-up"></i></div>
	<?php endif; ?>
	
	<?php if( $soconfig_general["cpanel"] ):?>
		<?php include('catalog/view/theme/'.$template.'/template/common/cpanel.php'); ?>
	<?php endif; ?>
	
	<!-- Social widgets -->
	<?php if (!isset($soconfig_social["social_status"]) || $soconfig_social["social_status"] != 0) : ?>
	<div class="social-widgets visible-lg">
		<ul class="items">
			<?php if (isset($soconfig_social["facebook"]) && $soconfig_social["facebook"] != '') : ?>
			<li class="item item-01 facebook">
				<a href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/template/social/facebook.php?account=<?php echo $soconfig_social['facebook']; ?>" class="tab-icon"><span class="fa fa-facebook"></span></a>
				<div class="tab-content">
					<div class="title"><h5>FACEBOOK</h5></div>
					<div class="loading">
						<img src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/images/ajax-loader.gif" class="ajaxloader" alt="loader">
					</div>
				</div>
			</li>
			<?php endif; ?>

			<?php if (isset($soconfig_social["twitter"]) && $soconfig_social["twitter"] != '') : ?>
			<li class="item item-02 twitter">
				<a href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/template/social/twitter.php?account_twitter=<?php echo $soconfig_social['twitter']; ?>" class="tab-icon"><span class="fa fa-twitter"></span></a>
				<div class="tab-content">
					<div class="title"><h5>TWITTER FEEDS</h5></div>
					<div class="loading">
						<img src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/images/ajax-loader.gif" class="ajaxloader" alt="loader">
					</div>
				</div>
			</li>
			<?php endif; ?>

			<?php if (isset($soconfig_social["video_code"]) && $soconfig_social["video_code"] != '') : ?>
			<li class="item item-03 youtube">
				<a href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/template/social/youtubevideo.php?account_video=<?php echo $soconfig_social['video_code']; ?>" class="tab-icon"><span class="fa fa-youtube"></span></a>
				<div class="tab-content">
					<div class="title"><h5>YouTube</h5></div>
					<div class="loading">
						<img src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/images/ajax-loader.gif" class="ajaxloader" alt="loader">
					</div>
				</div>
			</li>
			<?php endif; ?>
		</ul>
	</div>
	<?php endif; ?>
	<!-- //end Social widgets -->

    </div>



</body>
</html>