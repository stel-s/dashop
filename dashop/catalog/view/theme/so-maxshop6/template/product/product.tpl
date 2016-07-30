<?php 
/******************************************************
 * @package	SO Theme Framework for Opencart 2.0.x
 * @author	http://www.magentech.com
 * @license	GNU General Public License
 * @copyright(C) 2008-2015 Magentech.com. All rights reserved.
*******************************************************/
global $config, $loader, $registry, $db, $session;
$template = $config->get('config_template');
$loader->model('custom/general');
$loader->model('catalog/product');
$model_catalog = $registry->get('model_catalog_product');
$model_product = $registry->get('model_custom_general');
$product_info = $model_catalog->getProduct($product_id);

?>
<?php // Header Blocks =========================================?>
<?php echo $header; ?>

<?php
    global $config, $loader, $registry, $db, $session;
    $store_id = $config->get('config_store_id');
    $lang = $config->get('config_language_id');

    if ($store_id == 0) {
        $soconfig_pages = $config->get('soconfig_pages');
        $soconfig_lang = $config->get('soconfig_lang');
		if (isset($soconfig_pages[$lang]["new_text"])) {$new_text = $soconfig_pages[$lang]["new_text"];}
		if (isset($soconfig_pages[$lang]["sale_text"])) {$sale_text = $soconfig_pages[$lang]["sale_text"];}
		if (isset($soconfig_pages["sale_status"])) 	{$sale_status = $soconfig_pages["sale_status"];}
		if (isset($soconfig_pages["new_status"])) 	{$new_status = $soconfig_pages["new_status"];}
    } else {
        $soconfig_pages = $config->get('soconfig_pages_store');
        $soconfig_lang = $config->get('soconfig_lang_store');
		$text_product = array(
			'thumbnails_position',
			'product_enablezoom',
			'product_zoommode',
			'product_zoomlenssize',
			'tabs_position',
			'related_status',
			'product_page_button',
		);
		foreach ($text_product as $text) {
			if (isset($soconfig_pages[$store_id][$text])) 	{$soconfig_pages[$text] = $soconfig_pages[$store_id][$text];}
		}
    }
	
	$video1 = $model_product->getProductOption($product_id, 'video1');
	$tab_title = $model_product->getProductOption($product_id, 'tab_title');
	$html_product_tab = $model_product->getProductOption($product_id, 'html_product_tab');
	$html_product_bottom = $model_product->getProductOption($product_id, 'html_product_bottom');
	$html_product_right = $model_product->getProductOption($product_id, 'html_product_right');
	$tabs_position = (isset($soconfig_pages['tabs_position']) ? $soconfig_pages['tabs_position'] : '1');
	
	/*special end date output*/
	$product['special'] = $product_info['special'];
	$product['product_id'] = $product_info['product_id'];
	$query_date = $db->query("SELECT date_end FROM ".DB_PREFIX."product_special WHERE product_id='".(int)$product_info['product_id']."'");
	if ($query_date->rows) {
		$special_end_date = $query_date->row["date_end"];
	} else {
		$special_end_date = false;
	}
	
	$limit = 250;
	$full_description = strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8'));
	$product_description_short = (strlen($full_description) > $limit ? utf8_substr($full_description, 0, $limit) . '...' : $full_description);
	/*special end date output*/
	
?>

<?php // Breadcrumb Blocks =========================================?>
<div class="container ">
	<ul class="breadcrumb" itemprop="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) : ?>
			<li><a itemprop="url" href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a></li>
		<?php endforeach; ?>
	</ul>
</div>

<?php // Content Detail Blocks ========================================= ?>
<div class="container product-detail">
	<div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left ) { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
	
    <div id="content" class="<?php echo $class; ?>">
		<?php echo $content_top; ?>

        <div class="product-view row">
		  <div class="left-content-product <?php echo (!empty($column_right)  || isset($html_product_right) && $html_product_right != '' && $html_product_right != '<p>&nbsp;</p>' ? 'col-lg-10 col-xs-12' : 'col-xs-12'); ?>">
			<div class="row">
			<?php //Img Gallery Block -------?>
			
                <div class="content-product-left  <?php if(isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'left'){echo "col-sm-6 col-xs-12"; }else { echo "col-sm-6 col-xs-12"; } ?> ">
					<?php //Left Thumbnails previews -------?>
                    <?php if ($images && (isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'left')) : ?>
                        <div id="thumb-slider" class="thumb-vertical-outer hidden-xs">
														<div id="thumb-slider-next" class="slider-btn lSNext"><i class="fa fa-chevron-up"></i></div>
														<ul class="thumb-vertical previews-list ">
															<?php 
															if (sizeof($images) > 0) {
																$firstimg = array('popup' => $popup,'thumb' => $thumb);
																array_unshift($images, $firstimg);
															}
															if ($images) : ?>
																<?php $i=-1; foreach ($images as $image) :$i++ ?>
																<li class="owl2-item">
																	<a data-index="<?php echo $i; ?>" class="img thumbnail" data-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
																		<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
																	</a>
																</li>
																<?php endforeach; ?>
															<?php endif; ?>
															
														</ul>
														<div id="thumb-slider-prev" class="slider-btn lSPrev"><i class="fa fa-chevron-down"></i></div>
                    </div>
                    <?php endif; ?>
                    <?php //End Left Thumbnails previews -------?>

					<div class="large-image <?php echo (isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'left') ? ' vertical ' : ''; ?> <?php echo isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'left' && $images ? "" : "" ?>">
						<img itemprop="image" class="product-image-zoom" src="<?php echo $popup; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						
						<!--New Label-->
						<?php if (!isset($new_status) || ($new_status != 0)) : ?>
						<?php
						$soconfig_days='';
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
						<?php if ($product_info['special']) : ?>
							<?php if (!isset($sale_status) || ($sale_status != 0)) : ?>
								<span class="label label-sale"><?php echo (isset($sale_text) ? $sale_text : 'SALE'); ?></span>
							<?php endif; ?>
						<?php endif; ?>
					</div>
						
            <?php if (isset($video1) && $video1 != '') : ?>
						<a class="thumb-video pull-left" href="<?php echo $video1; ?>"><i class="fa fa-youtube-play"></i></a>
					<?php endif; ?>        
					
					<?php //Bottom Thumbnails previews -------?>
                    <?php if ($images  && (isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'bottom')) : ?>
                        <div id="thumb-slider" class="owl-theme owl-loaded owl-drag <?php echo ((count($images) < 3 && (!isset($video1) || $video1 == '') || (count($images) == 1)) ? 'not_full_slider' : 'full_slider'); ?> <?php echo (isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'left' ? 'flexslider-large visible-xs' : 'owl-carousel'); ?>">
							<?php
							if (sizeof($images) > 0) {
								$firstimg = array('popup' => $popup,'thumb' => $thumb);
								array_unshift($images, $firstimg);
								
							}
						
							if ($images) : ?>
								<?php $i=-1; foreach ($images as $image) : $i++ ?>
									<a data-index="<?php echo $i; ?>" class="img thumbnail" data-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
										<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
									</a>
								<?php endforeach; ?>
							<?php endif; ?>
							
							
                        </div>
						<script type="text/javascript"><!--
							$(document).ready(function() {
								var $nav = $("#thumb-slider");
								$nav.each(function () {
									$(this).owlCarousel2({
										nav:true,
										dots: false,
										slideBy: 1,
										margin:10,
										responsive:{
											0:{
												items:2
											},
											600:{
												items:3
											},
											1000:{
												items:3
											}
										}
									});
								})
								
							});
						//--></script>
                    <?php endif; ?>
					<?php //End Bottom Thumbnails previews -------?>
                </div>
           
			<?php //End Img Gallery Block -------?>

			<?php //Product info Block -------?>
			<div class="content-product-right <?php if(isset($soconfig_pages["thumbnails_position"]) && $soconfig_pages["thumbnails_position"] == 'left'){echo "col-sm-6 col-xs-12"; }else { echo "col-sm-6 col-xs-12"; } ?>">
			 <div class="title-product">
				<h1><?php echo $heading_title; ?></h1>
			 </div>
			 <!-- Review ---->
			 <?php if ($review_status) { ?>
				    <div class="box-review">
					   <div class="ratings">
						  <div class="rating-box">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($rating < $i) { ?>
						  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
						  <?php } ?>
						  <?php } ?>
						  </div>
					  </div>
			 
					   <a class="reviews_button" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> | <a class="write_review_button" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
				    </div>
				<?php } ?>
				
			 <?php //Product label -------?>
                <div class="product-label">
					<div class="stock"><span><?php echo $text_stock; ?></span> <span class="status-stock"><?php echo $stock; ?></span></div>
					   <?php if (!isset($soconfig_pages['product_catalog_mode']) || $soconfig_pages['product_catalog_mode'] != 1) : ?>
						<?php if ($price) : ?>
						<div class="product_page_price price" itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
							<?php if (!$special) { ?>
							<?php echo '<span class="price" itemprop="price">'.$price.'</span>'; ?>
							<?php } else { ?>
							<span class="price-old"><?php echo $price; ?></span>
							<span class="price-new" itemprop="price"><?php echo $special; ?></span>
							<?php } ?>
							
							
							
							<?php if ($discounts) { ?>
							<div class="discount">
								<?php foreach ($discounts as $discount) { ?>
								 <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
						<?php endif; ?>
					<?php endif; ?>
					

                </div>
                <?php //End Product label -------?>	
			 
			 <?php //Product Description -------?>
				<div class="product-box-desc">
						<div class="inner-box-desc">
								<?php if ($tax) { ?>
								<div class="price-tax"><span><?php echo $text_tax; ?></span> <?php echo $tax; ?></div>
								<?php } ?>
								<?php if ($points) { ?>
								<div class="reward"><span><?php echo $text_points; ?></span> <?php echo $points; ?></div>
								<?php } ?>
											
								<?php if ($manufacturer): ?>
										<div class="brand"><span><?php echo $text_manufacturer; ?></span><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
								<?php endif; ?>
								
								<?php 
								
								if ($model): ?>
								<div class="model"><span><?php echo $text_model; ?></span> <?php echo $model; ?></div>
								<?php endif; ?>
								
								<?php if ($reward): ?>
									<div class="reward"><span><?php echo $text_reward; ?></span> <?php echo $reward; ?></div>
								<?php endif; ?>
						</div>

				</div>
				
				<div class="short_description">
					<h3><?php echo $overview; ?></h3>
					<?php echo $product_description_short;?>
				</div>
				<?php // End Product Description -------?>
	
				
			
				<div id="product">
					<?php if ($options) { ?>
					
					<h3><?php echo $text_option; ?></h3>
					<?php foreach ($options as $option) { ?>
						<?php if ($option['type'] == 'select') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									<?php } ?>
								</option>
								<?php } ?>
							</select>
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'radio') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label>
										<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'checkbox') { ?>
						<div class="box-checkbox form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'image') { ?>
						<div class="image_option_type form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<ul class="product-options clearfix" id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<li class="radio">
									<label>
										<input class="image_radio" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
										<img   src="<?php echo $option_value['image']; ?>" data-original-title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail icon icon-color" />
										<i class="fa fa-check"></i>
									<label>
								</li>
								<?php } ?>
								<li class="radio selected-option"></li>
							</ul>
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'text') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
						</div>
						<?php } ?>
						
						<?php if ($option['type'] == 'textarea') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
						</div>
						<?php } ?>
						
						<?php if ($option['type'] == 'file') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
							<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'date') { ?>
						<div class="box-date form-group<?php echo ($option['required'] ? ' required' : ''); ?> col-sm-12 col-xs-12">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<div class="input-group date">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'datetime') { ?>
						<div class="box-date form-group<?php echo ($option['required'] ? ' required' : ''); ?> col-sm-12 col-xs-12">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<div class="input-group datetime">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>"  data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						<?php } ?>
					
						<?php if ($option['type'] == 'time') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<div class="input-group time">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						</div>
						<?php } ?>
					
					<?php } ?>
					<?php } ?>
					
					<?php
					
					if ($recurrings) { ?>
					<hr>
					<h3><?php echo $text_payment_recurring ?></h3>
					<div class="form-group required">
						<select name="recurring_id" class="form-control">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($recurrings as $recurring) { ?>
							<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
							<?php } ?>
						</select>
						<div class="help-block" id="recurring-description"></div>
					</div>
					<?php } ?>
					
					
				    <div class="form-group box-info-product">
					   <div class="option quantity">
							
						  <div class="input-group quantity-control">
							  <label><?php echo $entry_qty; ?></label>
							  <input class="form-control" type="text" name="quantity" value="<?php echo $minimum; ?>" />
							  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
							  <span class="input-group-addon product_quantity_down">−</span>
							  <span class="input-group-addon product_quantity_up">+</span>
						  </div>
					   </div>
					   
						<div class="cart">
							<input type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" value="<?php echo $button_cart; ?>" data-loading-text="<?php echo $text_loading; ?>" id="button-cart" class="btn btn-mega btn-lg" />
						</div>
						<div class="add-to-links wish_comp">
							<ul class="blank">
								<li class="wishlist">
									<a class="icon" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></a>
								</li>
								<li class="compare">
									<a class="icon" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></a>
								</li>
							</ul>
						</div>
						<?php if ($minimum > 1) : ?><p class="minimum" style="clear:both"><?php echo $text_minimum; ?></p><?php endif; ?>

				
			
					</div>
			
			
			<?php //Tabs Type = 3 -------?>
			<?php if ($tabs_position == 3) : ?>
			<div class="producttab panel-group accordion-simple" id="product-accordion">
			
				<?php if ($description) : ?>
					<div class="panel">
						<div class="panel-heading">
							<a data-toggle="collapse" data-parent="#product-accordion" href="#product-description" class="title-head collapsed">
								<span class="arrow-up "></span>
								<?php echo $tab_description; ?>
							</a>
						</div>
						<div id="product-description" class="panel-collapse collapse">
							<div class="panel-body">
								<?php echo $description; ?>
							</div>
						</div>
					</div>
				<?php endif; ?>
			
				<?php if ($attribute_groups) : ?>
				<div class="panel">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#product-accordion" href="#product-attribute" class="title-head collapsed">
						
							<span class="arrow-up "></span>
							<?php echo $tab_attribute; ?>
						</a>
					</div>
					<div id="product-attribute" class="panel-collapse collapse">
						<div class="panel-body">
							<table class="attribute">
								<?php foreach ($attribute_groups as $attribute_group) { ?>
								<thead>
								<tr>
									<td colspan="2"><?php echo $attribute_group['name']; ?></td>
								</tr>
								</thead>
								<tbody>
								<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
								<tr>
									<td><?php echo $attribute['name']; ?></td>
									<td><?php echo $attribute['text']; ?></td>
								</tr>
								<?php } ?>
								</tbody>
								<?php } ?>
							</table>
						</div>
					</div>
				</div>
				<?php endif; ?>
			
				<?php if ($review_status) : ?>
				<div class="panel">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#product-accordion" href="#tab-review" class="title-head collapsed">
							<span class="arrow-up icon-arrow-up-4"></span>
							<?php echo $tab_review; ?>
						</a>
					</div>
					<div id="tab-review" class="panel-collapse collapse">
						<div class="panel-body">
							<form>
								<div id="review"></div>
								<h2 id="review-title"><?php echo $text_write; ?></h2>
								<?php if ($review_guest) { ?>
								<div class="contacts-form">
									<div class="form-group">
										<span class="icon icon-user"></span>
										<input type="text" name="name" class="form-control" value="<?php echo $entry_name; ?>" onblur="if (this.value == '') {this.value = '<?php echo $entry_name; ?>';}" onfocus="if(this.value == '<?php echo $entry_name; ?>') {this.value = '';}">
									</div>
									<div class="form-group">
										<span class="icon icon-bubbles-2"></span>
										<textarea class="form-control" name="text" onblur="if (this.value == '') {this.value = '<?php echo $entry_review; ?>';}" onfocus="if(this.value == '<?php echo $entry_review; ?>') {this.value = '';}"><?php echo $entry_review; ?></textarea>
									</div>
									<span style="font-size: 11px;"><?php echo $text_note; ?></span>
									<br />
									<br />
									<b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
									<input type="radio" name="rating" value="1" />
									&nbsp;
									<input type="radio" name="rating" value="2" />
									&nbsp;
									<input type="radio" name="rating" value="3" />
									&nbsp;
									<input type="radio" name="rating" value="4" />
									&nbsp;
									<input type="radio" name="rating" value="5" />
									&nbsp;<span><?php echo $entry_good; ?></span><br />
									<br />
									<?php //if ($site_key) { ?>
									<!-- <div class="form-group">
										<div class="col-sm-12">
											<div class="g-recaptcha" data-sitekey="<?php //echo $site_key; ?>"></div>
                              <?php //if ($error_captcha) { ?>
                              <div class="text-danger"><?php //echo $error_captcha; ?></div>
                              <?php //} ?>
										</div>
									</div> -->
									<?php //} ?>
			
			
									<div class="buttons"><a id="button-review" class="btn btn-mega"><?php echo $button_continue; ?></a></div>
			
								</div>
								<?php } else { ?>
								<?php echo $text_login; ?>
								<?php } ?>
							</form>
						</div>
					</div>
				</div>
				<?php endif; ?>
				
				<?php  if ($tags) : ?>
					<div class="panel">
						<div class="panel-heading">
							<a data-toggle="collapse" data-parent="#product-accordion" href="#product-tags" class="title-head collapsed">
								<span class="arrow-up icon-arrow-up-4"></span>
								<?php echo (!empty($soconfig_lang[$lang]["tags_tab_title"]) ? $soconfig_lang[$lang]["tags_tab_title"] : 'TAGS'); ?>
							</a>
						</div>
						<div id="product-tags" class="panel-collapse collapse">
							<div class="panel-body">
								<?php for ($i = 0; $i < count($tags); $i++) { ?>
								<?php if ($i < (count($tags) - 1)) { ?>
								<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
								<?php } else { ?>
								<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
								<?php } ?>
								<?php } ?>
							</div>
						</div>
					</div>
				<?php endif; ?>
			
				<?php if (!empty($html_product_tab) && !empty($tab_title)) : ?>
				<div class="panel">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#product-accordion" href="#product-custom" class="title-head collapsed">
							<span class="arrow-up icon-arrow-up-4"></span>
							<?php echo $tab_title; ?>
						</a>
					</div>
					<div id="product-custom" class="panel-collapse collapse">
						<div class="panel-body">
							<?php echo $html_product_tab; ?>
						</div>
					</div>
				</div>
				<?php endif; ?>
			
			</div>
			<?php endif; ?>
			<?php //End Tabs Type = 3 -------?>
			
			<?php // AddThis Button  -------?>
			<?php
			if (!empty($soconfig_pages['product_page_button'])) {
				echo html_entity_decode($soconfig_pages["product_page_button"], ENT_QUOTES, 'UTF-8');
			} ?>
			<?php // End AddThis Button  -------?>
			
				
			</div><!-- end box info product -->

            </div>
			<?php //End Product info Block -------?>
			</div>
		  </div><!-- end - left-content-product --->


			<?php //Column Right Block -------?>
			<?php if (!empty($column_right) || $products || isset($html_product_right) && $html_product_right != '' && $html_product_right != '<p>&nbsp;</p>') : ?>
			<section class="col-lg-2 hidden-sm hidden-md hidden-xs slider-products">
				<?php echo $column_right; ?>
				<?php if (isset($html_product_right) && $html_product_right != '' && $html_product_right != '<p>&nbsp;</p>') echo $html_product_right; ?>
			</section>
			<?php endif; ?>
			<?php //End Column Right Block -------?>
		</div>


		
		<?php 
		if( isset($soconfig_pages['product_enablezoom'] ) && $soconfig_pages['product_enablezoom'] == 1) {?>
		<script type="text/javascript">
		$(document).ready(function() {
			var zoomCollection = '.large-image img';
			$( zoomCollection ).elevateZoom({
				<?php if( $soconfig_pages['product_zoommode'] != 'basic' ) { ?>
				zoomType        : "<?php echo isset($soconfig_pages['product_zoommode']) ? $soconfig_pages['product_zoommode'] : '';?>",
				<?php } ?>
				lensSize    :"<?php echo isset($soconfig_pages['product_zoomlenssize']) ? $soconfig_pages['product_zoomlenssize'] : '';?>",
				easing:true,
				
				gallery:'thumb-slider',
				cursor: 'pointer',
				galleryActiveClass: "active"
			});
			$('.large-image').magnificPopup({
				items: [
				<?php if ($images) { ?>
					<?php foreach ($images as $image) { ?>{src: '<?php echo $image['popup']; ?>'},<?php } ?>
				<?php }else{ ?>
					<?php if ($thumb) { ?>{src: '<?php echo $popup; ?>'}<?php } ?>
				<?php } ?>
				],
				gallery: { enabled: true, preload: [0,2] },
				type: 'image',
				mainClass: 'mfp-fade',
				callbacks: {
					open: function() {
						<?php if ($images) { ?>
						var activeIndex = parseInt($('#thumb-slider .img.active').attr('data-index'));
						<?php }else{ ?>
						var activeIndex = 0;
						<?php } ?>
						var magnificPopup = $.magnificPopup.instance;
						magnificPopup.goTo(activeIndex);
					}
				}
			});
			
		});
				
		</script>

		<?php }else{?>
		<script type="text/javascript"><!--
		  $(document).ready(function() { 
			$('.owl2-item').magnificPopup({
				items: [
				<?php if ($images) { ?>
					<?php foreach ($images as $image) { ?>{src: '<?php echo $image['popup']; ?>'},<?php } ?>
				<?php }else{ ?>
					<?php if ($thumb) { ?>{src: '<?php echo $popup; ?>'}<?php } ?>
				<?php } ?>
				],
				gallery: { enabled: true, preload: [0,2] },
				type: 'image',
				mainClass: 'mfp-fade',
				callbacks: {
					open: function() {
						$cur = this.st.el;
						<?php if ($images) { ?>
						var activeIndex = parseInt($cur.children(".thumbnail").attr('data-index'));
						<?php }else{ ?>
						var activeIndex = 0;
						<?php } ?>
						var magnificPopup = $.magnificPopup.instance;
						magnificPopup.goTo(activeIndex);
					}
				}
			});
		  });

		//--></script>
		<?php } ?>
		
		<div class="bototm-detail col-xs-12">
		    <div class="row">
				<?php if (!isset($soconfig_pages['related_status']) || $soconfig_pages['related_status'] !== '0' && $products ) : ?>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<?php // Related Products Blocks =========================================?>
					<?php  include('catalog/view/theme/'.$template.'/template/product/related.php');     ?>
				</div> <!-- End related -->
				<?php
				endif; ?>
						
			<div class="<?php echo(!isset($soconfig_pages['related_status']) || $soconfig_pages['related_status'] !== '0' && $products ) ? 'col-lg-9 col-md-8 col-sm-6 col-xs-12' : 'col-xs-12' ;?>">
			    <?php // Tabs Blocks =========================================?>
		<?php if ($tabs_position != 3) : ?>
		<div class="producttab ">

			<div class="tabsslider  <?php if ($tabs_position == 1){ echo "vertical-tabs"; }?> col-xs-12">
				<?php if ($tabs_position != 1) : ?>
				<ul class="nav nav-tabs ">
					<?php if ($description) : ?>
					<li class="active"><a data-toggle="tab" href="#tab-1"><?php echo $tab_description; ?></a></li>
					<?php endif; ?>
					
					<?php if ($attribute_groups) : ?>
					<li class="<?php echo (!$description ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-2"><?php echo $tab_attribute; ?></a></li>
					<?php endif; ?>

					<?php if ($review_status) : ?>
					<li class="<?php echo (!$description && !$attribute_groups ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-review"><?php echo $tab_review; ?></a></li>
					<?php endif; ?>
					
					<?php 
					
					if ($tags) : ?>
					<li class="<?php echo (!$description && !$attribute_groups && !$review_status ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-4"><?php echo (!empty($soconfig_lang[$lang]["tags_tab_title"]) ? $soconfig_lang[$lang]["tags_tab_title"] : 'TAGS'); ?></a></li>
					<?php endif; ?>

					<?php if (!empty($html_product_tab)) : ?>
					<li class="<?php echo (!$description && !$attribute_groups && !$review_status && !$tags ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-5"><?php echo (!empty($tab_title) ? $tab_title : 'Custom block'); ?></a></li>
					<?php endif; ?>
				</ul>
				<?php endif; ?>
			
			<?php //Tabs Left Position -------?>
				<?php if ($tabs_position == 1) : ?>
				
					<ul class="nav nav-tabs col-lg-3 col-sm-3">
						<?php if ($description) : ?>
						<li class="active"><a data-toggle="tab" href="#tab-1"><?php echo $tab_description; ?></a></li>
						<?php endif; ?>

						<?php if ($attribute_groups) : ?>
						<li class="<?php echo (!$description ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-2"><?php echo $tab_attribute; ?></a></li>
						<?php endif; ?>

						<?php if ($review_status) : ?>
						<li class="<?php echo (!$description && !$attribute_groups ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-review"><?php echo $tab_review; ?></a></li>
						<?php endif; ?>
						
						<?php if ($tags) : ?>
						<li class="<?php echo (!$description && !$attribute_groups && !$review_status ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-4"><?php echo (!empty($soconfig_lang[$lang]["tags_tab_title"]) ? $soconfig_lang[$lang]["tags_tab_title"] : 'TAGS'); ?></a></li>
						<?php endif; ?>

						<?php if (!empty($html_product_tab)) : ?>
						<li class="<?php echo (!$description && !$attribute_groups && !$review_status && !$tags ? 'active' : 'item_nonactive'); ?>"><a data-toggle="tab" href="#tab-5"><?php echo (!empty($tab_title) ? $tab_title : 'Custom block'); ?></a></li>
						<?php endif; ?>
					</ul>
					
				<?php endif; ?>
					<div class="tab-content <?php if ($tabs_position == 1){ echo "col-lg-9 col-sm-9"; }?> col-xs-12">
						<?php if ($description) : ?>
						<div id="tab-1" class="tab-pane fade active in">
							<?php echo $description; ?>
						</div>
						<?php endif; ?>

						<?php if ($attribute_groups) : ?>
						<div id="tab-2" class="<?php echo (!$description ? 'tab-pane fade active in' : 'tab-pane fade'); ?>">
							<table class="attribute">
								<?php foreach ($attribute_groups as $attribute_group) { ?>
								<thead>
								<tr>
									<td colspan="2"><?php echo $attribute_group['name']; ?></td>
								</tr>
								</thead>
								<tbody>
								<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
								<tr>
									<td><?php echo $attribute['name']; ?></td>
									<td><?php echo $attribute['text']; ?></td>
								</tr>
								<?php } ?>
								</tbody>
								<?php } ?>
							</table>
						</div>
						<?php endif; ?>

						<?php  if ($review_status) : ?>
						<div id="tab-review" class="<?php echo (!$description && !$attribute_groups ? 'tab-pane fade active in' : 'tab-pane fade'); ?>">
							<form>
								<div id="review"></div>
								<h2 id="review-title"><?php echo $text_write; ?></h2>
								<?php if ($review_guest) { ?>
									<div class="contacts-form">
										<div class="form-group">
											<span class="icon icon-user"></span>
											<input type="text" name="name" class="form-control" value="<?php echo $entry_name; ?>" onblur="if (this.value == '') {this.value = '<?php echo $entry_name; ?>';}" onfocus="if(this.value == '<?php echo $entry_name; ?>') {this.value = '';}">
										</div>
										<div class="form-group">
											<span class="icon icon-bubbles-2"></span>
											<textarea class="form-control" name="text" onblur="if (this.value == '') {this.value = '<?php echo $entry_review; ?>';}" onfocus="if(this.value == '<?php echo $entry_review; ?>') {this.value = '';}"><?php echo $entry_review; ?></textarea>
										</div>
										<span style="font-size: 11px;"><?php echo $text_note; ?></span>
										<br />
										<br />
										<b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
										<input type="radio" name="rating" value="1" />
										&nbsp;
										<input type="radio" name="rating" value="2" />
										&nbsp;
										<input type="radio" name="rating" value="3" />
										&nbsp;
										<input type="radio" name="rating" value="4" />
										&nbsp;
										<input type="radio" name="rating" value="5" />
										&nbsp;<span><?php echo $entry_good; ?></span><br />
										<br />
									<?php echo $captcha; ?>
									<div class="buttons clearfix">
									  <div class="pull-right">
										<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
									  </div>
									</div>
									<?php } else { ?>
									<?php echo $text_login; ?>
									<?php } ?>
									</div>
							</form>

						</div>
						<?php endif; ?>

						<?php 
						
						if ($tags) : ?>
						<div id="tab-4" class="<?php echo (!$description && !$attribute_groups && !$review_status ? 'tab-pane fade active in' : 'tab-pane fade'); ?>">
							<?php for ($i = 0; $i < count($tags); $i++) { ?>
							<?php if ($i < (count($tags) - 1)) { ?>
							<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
							<?php } else { ?>
							<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
							<?php } ?>
							<?php } ?>
						</div>
						<?php endif; ?>

						<?php if (!empty($html_product_tab)) : ?>
						<div id="tab-5" class="<?php echo (!$description && !$attribute_groups && !$review_status && !$tags ? 'tab-pane fade active in' : 'tab-pane fade'); ?>">
							<?php echo $html_product_tab; ?>
						</div>
						<?php endif; ?>

					</div>

			

		  </div><!-- End Tabs Slider -->
		  <div class="up-sell-product col-xs-12">
		    <?php echo $content_bottom;?>
		  </div>

		</div>
		<?php endif; ?>
			</div><!-- End tabs -->
		    </div>
		</div>


    </div>
	</div>
</div>


</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 

<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=soconfig/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				 addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
						$('#cart  .text-shopping-cart');//.html(json['total'] );
						$('.text-danger').remove();
					}, 100);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
    if (typeof timer != 'undefined') {
        clearInterval(timer);
    }
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');
    $('#review').load(this.href);
    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

//--></script> 


<script type="text/javascript"><!--
	$(document).ready(function() {
		
		$('.product-options li').click(function(){
			$(this).addClass(function() {
				if($(this).hasClass("active")) return "";
				return "active";
			});
			
			$(this).siblings("li").removeClass("active");
			$('.product-options .selected-option').html('<span class="label label-success">'+ $(this).find('img').data('original-title') +'</span>');
		})
		
		//Call JQuery lightSlider Settings
		var thumbslider = $(".thumb-vertical-outer .thumb-vertical").lightSlider({
			item: 4,
			autoWidth: false,
			vertical:true,
			slideMargin: 0,
			verticalHeight:420,
            pager: false,
			controls: false,
            prevHtml: '<i class="fa fa-angle-up"></i>',
            nextHtml: '<i class="fa fa-angle-down"></i>',
			responsive: [
				{
					breakpoint: 1199,
					settings: {
						verticalHeight: 360,
						item: 3,
					}
				},
				{
					breakpoint: 1024,
					settings: {
						verticalHeight: 220,
						item: 2,
					}
				},
				{
					breakpoint: 768,
					settings: {
						verticalHeight: 210,
						item: 1,
					}
				}
			]
        });
		
		//Call JQuery lightSlider - Go to previous slide
		if(<?php echo count($images)?> >= 4){
			$('#thumb-slider-prev').click(function(){
				thumbslider.goToPrevSlide();
			});
			$('#thumb-slider-next').click(function(){
				thumbslider.goToNextSlide();
			});
		}else{
			$('#thumb-slider .slider-btn').hide();
		}
		
		
		$("#thumb-slider .owl2-item").each(function() {
			$(this).find("[data-index='0']").addClass('active');
		});
		
		$('.thumb-video').magnificPopup({
		  type: 'iframe',
		  iframe: {
			patterns: {
			   youtube: {
				  index: 'youtube.com/', // String that detects type of video (in this case YouTube). Simply via url.indexOf(index).
				  id: 'v=', // String that splits URL in a two parts, second part should be %id%
				  src: '//www.youtube.com/embed/%id%?autoplay=1' // URL that will be set as a source for iframe. 
					},
				}
			}
		});
	});
	
//--></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/lightslider/lightslider.css" media="screen">
<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/lightslider/lightslider.js"></script>
<?php // Footer Blocks =========================================?>
<?php echo $footer; ?>