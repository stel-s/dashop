<?php echo $header; ?>
<?php global $config; ?>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
      <?php //echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'container'; ?>
      <?php } ?>
      <div id="content" class="container error-page">
          <?php echo $content_top; ?>
          <div class="wrapper_404page">
            <div class="col-lg-7 col-md-7">
              <div class="content-404page">
                  <p class="top-text"><?php echo $text_error; ?></p>
                  <p class="img-404"><img src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/images/404-img-text.png" alt=""></p>
                  <p class="bottom-text">Page doesn't exist or some other error occured. Go to our home page or go back previous page</p>
                  <div class="button-404">
                       <a href="javascript:void(0);" onclick="goBack()" class="btn-404 prev-page-btn" title="PREVIOUS PAGE">PREVIOUS PAGE</a>
                       <a href="<?php echo $continue; ?>" class="btn-404 back2home" title="BACK TO HOMEPAGE">BACK TO HOMEPAGE</a>
                  </div>
             </div>
            </div>
            
            <div class="col-lg-5 col-md-5">
                <div class="img-right-404">
                  <img src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/images/404-image.png" alt="">
                </div>
           </div>
          </div>
          <?php echo $content_bottom; ?>
      </div>

    </div>


</div>
<?php echo $footer; ?>

<script>
function goBack() {
     window.history.back()
}
</script>