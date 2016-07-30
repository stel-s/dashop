<?php
    global $config;
    $text_items_full = explode(" ", $text_items);
    $text_items_number = $text_items_full[0];
    $store_id = $config->get('config_store_id');

?>


<div id="cart" class=" btn-group btn-shopping-cart">
  <a data-loading-text="<?php echo $text_loading; ?>" class="top_cart dropdown-toggle" data-toggle="dropdown">
    <div class="shopcart">
		<span class="handle pull-left"></span>
		<span class="title"><?php echo $text_shop_cart; ?></span>
		<span class="text-shopping-cart cart-total-full">
			<?php echo ' <strong>'. $text_items_number.'</strong>'; ?>
		</span>
    </div>
   
     
  </a>


  <ul class="tab-content content dropdown-menu pull-right shoppingcart-box" role="menu">
    
      <?php if ($products || $vouchers) { ?>
      
      <li>
          <div class="added_items"><?php echo (count($products) <= 3 ? '' : 'Last 3 added item(s) from '.count($products)) ; ?></div>
      </li>
      <li>
          <table class="table table-striped">

              <?php
	    $i = 0;
	    $products1 = array_reverse($products);
	    ?>
              <?php foreach ($products1 as $product) : ?>
              <?php $i ++; ?>
                  <?php if ($i < 4): ?>
                  <tr>
                      <td class="text-center img">
                          <?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="preview" />
                            </a>
                          <?php } ?>
                      </td>
                      <td class="text-left">
                          <a class="cart_product_name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <?php if ($product['option']) { ?>
                          <?php foreach ($product['option'] as $option) { ?>
                          <br />
                          - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                          <?php } ?>
                          <?php } ?>
                          <?php if ($product['recurring']) { ?>
                          <br />
                          - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                          <?php } ?>
                      </td>
                        <td class="text-center">
                            x<?php echo $product['quantity']; ?>
                        </td>
                        <td class="text-center">
                             <?php echo $product['total']; ?>
                        </td>
                        <td class="text-right">
                            <a href="<?php echo $product['href']; ?>" class="fa fa-edit"></a>
                        </td>
                        <td class="text-right">
                            <a onclick="cart.remove('<?php echo $product['cart_id']; ?>');" class="fa fa-times fa-delete"></a>
                        </td>
                  </tr>
                  <?php endif; ?>
              <?php endforeach; ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                  <td class="text-center"></td>
                  <td class="text-left"><?php echo $voucher['description']; ?></td>
                  <td class="text-right">x&nbsp;1</td>
                  <td class="text-right"><?php echo $voucher['amount']; ?></td>
                  <td class="text-center text-danger">
                      <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">
                          <i class="fa fa-times"></i>
                      </button>
                  </td>
              </tr>
              <?php } ?>
          </table>
      </li>
      <li>
          <div>
              <table class="table table-bordered">
                  <?php foreach ($totals as $total) { ?>
                  <tr>
                      <td class="text-left" style="white-space: nowrap;"><strong><?php echo $total['title']; ?></strong></td>
                      <td class="text-right"><?php echo $total['text']; ?></td>
                  </tr>
                  <?php } ?>
              </table>
              <p class="text-center">
                  <a class="btn view-cart" href="<?php echo $cart; ?>"><i class="fa fa-shopping-cart"></i><?php echo $text_cart; ?></a>&nbsp;&nbsp;&nbsp;
                  <a class="btn btn-mega checkout-cart" href="<?php echo $checkout; ?>"><i class="fa fa-share"></i><?php echo $text_checkout; ?></a>
              </p>
          </div>
      </li>
      <?php } else { ?>
      <li>
          <p class="text-center"><?php echo $text_empty; ?></p>
      </li>
      <?php } ?>
  </ul>
</div>
