<?php
$tag_id = 'so_basic_products_'.$moduleid.'_'.rand().time();
$class_respl0 = 'preset00-'.$nb_column0.' preset01-'.$nb_column1.' preset02-'.$nb_column2.' preset03-'.$nb_column3.' preset04-'.$nb_column4;
?>
<div class="module <?php echo $class_suffix; ?>">
	<?php if($disp_title_module) {?>
		<h3 class="modtitle"><span><?php echo $head_name; ?></span></h3>
	<?php } ?>
	<div class="so-basic-product" id="<?php echo $tag_id ?>">
		<div class="item-wrap row cf products-list grid">
			 <?php $j = 0; foreach($products as $product)  { $j++; ?>
			 <div class="item-element product-layout ">
				<div class="item-inner product-item-container">
					<div class="left-block">
						<div class="product-image-container">
							<?php if($product_image) { ?>
							  <div class="image"><a href="<?php echo $product['href'];?>" target="<?php echo $item_link_target;?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
							<?php } ?>
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
					</div>
					
					<div class="right-block">
						<?php if($display_title || $display_description || $display_price)
						{
						?>
							<div class="caption">
							<?php if($display_title){ ?>
								<h4><a href="<?php echo $product['href']; ?>" target="<?php echo $item_link_target;?>"><?php echo html_entity_decode($product['name']); ?></a></h4>
							<?php } ?>
							<?php if($display_description){ ?>
								<?php echo html_entity_decode($product['description']); ?>
							<?php } ?>
							
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
							
							<?php if ($display_price) { ?>
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
								</div>
								<?php } ?>
							<?php } ?>
							</div>
						<?php 
						}
						?>
							<?php if($display_add_to_cart || $display_wishlist || $display_compare)
							{
							?>
								<div class="button-group">
								<?php if ($display_add_to_cart) { ?>
									<button type="button" class="addToCart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
								<?php } ?>
								<?php if ($display_wishlist) { ?>
									<button type="button" class="wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
								<?php } ?>
								<?php if ($display_compare) { ?>
									<button type="button" class="compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
								<?php } ?>
								</div>
							<?php 
							}
							?>
						
					</div>
				</div>
			 </div>
			  <?php
			$clear = 'clr1';
			if ($j % 2 == 0) $clear .= ' clr2';
			if ($j % 3 == 0) $clear .= ' clr3';
			if ($j % 4 == 0) $clear .= ' clr4';
			if ($j % 5 == 0) $clear .= ' clr5';
			if ($j % 6 == 0) $clear .= ' clr6';
			?>
			
			 <?php 
			 } ?>
		</div>
	</div>
</div>

<script>// <![CDATA[
jQuery(document).ready(function($) {
		$('.item-wrap').owlCarousel2({
			pagination: false,
			center: false,
			nav: true,
			dots: false,
			loop: true,
			margin: 5,
			navText: [ 'prev', 'next' ],
			slideBy: 4,
			autoplay: false,
			autoplayTimeout: 2500,
			autoplayHoverPause: true,
			autoplaySpeed: 800,
			startPosition: 0, 
			responsive:{
				0:{
					items:4
				},
				320:{
					items:1
				},
				480:{
					items:2
				},
				768:{
					items:2
				},
				911:{
					items:3
				},
				1200:{
					items:4
				}
			}
		});	  
	});
// ]]></script>

