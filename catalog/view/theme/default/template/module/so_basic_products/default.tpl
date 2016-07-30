<?php
$tag_id = 'so_basic_products_'.$moduleid.'_'.rand().time();
$class_respl0 = 'preset00-'.$nb_column0.' preset01-'.$nb_column1.' preset02-'.$nb_column2.' preset03-'.$nb_column3.' preset04-'.$nb_column4;
?>
<div class="module <?php echo $class_suffix; ?>">
	<?php if($disp_title_module) { ?>
		<h3><?php echo $head_name; ?></h3>
	<?php } ?>
	<div class="so-basic-product" id="<?php echo $tag_id ?>">
		<?php if(!empty($products)){?>
		<div class="item-wrap row cf <?php echo $class_respl0; ?>">
			 <?php $j = 0; foreach($products as $product)  { $j++; ?>
			 <div class="item-element ">
				<div class="item-inner">
					<div class="product-thumb transition">
					<?php if($product_image) { ?>
					  <div class="image"><a href="<?php echo $product['href'];?>" target="<?php echo $item_link_target;?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
					<?php } ?>
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
						<?php if ($product['rating']) { ?>
						<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($product['rating'] < $i) { ?>
						  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } ?>
						  <?php } ?>
						</div>
						<?php } ?>
						<?php if ($display_price) { ?>
							<?php if ($product['price']) { ?>
							<p class="price">
							  <?php if (!$product['special']) { ?>
							  <?php echo $product['price']; ?>
							  <?php } else { ?>
							  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
							  <?php } ?>
							  <?php if ($product['tax']) { ?>
							  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
							  <?php } ?>
							</p>
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
								<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
							<?php } ?>
							<?php if ($display_wishlist) { ?>
								<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
							<?php } ?>
							<?php if ($display_compare) { ?>
								<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
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
			<div class="<?php echo $clear; ?>"></div>
			 <?php 
			 } ?>
		</div>
		<?php }else{ 
			echo $text_noproduct;
		}?>
	</div>
</div>
