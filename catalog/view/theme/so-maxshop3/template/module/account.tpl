<section class="left_block module list-item-account">
	<h3 class="modtitle"><?php echo $heading_title; ?></h3>
   <div class="modcontent">
    <ul class="simple-list list-group">
      <?php if (!$logged) { ?>
      <li class="list-group-item"><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
	 <li class="list-group-item"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li class="list-group-item"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li class="list-group-item"><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <?php } ?>
      <li class="list-group-item"><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      <li class="list-group-item"><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
      <?php if ($logged) { ?>
      <li class="list-group-item"><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</section>

