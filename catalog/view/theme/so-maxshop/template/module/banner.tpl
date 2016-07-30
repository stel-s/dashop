<div id="so-slideshow" class="col-md-offset-3 col-md-9 col-xs-12" >
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
  <div class="loader"></div>
</div>

<script type="text/javascript"><!--
$(window).load(function() {
	jQuery(".loader").fadeOut("slow");
})
$('.slideshow').owlCarousel2({
    loop:true,
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
