<?php
if (!empty($child_items)) {
	$k = isset($rl_loaded ) ? $rl_loaded : 0; 
	$count = count($child_items);
	$i = 0;
	$count = count($child_items);
	if ($type_show == 'slider') { 
		echo '<div class="ltabs-items-inner owl2-carousel ltabs-slider ">';
	} 
	$countItem = count($child_items);
	foreach ($child_items as $item) {
		$i++;$k++; ?>
		<?php if($type_show == 'slider' && ($i % $rows == 1 || $rows == 1)) { ?>
			<div class="ltabs-item ">
        <?php }?>
		  <?php if ($type_show == 'loadmore'){ ?>
		  <div class="spcat-item new-spcat-item">
            <?php } ?>
		
			<div class="item-inner product-thumb transition <?php if($i == $countItem) echo "last-product";?>">
				<?php if($item['thumb'] && $product_image == 1){ ?>
					 <div class="image">
						<a class="lt-image" 
						   href="<?php echo $item['link'] ?>" target="<?php echo $item_link_target ?>"
						    title="<?php echo $item['name'] ?>">
							<img src="<?php echo $item['thumb']?>" alt="<?php echo $item['name'] ?>">
						</a>
					</div>
				<?php }?>
				<div class="caption">
					<?php if ($product_display_title == 1) { ?>
						<h4>
							<a href="<?php echo $item['link'] ?>" 
							    title="<?php echo $item['name'] ?>" target="<?php echo $item_link_target ?>">
							   <?php  echo $item['name_maxlength'];?>
							</a>
						</h4>
					<?php } ?>
					<?php if ($item['rating']) { ?>
						<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($item['rating'] < $i) { ?>
						  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } ?>
						  <?php } ?>
						</div>
					<?php } ?>
					<?php if ($product_display_description == 1) { ?>
						<p><?php echo  html_entity_decode($item['description']); ?></p>
					<?php }?>
					<?php if ($item['price'] && $product_display_price ==1) { ?>
						<p class="price">
						  <?php if (!$item['special']) { ?>
						  <?php echo $item['price']; ?>
						  <?php } else { ?>
						  <span class="price-new"><?php echo $item['special']; ?></span> <span class="price-old"><?php echo $item['price']; ?></span>
						  <?php } ?>
						  
						  <?php if ($item['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $item['tax']; ?></span>
						  <?php } ?>
						</p>
					<?php } ?>
				</div>
				<div class="button-group">
				<?php if($product_display_add_to_cart == 1)
				{
				?>
					<button type="button" onclick="cart.add('<?php echo $item['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				<?php }?>
				<?php if($product_display_wishlist == 1){
				?>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $item['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				<?php }?>
				<?php if($product_display_compare == 1){
				?>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $item['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				<?php }?>
				</div>
			</div>
			
		 <?php if($type_show == 'slider' && ($i % $rows == 0 || $i == $count)) { ?>
        </div>
    <?php }
    if ($type_show == 'loadmore'){ ?>
    </div>
    <?php } ?>
        <?php
        if($type_show == 'loadmore'){
        $clear = 'clr1';
        if ($k % 2 == 0) $clear .= ' clr2';
        if ($k % 3 == 0) $clear .= ' clr3';
        if ($k % 4 == 0) $clear .= ' clr4';
        if ($k % 5 == 0) $clear .= ' clr5';
        if ($k % 6 == 0) $clear .= ' clr6';
        ?>
        <div class="<?php echo $clear; ?>"></div>
        <?php } ?>
		
	<?php
	} ?>
	<?php if ($type_show == 'slider') { ?>
		</div>
	<?php } ?>
<?php
}else{ echo 'Has no content to show';}?>


<?php if ($type_show == 'slider') { ?>
    <script type="text/javascript">
        jQuery(document).ready(function($){
            var $tag_id = $('#<?php echo $tag_id; ?>'),
                parent_active = 	$('.spcat-items-selected', $tag_id),
                total_product = parent_active.data('total'),
                tab_active = $('.ltabs-items-inner',parent_active),
                nb_column0 = <?php echo $product_column0; ?>,
                nb_column1 = <?php echo $product_column1; ?>,
                nb_column2 = <?php echo $product_column2; ?>,
                nb_column3 = <?php echo $product_column3; ?>;
				nb_column4 = <?php echo $product_column4; ?>;
            tab_active.owlCarousel2({
                nav: <?php echo $slider_display_navigation ; ?>,
                dots: false,
                margin: 10,
                loop:  <?php echo $slider_display_loop ; ?>,
                autoplay: <?php echo $slider_auto_play; ?>,
                autoplayHoverPause: <?php echo $slider_auto_hover_pause ; ?>,
                autoplayTimeout: <?php echo $slider_auto_interval_timeout ; ?>,
                autoplaySpeed: <?php echo $slider_auto_play_speed ; ?>,
                mouseDrag: <?php echo  $slider_mouse_drag; ?>,
                touchDrag: <?php echo $slider_touch_drag; ?>,
                navRewind: true,
                navText: [ '', '' ],
                responsive: {
                    0: {
						items: nb_column4,
						nav: (total_product/<?php echo $rows?>) >= nb_column4  ? true: false,
					},
					480: {
						items: nb_column3,
						nav: (total_product/<?php echo $rows?>) >= nb_column3 ? false : ((<?php echo $slider_display_navigation ; ?>) ? true: false),
					},
					768: {
						items: nb_column2,
						nav: (total_product/<?php echo $rows?>) >= nb_column2 ? false : ((<?php echo $slider_display_navigation ; ?>) ? true: false),
					},
					992: { 
						items: nb_column1,
						nav: (total_product/<?php echo $rows?>) >= nb_column1 ? false : ((<?php echo $slider_display_navigation ; ?>) ? true: false),
						},
					1200: {
						items: nb_column0,
						nav: (total_product/<?php echo $rows?>) >= nb_column0  ? true: false,
					},
                }
            });

        });
    </script>
<?php } ?>