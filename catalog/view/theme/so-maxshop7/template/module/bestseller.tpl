<?php
    global $config, $loader, $registry, $db, $session;
	$lang = $config->get('config_language_id');
    $store_id = $config->get('config_store_id');
	$template = $config->get('config_template');
	$short_by = !empty ($pagination) ? 'col-md-7 col-sm-8 col-xs-12' : 'col-sm-10 col-xs-12';
	$devices = array(
		'md' => ' Desktops',
		'sm' => ' Tablets',
		'xs' => ' Phones',
	);
    if ($store_id == 0) {
        $soconfig_pages = $config->get('soconfig_pages');
		$soconfig_general = $config->get('soconfig_general');
    } else {
        $soconfig_pages = $config->get('soconfig_pages_store');
		$soconfig_general = $config->get('soconfig_general_store');
/* PAGE PRODUCT */
		$text_product = array(
			'product_catalog_refine',
			'product_catalog_refine_col_md',
			'product_catalog_refine_col_sm',
			'product_catalog_refine_col_xs',
			'lsttitle_cate_status',
			'lstimg_cate_status',
			'lstcompare_status',
			'product_catalog_mode',
			'product_catalog_column_md',
			'product_catalog_column_sm',
			'product_catalog_column_xs',
			'secondimg',
			'rating_status',
			'lstdescription_status',
			'sale_status',
			'new_status',
			'days',
			'quick_status',
			'discount_status',
			'countdown_status',
		);
		foreach ($text_product as $text) {
			if (isset($soconfig_pages[$store_id][$text])) 		{$soconfig_pages[$text] = $soconfig_pages[$store_id][$text];}
		}
		
		if (isset($soconfig_pages[$lang][$store_id]["sale_text"])) 		{$soconfig_pages[$lang]["sale_text"]  = $soconfig_pages[$lang][$store_id]["sale_text"];}
		if (isset($soconfig_pages[$lang][$store_id]["new_text"])) 		{$soconfig_pages[$lang]["new_text"]  = $soconfig_pages[$lang][$store_id]["new_text"];}
		if (isset($soconfig_pages[$lang][$store_id]["quick_view_text"])) 		{$soconfig_pages[$lang]["quick_view_text"]  = $soconfig_pages[$lang][$store_id]["quick_view_text"];}
		if (isset($soconfig_general[$store_id]['scroll_animation'])) 	{$soconfig_general['scroll_animation'] = $soconfig_general[$store_id]['scroll_animation'];}
		
    }
	
 
/*VARIABLES*/
	global $lazyload_status;	
	$new_text = $soconfig_pages[$lang]["new_text"];
	$sale_text = $soconfig_pages[$lang]["sale_text"];
	$quick_view_text = $soconfig_pages[$lang]["quick_view_text"];
	$sale_status = $soconfig_pages["sale_status"];
	$new_status = $soconfig_pages["new_status"];
	$quick_status = $soconfig_pages["quick_status"];
	$rating_status = $soconfig_pages["rating_status"];
	$discount_status = $soconfig_pages["discount_status"];
	$lsttitle_status = $soconfig_pages["lsttitle_cate_status"];
	$lstdes_status = $soconfig_pages["lstdescription_status"];
	$soconfig_days = $soconfig_pages["days"];
	$secondimg = $soconfig_pages["secondimg"];
	$lazyload_status = $soconfig_general["scroll_animation"];

?>
<div class="bestseller col-md-4 col-sm-6 col-xs-12">
		<div class="bestseller-inner">
				
				<div class="row">
						<h3><?php echo $heading_title; ?></h3>
					<?php foreach ($products as $product) { ?>
					<div class="product-layout ">
						<div class="product-thumb transition">
							<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
							<div class="caption">
								<div class="ratings">
										<div class="rating-box">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
										<?php } else { ?>
										<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
										<?php } ?>
										<?php } ?>
										</div>
								</div>
								<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
								<div class="description"><?php echo $product['description']; ?></div>
								
							<?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                 <span class="price-new"> <?php echo $product['price']; ?></span>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
							</div>
							<div class="button-group">
								<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
								<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
								<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
		</div>
</div>
