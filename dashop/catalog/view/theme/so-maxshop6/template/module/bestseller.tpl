<?php
    global $config,$loader, $registry;
    if ($store_id == 0) {
        $soconfig_pages = $config->get('soconfig_pages');
		if (isset($soconfig_pages["days"])) {$soconfig_days = $soconfig_pages["days"];}
    } else {
        
    }

?>
<div class="special-product module">
<div class="products-list grid">
  <h3 class="modtitle"><?php echo $heading_title; ?></h3>
  <div class="modcontent row">
    <?php foreach ($products as $product) {
		$loader->model('catalog/product');
		$model = $registry->get('model_catalog_product');
		$product_info = $model->getProduct($product['product_id']);
	?>
    <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-item-container transition">
        <div class="left-block">
          <div class="product-image-container"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
			<!--- New ------->
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
				<?php endif; ?><!--- end new ----->
				<!------sale ---------->
					 <?php if ($product['special']) : ?>
					 <span class="label label-sale"><?php echo (isset($sale_text) ? $sale_text : 'SALE'); ?></span>
					 <?php endif; ?>
				<!--end sale --->
            
				<!--full quick view block-->
					<a class="quickview iframe-link btn btn-default "  href="<?php echo $product['href']; ?>"> <?php echo (isset($quick_view_text) ? $quick_view_text : 'QuickView'); ?></a>
				<!--end full quick view block-->
        </div>
        <div class="right-block">
			<div class="caption">
				<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
				<!--<p><?php //echo $product['description']; ?></p>-->
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
            </div>
            <div class="button-group">
              <button class="addToCart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
              <button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
        </div>
        
      </div>
    </div>
    <?php } ?>
  </div>
</div>
</div>