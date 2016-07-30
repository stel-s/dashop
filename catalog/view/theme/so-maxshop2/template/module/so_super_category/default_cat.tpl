<div class="category-wrap-cat">
    <?php 
    if (!empty($category_parent) && $display_slide_category == 1) {
        ?>
        <div class="title-imageslider  sp-cat-title-parent">
			 <?php echo $text_hot_cate;?>
        </div>
   <?php } ?>

    <?php $tag = 'cat_slider_' . rand() . time();
    if (!empty($category_tree)) {
        ?>
        <div id="<?php echo $tag ?>" class="slider">
		<?php if(isset($category_tree) && count($category_tree) > 0){?>
		 <?php if (!empty($category_parent) && $display_slide_category == 1) {?>
			<?php if ($show_category_type == 0 ){$cls_type=" so_category_type_default";}else{$cls_type = "";}?>
            <div class="cat_slider_inner<?php echo $cls_type;?>">
                <?php
                foreach ($category_tree as $cat_tree) {
					if($category_parent['name'] == $cat_tree['name'])continue;
                    ?>
                    <div class="item">
                        <div class="item-inner">
                            <?php if ($display_title_sub_category && count($category_tree) > 1) { ?>
                                <div class="cat_slider_title">
									
                                    <a href="<?php echo $cat_tree['link']; ?>"
                                       title="<?php echo $cat_tree['name']; ?>" target="<?php echo $item_link_target?>">
                                       <i class="fa fa-caret-right"></i> <?php echo $cat_tree['name_maxlength']; ?>
                                    </a>
                                </div>
                            <?php } ?>

                        </div>
                    </div>
                <?php
                } ?>

            </div>
			 <?php } ?>
		<?php }?>
        </div>
    <?php } ?>
    
</div>
