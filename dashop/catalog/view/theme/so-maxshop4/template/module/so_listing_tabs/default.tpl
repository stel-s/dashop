<?php 
if (!empty($list)) {	
?>
<div class="module <?php echo $class_suffix; ?>">
	<?php if($disp_title_module) { ?>
		<h3><?php echo $name; ?></h3>
	<?php } ?>
	<!--[if lt IE 9]>
	<div id="<?php echo $tag_id; ?>" class="so-listing-tabs msie lt-ie9 first-load module"><![endif]-->
	<!--[if IE 9]>
	<div id="<?php echo $tag_id; ?>" class="so-listing-tabs msie first-load module"><![endif]-->
	<!--[if gt IE 9]><!-->
	<div id="<?php echo $tag_id; ?>" class="so-listing-tabs first-load module"><!--<![endif]-->
		<div class="ltabs-wrap ">
			<div class="ltabs-tabs-container" data-delay="<?php echo $delay ?>"
				 data-duration="<?php echo $duration ?>"
				 data-effect="<?php echo $effect ?>"
				 data-ajaxurl="<?php echo "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]" ?>" data-type_source="<?php echo $type_source;?>"  >
				 
				<!--Begin Tabs-->
					<?php include("default_tabs.tpl");	?>
					
					
				<!-- End Tabs-->
			</div>
			<div class="ltabs-items-container"><!--Begin Items-->
				<?php 
				foreach ($list as $key => $items) {
					
				$child_items = isset($items['child']) ? $items['child'] : '';
				$cls = (isset($items['sel']) && $items['sel'] == "sel") ? ' ltabs-items-selected ltabs-items-loaded' : '';
				$cls .= ($items['category_id'] == "*") ? ' items-category-all' : ' items-category-' . $items['category_id'];
				$tab_id = isset($list[$key]['sel']) ? $items['category_id'] : '';
				$tab_id = $tab_id == '*' ? 'all' : $tab_id;
				?>
				<div class="ltabs-items <?php echo $cls; ?>" data-total="<?php echo $items['count'] ?>">
					<?php
					if (!empty($child_items)) {	
						include("default_items.tpl"); 
					} else {?>
						<div class="ltabs-loading"></div>
					<?php  } ?>
					<?php $classloaded = ($source_limit >= $items['count'] || $source_limit == 0) ? 'loaded' : ''; 
					if($type_show == 'loadmore') {
					?>
					<div class="ltabs-loadmore"
						 data-active-content=".items-category-<?php echo ($items['category_id'] == "*") ? 'all' : $items['category_id']; ?>"
						 data-categoryid	="<?php echo $items['category_id']; ?>"
						 data-rl_start		="<?php echo $source_limit ?>"
						 data-rl_total		="<?php echo $items['count'] ?>"
						 data-rl_allready	="All ready"
						 data-ajaxurl		="<?php echo "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]" ?>" 
						 data-rl_load		="<?php echo $source_limit ?>" 
						 data-moduleid		='<?php echo $moduleid; ?>'
						 >
						<div class="ltabs-loadmore-btn <?php echo $classloaded ?>"
							 data-label="<?php echo ($classloaded) ? "All ready" : "Load more"; ?>">
							<span class="ltabs-image-loading"></span>
							<i class="fa fa-plus"></i>
						</div>
					</div>
					<?php } ?>
				</div>
			<?php } ?>
			</div>
		<!--End Items-->
		</div>
	<?php
		include("default_js.tpl");
	} else {
		echo 'Has no item to show!';
	} 
	?>
	</div>
</div>	