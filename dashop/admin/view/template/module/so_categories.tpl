<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
		</div>
		<div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?> <b style="font-weight:bold; color:#f00">*</b></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
						</div>
						<?php if ($error_name) { ?>
							<div class="text-danger col-sm-12"><?php echo $error_name; ?></div>
						<?php }else{ ?>
							<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_name_desc ?></i>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<input type="hidden" name="moduleid" value="<?php echo isset($_GET['module_id']) && !empty($_GET['module_id']) ? $_GET['module_id'] : $moduleid; ?>" />
					<label class="col-sm-2 control-label" for="input-head_name"><?php echo $entry_head_name; ?> <b style="color:#f00">*</b></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<?php
								$i = 0;
								foreach ($languages as $language) { $i++; ?>
							<input type="text" name="module_description[<?php echo $language['language_id']; ?>][head_name]" placeholder="<?php echo $entry_head_name; ?>" id="input-head-name-<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" class="form-control <?php echo ($i>1) ? ' hide ' : ' first-name'; ?>" />
							<?php
									 if($i == 1){ ?>
							<input type="hidden" class="form-control" id="input-head_name" placeholder="Module Head Name" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" name="head_name">
							<?php }
									 ?>
							<?php } ?>
						</div>
						<div class="col-sm-2">
							<select  class="form-control" id="language">
								<?php foreach ($languages as $language) { ?>
								<option value="<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></option>
								<?php } ?>
							</select>
						</div>
						<?php if ($error_head_name) { ?>
						<div class="text-danger col-sm-12"><?php echo $error_head_name; ?></div>
						<?php }else { ?>
						<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_head_name_desc ?></i>
						<?php } ?>

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-disp_title_module"><?php echo $entry_display_title_module; ?></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<select name="disp_title_module" id="input-disp_title_module" class="form-control">
								<?php
								if ($disp_title_module) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
					<div class="col-sm-10">
						<div class="col-sm-5">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
			<div class="tab-pane">
				<ul class="nav nav-tabs" id="virtuemart">
					<li>
						<a href="#module" data-toggle="tab">
							<?php echo $entry_module ?>
						</a>
					</li>
					<li>
						<a href="#source_option" data-toggle="tab">
							<?php echo $entry_source_option ?>
						</a>
					</li>
					<li>
						<a href="#category_option" data-toggle="tab">
							<?php echo $entry_category_option ?>
						</a>
					</li>
					<li>
						<a href="#image_option" data-toggle="tab">
							<?php echo $entry_image_option ?>
						</a>
					</li>
					<li>
						<a href="#advanced" data-toggle="tab">
							<?php echo $entry_advanced ?>
						</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="module">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-deviceclass_sfx"><?php echo $entry_deviceclass_sfx ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<textarea name="deviceclass_sfx" rows="5" class="form-control" id="input-deviceclass_sfx"><?php echo $deviceclass_sfx?></textarea>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_deviceclass_sfx_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-theme"><?php echo $entry_theme ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="theme" id="input-theme" class="form-control">
										<?php 
											foreach($themes as $option_id => $option_value)
											{
												$selected = ($option_id == $theme) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_theme_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-open_link"><?php echo $entry_open_link ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="item_link_target" id="input-open_link" class="form-control">
										<?php 
											foreach($item_link_targets as $option_id => $option_value)
											{
												$selected = ($option_id == $item_link_target) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_open_link_desc ?></i>
							</div>
						</div>
						<div class="form-group input-accmouseenter_form">
							<label class="col-sm-2 control-label" for="input-accmouseenter"><?php echo $entry_accmouseenter ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="accmouseenter" id="input-accmouseenter" class="form-control">
										<?php 
											foreach($accmouseenters as $option_id => $option_value)
											{
												$selected = ($option_id == $accmouseenter) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_accmouseenter_desc ?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="source_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
									<div id="featured-category" class="well well-sm" style="height: 150px; overflow: auto;">
										<?php foreach ($categorys as $category) { ?>
											<div id="featured-category<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
											<input type="hidden" name="category[]" value="<?php echo $category['category_id']; ?>" />
											</div>
										<?php } ?>
									</div>
								</div>
								<?php if ($error_category) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_category; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_category_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-child_category"><?php echo $entry_child_category; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($child_category) { ?>
										<input type="radio" name="child_category" value="1" checked="checked" />
										<?php echo $entry_include; ?>
										<?php } else { ?>
										<input type="radio" name="child_category" value="1" />
										<?php echo $entry_include; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$child_category) { ?>
										<input type="radio" name="child_category" value="0" checked="checked" />
										<?php echo $entry_exclude; ?>
										<?php } else { ?>
										<input type="radio" name="child_category" value="0" />
										<?php echo $entry_exclude; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_child_category_desc ?></i>
							</div>
						</div>
						<div class="form-group" id="input-category_depth_form">
							<label class="col-sm-2 control-label" for="input-category_depth"><?php echo $entry_category_depth; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="category_depth" value="<?php echo $category_depth; ?>" id="input-category_depth" class="form-control" />
								</div>
								<?php if ($error_category_depth) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_category_depth; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_category_depth_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-source_limit"><?php echo $entry_source_limit; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="source_limit" value="<?php echo $source_limit; ?>" id="input-source_limit" class="form-control" />
								</div>
								<?php if ($error_source_limit) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_source_limit; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_source_limit_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="category_option">
						<label class="col-sm-12 "><u style="color:#4e9e41"><?php echo $entry_category_option__?></u></label>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="input-cat_title_display"><?php echo $entry_cat_title_display; ?></label>
							<div class="col-sm-9">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($cat_title_display) { ?>
										<input type="radio" name="cat_title_display" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="cat_title_display" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$cat_title_display) { ?>
										<input type="radio" name="cat_title_display" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="cat_title_display" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_cat_title_display_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="input-cat_title_maxcharacs"><?php echo $entry_cat_title_maxcharacs; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-9">
								<div class="col-sm-5">
									<input type="text" name="cat_title_maxcharacs" value="<?php echo $cat_title_maxcharacs; ?>" id="input-cat_title_maxcharacs" class="form-control" />
								</div>
								<?php if ($error_cat_title_maxcharacs) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_cat_title_maxcharacs; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_cat_title_maxcharacs_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<label class="col-sm-12"><u style="color:#4e9e41"><?php echo $entry_sub_category_option__?></u></label>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="input-cat_sub_title_display"><?php echo $entry_cat_sub_title_display; ?></label>
							<div class="col-sm-9">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($cat_sub_title_display) { ?>
										<input type="radio" name="cat_sub_title_display" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="cat_sub_title_display" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$cat_sub_title_display) { ?>
										<input type="radio" name="cat_sub_title_display" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="cat_sub_title_display" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_cat_sub_title_display_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="input-cat_sub_title_maxcharacs"><?php echo $entry_cat_sub_title_maxcharacs; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-9">
								<div class="col-sm-5">
									<input type="text" name="cat_sub_title_maxcharacs" value="<?php echo $cat_sub_title_maxcharacs; ?>" id="input-cat_sub_title_maxcharacs" class="form-control" />
								</div>
								<?php if ($error_cat_sub_title_maxcharacs) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_cat_sub_title_maxcharacs; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_cat_sub_title_maxcharacs_desc ?></i>
								<?php } ?>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label" for="input-cat_all_product"><?php echo $entry_cat_all_product; ?></label>
							<div class="col-sm-9">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($cat_all_product) { ?>
										<input type="radio" name="cat_all_product" value="1" checked="checked" />
										<?php echo $text_show; ?>
										<?php } else { ?>
										<input type="radio" name="cat_all_product" value="1" />
										<?php echo $text_show; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$cat_all_product) { ?>
										<input type="radio" name="cat_all_product" value="0" checked="checked" />
										<?php echo $text_hide; ?>
										<?php } else { ?>
										<input type="radio" name="cat_all_product" value="0" />
										<?php echo $text_hide; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_cat_all_product_desc ?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="image_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-product_image"><?php echo $entry_product_image; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($product_image) { ?>
										<input type="radio" name="product_image" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="product_image" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$product_image) { ?>
										<input type="radio" name="product_image" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="product_image" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_product_image_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="width" value="<?php echo $width; ?>" id="input-width" class="form-control" />
								</div>
								<?php if ($error_width) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_width; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_width_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="height" value="<?php echo $height; ?>" id="input-height" class="form-control" />
								</div>
								<?php if ($error_height) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_height; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_height_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-background"><?php echo $entry_background; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="background" value="<?php echo $background; ?>" id="input-background" class="form-control" />
								</div>
								<?php if ($error_background) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_background; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_background_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-placeholder_path"><?php echo $entry_placeholder_path; ?> <b style="font-weight:bold; color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="placeholder_path" value="<?php echo $placeholder_path; ?>" id="input-placeholder_path" class="form-control" />
								</div>
								<?php if ($error_placeholder_path) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_placeholder_path; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_placeholder_path_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="advanced">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-pretext"><?php echo $entry_pretext; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<textarea name="pretext" rows="5" class="form-control" id="input-pretext"><?php echo $pretext?></textarea>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_pretext_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-posttext"><?php echo $entry_posttext; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<textarea name="posttext" rows="5" class="form-control" id="input-posttext"><?php echo $posttext?></textarea>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_posttext_desc ?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
				</div>
			</div>
        </form>
      </div>
    </div>	
  </div>
  <script type="text/javascript"><!--
$('input[name=\'category\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'category\']').val('');
		
		$('#featured-category' + item['value']).remove();
		
		$('#featured-category').append('<div id="featured-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#featured-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
$('#virtuemart a:first').tab('show');
if($("input[name='child_category']:radio:checked").val() == '0')
{
	$('#input-category_depth_form').hide();
}else
{
	$('#input-category_depth_form').show();
}

$("input[name='child_category']").change(function(){
	val = $(this).val();
	if(val ==0)
	{
		$('#input-category_depth_form').hide();
	}else
	{
		$('#input-category_depth_form').show();
	}
});
var theme = $("#input-theme").val();
if(theme != 'theme4')
{
	$(".input-accmouseenter_form").hide();
}else{
	$(".input-accmouseenter_form").show();
}
$("#input-theme").change(function(){
	var theme = $(this).val();
	if(theme != 'theme4')
	{
		$(".input-accmouseenter_form").hide();
	}else{
		$(".input-accmouseenter_form").show();
	}
});
	$('#language').change(function(){
		var that = $(this), opt_select = $('option:selected', that).val() , _input = $('#input-head-name-'+opt_select);
		$('[id^="input-head-name-"]').addClass('hide');
		_input.removeClass('hide');
	});

	$('.first-name').change(function(){
		$('input[name="head-name"]').val($(this).val());
	});

	//--></script>
</div>
<?php echo $footer; ?>