<?php
    global $config, $loader, $registry, $db, $session;
	$lang = $config->get('config_language_id');
    $store_id = $config->get('config_store_id');
	$template = $config->get('config_template');
	$short_by = !empty ($pagination) ? 'col-sm-7 col-xs-12' : 'col-sm-10 col-xs-12';
	$devices = array(
		'md' => ' Desktops',
		'sm' => ' Tablets',
		'xs' => ' Phones',
	);
    if ($store_id == 0) {
        $soconfig_pages = $config->get('soconfig_pages');
		
    } else {
        $soconfig_pages = $config->get('soconfig_pages_store');

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
		
		
    }
	
	
/*VARIABLES*/	
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
	
	
?>


<?php
 if ($type_show == 'slider') { ?>
		<div class="ltabs-items-inner owl2-carousel  ltabs-slider ">
<?php }else { ?>
		<div class="ltabs-items-inner <?php echo  $type_show == 'loadmore' ? $class_ltabs. ' '. $effect : '  ' ;?>">
<?php } ?>

<?php 
	if (!empty($child_items)) {
		$i = 0 ;$k = isset($rl_loaded ) ? $rl_loaded : 0; $count = count($child_items);
		foreach ($child_items as $product) {
			$loader->model('catalog/product');
			$model = $registry->get('model_catalog_product');
			$product_info = $model->getProduct($product['product_id']);
			$i++; $k++; ?>
			
			<?php if  ($type_show == 'slider' && ($i % $nb_rows == 1 || $nb_rows == 1)) { ?>
				<div class="ltabs-item ">
			<?php } 
			if ($type_show == 'loadmore'){ ?>
				<div class="ltabs-item new-ltabs-item" >
			<?php } ?>
			<?php ?>
				<div class="item-inner product-thumb transition">
				 <div class="product-image-container <?php if(isset($soconfig_pages["secondimg"]) && $soconfig_pages["secondimg"] =='2' && isset($product['thumb2'])){ echo "second_img";} ?>">
				    <?php if($product_image){ ?>
						  <div class="image">
							 <a class="rspl-image" 
							    href="<?php echo $product['href'] ?>" target="<?php echo $item_link_target ?>"
							    title="<?php echo $product['name'] ?>">
								 <img src="<?php echo $product['thumb']?>" alt="<?php echo $product['name'] ?>">
								
								<?php  if(!empty($product['thumb2'])&& $soconfig_pages["secondimg"] =='2' && isset($product['thumb2'])) :?>
									<img src="<?php echo $product['thumb2']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img_0 img-responsive" />
								<?php endif;?>
								
							 </a>
						 </div>
					 <?php }?>
					 
					 <!--New Label-->
					<?php if (!isset($new_status) || ($new_status != 0)) : ?>
					<?php
					$day_range = 10;
					if ($soconfig_days == '') {
						$days = $day_range;
					} else {
						$days = $soconfig_days;
					}
					$day_number_to_range = date( "Y-m-d" ,  strtotime("-$days day")  );
					if ($product_info['date_available'] >= $day_number_to_range) :
						?>
						<span class="label label-new"><?php echo (isset($new_text) ? $new_text : 'NEW'); ?></span>
						<?php endif; ?>
					<?php endif; ?>
				
					<!--Sale Label-->
					<?php if ($product['special']) : ?>
					<?php if (!isset($sale_status) || ($sale_status != 0)) : ?>
						<span class="label label-sale"><?php echo (isset($sale_text) ? $sale_text : 'SALE'); ?></span>
						<?php endif; ?>
					<?php endif; ?>
					 
					<?php if (!isset($quick_status) || $quick_status != 0) : ?>
					 <!--full quick view block-->
						<?php $our_url = $this->registry->get('url'); ?>
						<a class="quickview iframe-link hidden-md hidden-sm hidden-xs" data-fancybox-type="iframe"  href="<?php echo $our_url->link('product/quickview','product_id='.$product['product_id']);?>">  <?php echo (isset($quick_view_text) ? $quick_view_text : 'QuickView'); ?></a>
					<!--end full quick view block-->
					<?php endif; ?>
					
				 </div>
					
					
					<div class="caption clearfix">
						<?php if ($display_title == 1) { ?>
							<h4>
								<a href="<?php echo $product['href'] ?>" 
								   title="<?php echo $product['name'] ?>" target="<?php echo $item_link_target ?>">
								   <?php  echo $product['name'];?>
								</a>
							</h4>
						<?php } ?>
	 
						 <?php if (isset($soconfig_pages["rating_status"]) && $soconfig_pages["rating_status"] != 0) : ?>
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
						<?php endif; ?>
							
						<?php if ($product['price']) { ?>
						<p class="price">
						  <?php if (!$product['special']) { ?>
						 <span class="price-new">  <?php echo $product['price']; ?></span>
						  <?php } else { ?>
						  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
						  <?php } ?>
						  <?php if ($product['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
						  <?php } ?>
						</p>
						<?php } ?>
						<?php if ($display_description == 1) { ?>
							<p><?php echo  html_entity_decode($product['description']); ?></p>
						<?php } ?>
						
					</div>
					<div class="button-group">
						<button class="addToCart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs "><?php echo $button_cart; ?></span></button>
						<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
						<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
					</div>
				</div>
			<?php if  ($type_show == 'slider' && ($i % $nb_rows == 0 || $i == $count)) { ?>	
				</div>
			<?php } 
			if ($type_show == 'loadmore'){ ?>
				</div>
			<?php } ?>

			<?php 
			if($type_show == 'loadmore') {
				$clear = 'clr1';
				if ($k % 2 == 0) $clear .= ' clr2';
				if ($k % 3 == 0) $clear .= ' clr3';
				if ($k % 4 == 0) $clear .= ' clr4';
				if ($k % 5 == 0) $clear .= ' clr5';
				if ($k % 6 == 0) $clear .= ' clr6';
				?>
				<div class="<?php echo $clear; ?>"></div>
			<?php  
			} ?>
		<?php
		}
	} ?>
</div>
<?php
 if ($type_show == 'slider') { ?>
<script type="text/javascript">
	jQuery(document).ready(function($){
		var $tag_id = $('#<?php echo $tag_id; ?>'), 
		parent_active = 	$('.items-category-<?php echo $tab_id; ?>', $tag_id),
		total_product = parent_active.data('total'),
		tab_active = $('.ltabs-items-inner',parent_active),
		nb_column0 = <?php echo $nb_column0; ?>,
		nb_column1 = <?php echo $nb_column1; ?>,
		nb_column2 = <?php echo $nb_column2; ?>,
		nb_column3 = <?php echo $nb_column3; ?>,
		nb_column4 = <?php echo $nb_column4; ?>;
		 tab_active.owlCarousel2({
			nav: <?php echo $display_nav ; ?>,
			dots: false,	
			margin: 25,
			loop:  <?php echo $display_loop ; ?>,
			autoplay: false,
			autoplayHoverPause: <?php echo $pausehover ; ?>,
			autoplayTimeout: <?php echo $autoplay_timeout ; ?>,
			autoplaySpeed: <?php echo $autoplay_timeout ; ?>,
			navRewind: true,
			navText: [ '', '' ],			
		    responsive: {
					0: {
						items: nb_column4,
						nav: total_product <= nb_column4 ? false : ((<?php echo $display_nav ; ?>) ? true: false),
					},
					480: {
						items: nb_column3,
						nav: total_product <= nb_column3 ? false : ((<?php echo $display_nav ; ?>) ? true: false),
					},
					768: {
						items: nb_column2,
						nav: total_product <= nb_column2 ? false : ((<?php echo $display_nav ; ?>) ? true: false),
					},
					992: {
						items: nb_column1,
						nav: total_product <= nb_column1 ? false : ((<?php echo $display_nav ; ?>) ? true: false),
					},
					1200: {
						items: nb_column0,
						nav: total_product <= nb_column0 ? false : ((<?php echo $display_nav ; ?>) ? true: false),
					},
				}
		 });
		
	});
</script>
<?php } ?>
