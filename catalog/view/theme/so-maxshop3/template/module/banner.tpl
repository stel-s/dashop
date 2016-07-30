<div id="so-slideshow" class="col-lg-8 col-md-8 col-sm-12 col-xs-12 two-block" >
  <div class="module slideshow no-margin">
    <?php foreach ($banners as $banner) { ?>
    <div class="item">
	 <?php if ($banner['link']) { ?>
	 <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
	 <?php } else { ?>
	 <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
	 <?php } ?>
    </div>
    <?php } ?>
  </div>
</div>
<script type="text/javascript"><!--
$('.slideshow').owlCarousel2({
    loop:false,
    margin:0,
    responsiveClass:true,
    nav: true,
    dots: true,
		autoplay: true,
    responsive:{
        0:{
            items:1,
        },
        600:{
            items:1,
        },
        1000:{
            items:1,
        }
    }
});
--></script>
