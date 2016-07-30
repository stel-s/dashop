<?php
$instance = rand() . time();
$array = array();
foreach ($tabs as $index=>$items) {
	$array[] = $items['count'];
}
$_count_item = (count($array) >0 ? (int)$array[0] : 0);
$limit = $limitation;
$nbcolumn0 = ($product_column0 >= $_count_item) ? $_count_item : $product_column0;
$nbcolumn1 = ($product_column1 >= $_count_item) ? $_count_item : $product_column1;
$nbcolumn2 = ($product_column2 >= $_count_item) ? $_count_item : $product_column2;
$nbcolumn3 = ($product_column3 >= $_count_item) ? $_count_item : $product_column3;
$nbcolumn4 = ($product_column4 >= $_count_item) ? $_count_item : $product_column4;
$class_spcat = 'spcat00-' . $nbcolumn0 . ' spcat01-' . $nbcolumn1 . ' spcat02-' . $nbcolumn2 . ' spcat03-' . $nbcolumn3 . ' spcat04-' . $nbcolumn4;

$count_item = count($category_tree);
$nb_column0 = ($category_column0 >= $count_item) ? $count_item : $category_column0;
$nb_column1 = ($category_column1 >= $count_item) ? $count_item : $category_column1;
$nb_column2 = ($category_column2 >= $count_item) ? $count_item : $category_column2;
$nb_column3 = ($category_column3 >= $count_item) ? $count_item : $category_column3;
$nb_column4 = ($category_column3 >= $count_item) ? $count_item : $category_column4;

$icon_class=strstr($advanced_mod_class_suffix,'fa-');
$color_class=strstr($advanced_mod_class_suffix,'#');
$class_suffix_after1=str_replace($icon_class, '', $advanced_mod_class_suffix);
$class_suffix_after2=str_replace($color_class, '', $class_suffix_after1);
$padding="";
if(!$icon_class){
	$padding="padding: 0 15px;";
}
?>
<div class="module <?php echo $class_suffix_after2; ?>">
	<div class="header">
	<?php if($disp_title_module) { ?>
		<h3 class="modtitle">
			<span class="icon-color" <?php if(isset($color_class)){?>style="background-color: <?php echo $color_class;?>; <?php echo $padding;?>" <?php } ?>>
				<?php if ($icon_class !=""){?>
				<i class="fa <?php echo $icon_class; ?>"></i>
				<?php } ?>
				<?php echo $head_name; ?>
				<small class="arow-after"
					<?php
						if(isset($color_class)){
					?>
					style="border-color: transparent transparent  <?php echo $color_class; ?> transparent" <?php } ?>>
				</small>
			</span>
			<strong class="line-color" <?php if(isset($color_class)){?>style="background-color: <?php echo $color_class;?>" <?php } ?>></strong>
		</h3>
	<?php } ?>
	
	</div>
	
	<!--[if lt IE 9]>
	<div id="<?php echo $tag_id; ?>" class="so-sp-cat msie lt-ie9 first-load"><![endif]-->
	<!--[if IE 9]>
	<div id="<?php echo $tag_id; ?>" class="so-sp-cat msie first-load"><![endif]-->
	<!--[if gt IE 9]><!-->
	<div id="<?php echo $tag_id; ?>" class="so-sp-cat first-load"><!--<![endif]-->
		<div class="spcat-wrap ">
			<div class="spcat-tabs-container"
				 data-delay="<?php echo $product_delay; ?>"
				 data-duration="<?php echo $product_duration; ?>"
				 data-effect="<?php echo $effect; ?>"
				 data-ajaxurl="<?php echo "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; ?>" data-modid="<?php echo $moduleid; ?>">
				<!--Begin Tabs-->
				<?php require ('default_tabs.tpl'); ?>
				<!-- End Tabs-->
			</div>
			<div class="main-left">
				<?php if (!empty($post_text)) :?>
				<div class="banner-post-text">
					<?php echo html_entity_decode($post_text);?>
				</div>
				<?php endif;?>
				<div class="hot-category">
					<?php require ('default_cat.tpl'); ?>
				</div>
			</div>
			<div class="main-right">
				<?php if (!empty($pre_text)) :?>
				<div class="banner-pre-text">
					<?php echo html_entity_decode($pre_text);?>
				</div>
				<?php endif;?>
				<?php if (!empty($tabs)) { 
					$pre_text_class =   (!empty($pre_text)) ? 'show-pre' : '' ;
					$rows_class = ($rows == 1) ? 'show-row' : '';
				?>
					
					<div class="spcat-items-container products-list grid <?php echo $pre_text_class .' '. $rows_class;?>"><!--Begin Items-->
						<?php foreach ($tabs as $items) {
							$child_items = isset($items['child']) ? $items['child'] : '';
							$cls_device = $class_spcat;
							$cls_animate = $effect;
							$cls = (isset($items['sel']) && $items['sel'] == "sel") ? ' spcat-items-selected spcat-items-loaded' : '';
							$cls .= ' items-category-' . $items['category_id'];
							?>
							
							<div class="spcat-items <?php echo $cls; ?> product-layout" data-total="<?php echo $items['count'] ?>">
								<div class="spcat-items-inner <?php echo $cls_device . ' ';
								echo $cls_animate; ?>"
									>
	
									<?php if (!empty($child_items)) {
										require ('default_items.tpl');
									} else {
										?>
										<div class="spcat-loading"></div>
									<?php } ?>
								</div>
							<?php if($type_show == "loadmore")
							{
							?>
								<?php $classloaded = ( $limit >= $items['count'] || $limit == 0) ? 'loaded' : '';?>
								<div class="spcat-loadmore"
									 data-active-content=".items-category-<?php echo $items['category_id']; ?>"
									 data-field_order="<?php echo $items['category_id']; ?>"
									 data-rl_start="<?php echo $limit ?>"
									 data-rl_total="<?php echo $items['count'] ?>"
									 data-rl_allready="<?php echo $all_ready_label; ?>"
									 data-ajaxurl="<?php echo "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; ?>"
									 data-modid="<?php echo $moduleid; ?>"
									 data-rl_load="<?php echo $limit ?>">
									<div class="spcat-loadmore-btn <?php echo $classloaded ?>"
										 data-label="<?php echo ($classloaded) ? $all_ready_label : $load_more_label; ?>">
										<span class="spcat-image-loading"></span>
									</div>
								</div>
							<?php
								}
								?>
							</div>
						<?php } ?>
					</div>
				<?php
				} else {
					echo $NoItem;
				}; ?>
				<!--End Items-->
			</div>
			
			
		</div>
		<?php 
			include("default_js.tpl");
		?>
	</div>
</div>


