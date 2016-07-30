<?php echo $header; ?>
<?php
     global $config, $loader, $registry, $db, $session;
	$lang = $config->get('config_language_id');
    $store_id = $config->get('config_store_id');
	$template = $config->get('config_template');
	$short_by = !empty ($pagination) ? 'col-sm-7 col-xs-12' : 'col-sm-10 col-xs-12';
	$devices = array(
		'lg' => ' Desktops',
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
	$secondimg = $soconfig_pages["secondimg"];
/*SET CATEGORY COLUMN*/	
	$soconfig_pages["product_catalog_column_lg"] = 4;
?>

<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	
	<div class="row">
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
	
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		<h2><?php echo $heading_title; ?></h2>
        <div class="products-category">
		
		<?php if ($products) { ?>
			<!-- Filters -->
			<div class="product-filter filters-panel">
			  <div class="row">
				<div class="col-md-2 hidden-sm hidden-xs">
					<div class="view-mode">
						<div class="list-view">
							<button class="btn btn-default grid <?php if(isset($soconfig_pages['product_catalog_mode']) && $soconfig_pages['product_catalog_mode'] == '0') { echo 'active'; } ?>" data-view="grid" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
							<button class="btn btn-default list <?php if(isset($soconfig_pages['product_catalog_mode']) && $soconfig_pages['product_catalog_mode'] == '1') { echo 'active'; } ?>" data-view="list" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
						</div>
					</div>
				</div>
				<div class="short-by-show form-inline text-right <?php echo $short_by;?>">
					<div class="form-group">
						<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
						<select id="input-sort" class="form-control" onchange="location = this.value;">
						  <?php foreach ($sorts as $sorts2) { ?>
						  <?php if ($sorts2['value'] == $sort . '-' . $order) { ?>
						  <option value="<?php echo $sorts2['href']; ?>" selected="selected"><?php echo $sorts2['text']; ?></option>
						  <?php } else { ?>
						  <option value="<?php echo $sorts2['href']; ?>"><?php echo $sorts2['text']; ?></option>
						  <?php } ?>
						  <?php } ?>
						</select>
					</div>

					<div class="form-group">
						<label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
						<select id="input-limit" class="form-control" onchange="location = this.value;">
						  <?php foreach ($limits as $limits2) { ?>
						  <?php if ($limits2['value'] == $limit) { ?>
						  <option value="<?php echo $limits2['href']; ?>" selected="selected"><?php echo $limits2['text']; ?></option>
						  <?php } else { ?>
						  <option value="<?php echo $limits2['href']; ?>"><?php echo $limits2['text']; ?></option>
						  <?php } ?>
						  <?php } ?>
						</select>
					</div>
					<?php if (isset($soconfig_pages["lstcompare_status"]) && $soconfig_pages["lstcompare_status"] == 1){ ;?>
						<div class="product-compare form-group" style="margin: 0 10px"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
					<?php } ?>
				</div>
				<?php if (!empty($pagination)){?>
					<div class="box-pagination col-sm-3 text-right"><?php echo $pagination; ?></div>
				<?php }?>
			  </div>
			</div>
			<!-- //end Filters -->
	
		<!--Changed Listings-->
		<div class="products-list row <?php echo ($soconfig_pages['product_catalog_mode']) ? 'list' : 'grid'?>">
        <?php 
		$device_res  ='';
		foreach ($devices as $subfix => $device) {
			$device_res .=  'col-'.$subfix.'-'.ceil(12/$soconfig_pages["product_catalog_column_".$subfix] ).' ';
		}
		
		foreach ($products as $idproduct =>$product) { 
			$loader->model('catalog/product');
			$model = $registry->get('model_catalog_product');
			$product_info = $model->getProduct($product['product_id']);
			
			/*special end date output*/
			$query_date = $db->query("SELECT date_end FROM ".DB_PREFIX."product_special WHERE product_id='".(int)$product_info['product_id']."'");
			if ($query_date->rows) {
				$special_end_date = $query_date->row["date_end"];
			} else {
				$special_end_date = false;
			}

			$limit = 700;
			$full_description = strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'));
			$product_description_short = (strlen($product_info['description']) > $limit ? utf8_substr($full_description, 0, $limit) . '...' : $full_description);
			/*special end date output*/
			if ((float)$product_info['special']) {
				if (!isset($discount_status) || $discount_status != 0) {
					$discount = '<span class="label label-percent">-'.round((($product_info['price'] - $product_info['special'])/$product_info['price'])*100, 0).'%</span>';
				} else {$discount = false;}
			} else {
				$discount = false;
			}
		
		?>
        <div class="product-layout <?php echo $device_res;?>">
			<div class="product-item-container">
				<div class="left-block">
					<div class="product-image-container <?php if($secondimg =='2' && isset($product['thumb2'])){ echo "second_img";} ?> ">
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
						<?php if( $secondimg =='2' && isset($product['thumb2']) && !empty($product['thumb2'])) :?>
						<img src="<?php echo $product['thumb2']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img_0 img-responsive" />
						<?php endif;?>
					</div>
					<!--countdown box-->
					<?php include('catalog/view/theme/'.$template.'/template/product/countdown.php'); ?>
					<!--end countdown box--
				
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
							<a class="quickview iframe-link visible-lg" data-fancybox-type="iframe"  href="<?php echo $our_url->link('product/quickview','product_id='.$product['product_id']);?>">  <?php echo (isset($quick_view_text) ? $quick_view_text : 'QuickView'); ?></a>
						<!--end full quick view block-->
					<?php endif; ?>
				</div>
				<!-- end left block -->
            
				<div class="right-block">
					<div class="caption">
					<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
					
					<?php if (isset($rating_status) && $rating_status!= 0) : ?>
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
					<div class="price">
					  <?php if (!$product['special']) { ?>
					  <span class="price-new"><?php echo $product['price']; ?></span>
					  <?php } else { ?>
					  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
					  <?php } ?>
					  <?php if ($product['tax']) { ?>
					  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
					  <?php } ?>
						<?php echo $discount; ?>    
					  
					</div>
					<?php } ?>
					
					<div class="description <?php if (!isset($lstdes_status) || $lstdes_status != 1) : ?> item-desc <?php endif; ?>">
						<p><?php echo $product['description']; ?></p>
					</div>
					
				  </div>

				  <div class="button-group">
					<button class="addToCart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs"><?php echo $button_cart; ?></span></button>
					<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
					<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				  </div>
			   
				</div><!-- right block -->

			</div>
        </div>
		
        <?php } ?>
	</div>
	<!--// End Changed listings-->
	
	<!-- Filters -->
	<div class="product-filter product-filter-bottom filters-panel" style="float: left; width: 100%;">
	  <div class="row">
		<div class="col-md-2 hidden-sm hidden-xs">
			<div class="view-mode">
				<div class="list-view">
					<button class="btn btn-default grid <?php if(isset($soconfig_pages['product_catalog_mode']) == '0') { echo 'active'; } ?>" data-view="grid" ><i class="fa fa-th-large"></i></button>
					<button class="btn btn-default list <?php if(isset($soconfig_pages['product_catalog_mode']) == '1') { echo 'active'; } ?>" data-view="list"><i class="fa fa-th-list"></i></button>
				</div>
			</div>
		</div>
	   <div class="short-by-show text-center <?php echo $short_by;?>">
			<div class="form-group" style="margin: 7px 10px"><?php echo $results; ?></div>
			<?php if (isset($soconfig_pages["lstcompare_status"]) && $soconfig_pages["lstcompare_status"] == 1){ ;?>
				<div class="product-compare form-group" style="margin: 0 10px"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
			<?php } ?>
		</div>
		<?php if (!empty($pagination)){?>
			<div class="box-pagination col-md-3 col-sm-4 text-right"><?php echo $pagination; ?></div>
		<?php }?>
		
	  </div>
	</div>
	<!-- //end Filters -->

	
    <?php } ?>
	
	<?php if (!$products) { ?>
		<div class="form-group">
			<h3><?php echo $text_empty; ?></h3>
			<div class="buttons">
				<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
			</div>
		</div>
	<?php } ?>
  <!--end content-->
		<script type="text/javascript"><!--
		function display(view) {
			$('.products-list').removeClass('list grid').addClass(view);
			$('.list-view .btn').removeClass('active');
			if(view == 'list') {
				$('.products-list .product-layout').addClass('col-lg-12');
				$('.products-list .product-layout .left-block').addClass('col-md-4');
				$('.products-list .product-layout .right-block').addClass('col-md-8');
				$('.products-list .product-layout .item-desc').removeClass('hidden')
				$('.list-view .' + view).addClass('active');
				$.cookie('display', 'list'); 
			}else{
				$('.products-list .product-layout').removeClass('col-lg-12');
				$('.products-list .product-layout .left-block').removeClass('col-md-4');
				$('.products-list .product-layout .right-block').removeClass('col-md-8');
				$('.products-list .product-layout .item-desc').addClass('hidden');
				$('.list-view .' + view).addClass('active');
				$.cookie('display', 'grid');
			}
		}
		
		$(document).ready(function () {
			// Check if Cookie exists
			if($.cookie('display')){
				view = $.cookie('display');
			}else{
				view = '<?php echo isset($soconfig_pages['product_catalog_mode'] )? 'list' : 'grid'?>' ;
			}
			if(view) display(view);
			
			// Click Button
			$('.list-view .btn').each(function() {
				var ua = navigator.userAgent,
				event = (ua.match(/iPad/i)) ? 'touchstart' : 'click';
				$(this).bind(event, function() {
					$(this).addClass(function() {
						if($(this).hasClass('active')) return ''; 
						return 'active';
					});
					$(this).siblings('.btn').removeClass('active');
					$catalog_mode = $(this).data('view');
					display($catalog_mode);
				});
				
			});
		});

		//--></script> 
      <?php echo $content_bottom; ?>
	  </div>
        </div>
	  
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

