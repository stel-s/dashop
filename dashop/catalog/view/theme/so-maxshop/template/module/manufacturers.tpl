<div class="module manufacuturers col-sm-12">
		<h3 style="display:none;">Top Catalogue</h3>
		<div class="container">
				<div id="manu" class="owl-carouse">
				<?php if ($brands) { ?>
					<?php foreach ($brands as $brand) { ?>
						
							<?php if ($brand['manufacturer']) { ?>
								
									<?php foreach ($brand['manufacturer'] as $manufacturer) { ?>
										<div class="item text-center">
										
											<a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" alt="image" class="img-responsive"></a>
											
										</div>
									<?php } ?>
								
							<?php } ?>
					<?php } ?>
				<?php } ?>
				</div>
		</div>
</div>
<script type="text/javascript"><!--

$('#manu').owlCarousel2({
		pagination: false,
		center: false,
		nav: true,
		loop: false,
		slideBy: 1,
		autoplay: true,
		margin: 20,
		autoplayTimeout: 2500,
		autoplayHoverPause: true,
		autoplaySpeed: 800,
		startPosition: 0, 
		responsive:{
			0:{
				items:1
			},
			320:{
				items:1
				},
			480:{
				items:2
			},
			768:{
				items:3
			},
			991:{
				items:4
				},
			1200:{
				items:6
			}
		}
	});
--></script>