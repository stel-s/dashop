<div class="module block_category">
	<h3 class="modtitle"><span><?php echo $heading_title; ?></span></h3>
	<div class="modcontent box-content">
		<ul class="list-group">
		  <?php $categories = array_reverse($categories); ?>
		  <?php foreach ($categories as $category) { ?>
		  <li <?php if ($category['children']) { ?> class="hadchild" <?php } ?>>
		  <a href="<?php echo $category['href']; ?>" class="list-group-item <?php if ($category['category_id'] == $category_id){ ?> active <?php } ?>"><span><?php echo $category['name']; ?></span></a>
		  <?php if ($category['children']) { ?>
		  <span class="button-view <?php if ($category['category_id'] == $category_id){ ?> ttopen <?php } else { ?> ttclose <?php } ?> ">view</span>
		  <ul <?php if ($category['category_id'] == $category_id){ ?>  style="display: block;"  <?php } else { ?> style="display: none;" <?php } ?>>
		  <?php foreach ($category['children'] as $child) { ?>
			<?php if ($child['category_id'] == $child_id) { ?>
				<li><a href="<?php echo $child['href']; ?>" class="list-group-item active"><span><?php echo $child['name']; ?></span></a></li>
			<?php } else { ?>
				<li><a href="<?php echo $child['href']; ?>" class="list-group-item"><span> <?php echo $child['name']; ?></span></a></li>
			<?php } ?>
		  <?php } ?>
		  </ul>
		  <?php } ?>
		  </li>
		  <?php } ?>
		</ul>
	</div>
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		$('span.button-view').click(function() {
		if ($(this).hasClass('ttopen')) {varche = true} else {varche = false};
		if(varche == false){
			$(this).addClass("ttopen");
			$(this).removeClass("ttclose");
			$(this).parent().find('ul').slideDown();
			varche = true;
		} else 
		{	
			$(this).removeClass("ttopen");
			$(this).addClass("ttclose");
			$(this).parent().find('ul').slideUp();
			varche = false;
		}
		});
	});
	
</script>

