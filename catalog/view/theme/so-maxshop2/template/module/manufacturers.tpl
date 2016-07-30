<div class="module so-manu-slider">
		<h3 class="modtitle">
				<span>Our brand</span>
				<a class="view-all-brand" href="#" title="View All"><?php echo $view_all; ?></a>
		</h3>
		<div class="wrap_manu_slider">
				<?php if ($brands) { ?>			
					<div class="manu-slider-inner">					
						<?php foreach ($brands as $brand) { ?>
							
								<?php if ($brand['manufacturer']) { ?>
									
										<?php foreach ($brand['manufacturer'] as $manufacturer) { ?>
											<div class="item">
											
												<a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" alt="image" class="img-responsive"></a>
												
											</div>
										<?php } ?>
									
								<?php } ?>
						<?php } ?>
					</div>
			
				<?php } ?>
		</div>
</div>
