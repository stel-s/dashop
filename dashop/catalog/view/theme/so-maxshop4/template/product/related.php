<?php
if ($products):
global $config, $loader, $registry, $settings,$db;
    $store_id = $config->get('config_store_id');

	if ($store_id == 0) {
        $soconfig_pages = $config->get('soconfig_pages');
    } else {
        $soconfig_pages = $config->get('soconfig_pages_store');
		$text_product = array(
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
	$soconfig_days = $soconfig_pages["days"];
	$secondimg = $soconfig_pages["secondimg"];	
?>

    <!-- Products widgets desktop-->
    <div class="module related products-list grid">
            <h3 class="modtitle">
                <span><?php echo $text_related; ?></span>
            </h3>
            <div class="releate-products <?php if(count($products) >4) echo "releate-products-slider";?>">
				<!-- Products list -->
				<?php $j=0; $total_pros = count($products); $k = 0; $nb_row = 4; 
				 
                foreach ($products as $product) :
					$k++;
                    $loader->model('catalog/product');
					$model = $registry->get('model_catalog_product');
					$product_info = $model->getProduct($product['product_id']);
                    $loader->model('tool/image');
                    $model_resize = $registry->get('model_tool_image');
				
				if ($k%$nb_row == 1 || $nb_row == 1) { ?>
				<div class="product-item-container">	
                <?php } ?> 
				
					<div class="product-item">
				      <div class="media">
						 <div class="media-left product-image-container <?php if($secondimg =='2' && isset($product['thumb2'])){ echo "second_img";} ?> ">
							      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
							      <?php if( $secondimg =='2' && isset($product['thumb2']) && !empty($product['thumb2'])) :?>
							      <img src="<?php echo $product['thumb2']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img_0 img-responsive" />
							      <?php endif;?>
						      
						 <!--- New ------->
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
						 
						  <!------SALE ---------->
						  <?php if ($product['special']) : ?>
						      <?php if (!isset($sale_status) || ($sale_status != 0)) : ?>
							      <span class="label label-sale"><?php echo (isset($sale_text) ? $sale_text : 'SALE'); ?></span>
							      <?php endif; ?>
						      <?php endif; ?>
						 
						 
						      <?php if (!isset($quick_status) || $quick_status != 0) : ?>
							      <!--full quick view block-->
								      <?php $our_url = $this->registry->get('url'); ?>
								      <a class="quickview iframe-link " data-fancybox-type="iframe"  href="<?php echo $our_url->link('product/quickview','product_id='.$product['product_id']);?>">  <?php echo (isset($quick_view_text) ? $quick_view_text : 'QuickView'); ?></a>
							      <!--end full quick view block-->
						      <?php endif; ?>
						</div> 
				     
				      
				      <div class="media-body">
					<div class="caption">
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
						<h4><a class="preview-image" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
						<?php if (!isset($product_catalog_mode) || $product_catalog_mode != 1) : ?>
						<div class="price">
						       <?php if ($product['price']) : ?>
							      <?php if (!$product['special']) { ?>
								     <span class="price-new"><?php echo $product['price']; ?></span>
							      <?php } else { ?>
								     <span class="price-old"><?php echo $product['price']; ?></span>
								     <span class="price-new"><?php echo $product['special']; ?></span>
							      <?php } ?>
						       <?php endif; ?>
						</div>
						<?php endif; ?>
					</div>
					 <div class="button-group">
						<button class="addToCart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span><?php echo $button_cart; ?></span></button>
						<button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
						<button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
					 </div>
				      </div>
				 </div>
			    </div>
							
                <?php if ($k%$nb_row == 0 || $k == $total_pros) { ?>
			</div>
			<?php } ?>	        
                   
		
             <?php endforeach; ?>

            
                </div>

        </div>

<div class="line-divider"></div>

<!-- end Products widgets desktop-->
<?php endif; ?>


<script>// <![CDATA[
jQuery(document).ready(function($) {
		$('.releate-products-slider').owlCarousel2({
			pagination: false,
			center: false,
			nav: true,
			dots: false,
			loop: true,
			margin: 25,
			navText: [ 'prev', 'next' ],
			slideBy: 1,
			autoplay: false,
			autoplayTimeout: 2500,
			autoplayHoverPause: true,
			autoplaySpeed: 800,
			startPosition: 0, 
			responsive:{
				0:{
					items:1
				},
				480:{
					items:1
				},
				768:{
					items:1
				},
				1200:{
					items:1
				}
			}
		});	  
	});
// ]]></script>
