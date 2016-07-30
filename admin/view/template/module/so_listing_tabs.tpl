<?php echo $header; ?><?php echo $column_left;?>
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
					<input type="hidden" name="moduleid" value="<?php echo isset($_GET['module_id']) && !empty($_GET['module_id']) ? $_GET['module_id'] : $moduleid; ?>" />
					<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?> <b style="color:#f00">*</b></label>
						<div class="col-sm-10">
							<div class="col-sm-5">
								<?php 
								$i = 0;
								foreach ($languages as $language) { $i++; ?>
									 <input type="text" name="module_description[<?php echo $language['language_id']; ?>][name]" placeholder="<?php echo $entry_name; ?>" id="input-name-<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['name']) ? $module_description[$language['language_id']]['name'] : ''; ?>" class="form-control <?php echo ($i>1) ? ' hide ' : ' first-name'; ?>" />
									 <?php
									 if($i == 1){ ?> 
										<input type="hidden" class="form-control" id="input-name" placeholder="Module Name" value="<?php echo isset($module_description[$language['language_id']]['name']) ? $module_description[$language['language_id']]['name'] : ''; ?>" name="name">
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
							<?php if ($error_name) { ?>
								<div class="text-danger col-sm-12"><?php echo $error_name; ?></div>
							<?php }else { ?>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_name_desc ?></i>
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
						<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_status_desc ?></i>
					</div>
				</div>
			<div class="tab-pane">
				<ul class="nav nav-tabs" id="so_module">
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
						<a href="#tabs_option" data-toggle="tab">
							<?php echo $entry_tabs_option ?>
						</a>
					</li>
					<li>
						<a href="#items_option" data-toggle="tab">
							<?php echo $entry_items_option ?>
						</a>
					</li>
					<li>
						<a href="#image_option" data-toggle="tab">
							<?php echo $entry_image_option ?>
						</a>
					</li>
					<li>
						<a href="#effect_option" data-toggle="tab">
							<?php echo $entry_effect_option ?>
						</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="module">
						<div class="form-group" id="input-category_depth_form">
							<label class="col-sm-2 control-label" for="input-class_suffix"><?php echo $entry_class_suffix; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="class_suffix" value="<?php echo $class_suffix; ?>" id="input-class_suffix" class="form-control" />
								</div>
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
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_1200"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column0" id="input-column_1200" class="form-control">
										<?php 
										foreach($nb_columns as $option_id => $option_value)
											{
												$selected = ($option_id == $nb_column0) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column0_desc ?></i>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_992"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column1" id="input-column_992" class="form-control">
										<?php 
										foreach($nb_columns as $option_id => $option_value)
											{
												$selected = ($option_id == $nb_column1) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column1_desc ?></i>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_768_991"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column2" id="input-column_768_991" class="form-control">
										<?php 
										foreach($nb_columns as $option_id => $option_value)
											{
												$selected = ($option_id == $nb_column2) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column2_desc ?></i>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_480_767"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column3" id="input-column_480_767" class="form-control">
										<?php 
										foreach($nb_columns as $option_id => $option_value)
											{
												$selected = ($option_id == $nb_column3) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column3_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-column_0_479"><?php echo $entry_column ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="nb_column4" id="input-column_0_479" class="form-control">
										<?php 
										foreach($nb_columns as $option_id => $option_value)
											{
												$selected = ($option_id == $nb_column4) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_column4_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-type_show"><?php echo $entry_type_show ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="type_show" id="input-type_show" class="form-control">
										<?php 
										foreach($type_shows as $option_id => $type)
											{
												$selected = ($option_id == $type_show) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $type ?></option>
										<?php
											}
										?>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group type_show_loadmore <?php echo ($type_show == 'loamore') ? ' hide ' : ''; ?>">
							<label class="col-sm-2 control-label" for="input-nb_rows"><?php echo $entry_nb_row ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="nb_rows" value="<?php echo $nb_rows; ?>" id="input-nb_rows" class="form-control" />
								</div>
								<?php if ($error_nb_row) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_nb_row; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_nb_row_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
			
					<div class="tab-pane" id="source_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-type_source"><?php echo $entry_type_source; ?> </label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($type_source) { ?>
										<input type="radio" name="type_source" value="1" checked="checked" />
										<?php echo $entry_field_product; ?>
										<?php } else { ?>
										<input type="radio" name="type_source" value="1" />
										<?php echo $entry_field_product; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$type_source) { ?>
										<input type="radio" name="type_source" value="0" checked="checked" />
										<?php echo $entry_category; ?>
										<?php } else { ?>
										<input type="radio" name="type_source" value="0" />
										<?php echo $entry_category; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_type_source_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?> <b style="color:#f00">*</b></label>
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
								<?php }else { ?>
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
							<label class="col-sm-2 control-label" for="input-category_depth"><?php echo $entry_category_depth; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="category_depth" value="<?php echo $category_depth; ?>" id="input-category_depth" class="form-control" />
								</div>
								<?php if ($error_category_depth) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_category_depth; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_category_depth_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group input-product_order_form">
							<label class="col-sm-2 control-label" for="input-product_order"><?php echo $entry_product_order; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="product_sort" id="input-product_order" class="form-control">
										<?php 
											foreach($product_sorts as $option_id => $option_value)
											{
												$selected = ($option_id == $product_sort) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_product_order_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-ordering"><?php echo $entry_ordering; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="product_ordering" id="input-ordering" class="form-control">
										<?php 
											foreach($product_orderings as $option_id => $option_value)
											{
												$selected = ($option_id == $product_ordering) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_ordering_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-source_limit"><?php echo $entry_source_limit; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="source_limit" value="<?php echo $source_limit; ?>" id="input-source_limit" class="form-control" />
								</div>
								<?php if ($error_source_limit) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_source_limit; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_source_limit_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<label class="col-sm-12"><u style="color:#4e9e41">For Preload</u></label>
						<div class="form-group" id="category_preload">
							<label class="col-sm-2 control-label" for="input-catid_preload"><?php echo $entry_category_preload; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="catid_preload" id="input-catid_preload" class="form-control">
										<?php  if($tab_all_display ==1 && $catid_preload =="*"){
										
										?>
											<option selected="selected" value="*">All Product</option>
										<?php }else if($tab_all_display ==1){
										?>
											<option value="*">All Product</option>
										<?php }?>
										<?php 
										foreach($categorys as $option)
											{
												$selected = ($option['category_id'] == $catid_preload) ? 'selected' :'';
										?>
										
												<option value="<?php echo $option['category_id'] ?>" <?php echo $selected ?> ><?php echo $option['name'] ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_catid_preload_desc ?></i>
							</div>
						</div>
						
						<div class="form-group field_product_tab" >
							<label class="col-sm-2 control-label" for="input-field_product_tab"><?php echo $entry_field_product_tab; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="field_product_tab" value="" placeholder="<?php echo $entry_field_product_tab; ?>" id="input-field_product_tab" class="form-control" />
									<div id="featured-field_product_tab" class="well well-sm" style="height: 150px; overflow: auto;">
										<?php foreach ($field_product_tabs as $field_product_tab) { ?>
											<div id="featured-field_product_tab<?php echo $field_product_tab['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $field_product_tab['name']; ?>
											<input type="hidden" name="field_product_tab[]" value="<?php echo $field_product_tab['product_id']; ?>" />
											</div>
										<?php } ?>
									</div>
								</div>
								<?php if ($error_field_product_tab) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_field_product_tab; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_field_product_tab_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group field_product_tab">
							<label class="col-sm-2 control-label" for="input-field_preload"><?php echo $entry_field_preload; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="field_preload" id="input-field_preload" class="form-control">
										<?php 
										foreach($field_product_tabs as $option)
											{
												$selected = ($option['field_id'] == $field_preload) ? 'selected' :'';
										?>
												<option value="<?php echo $option['product_id'] ?>" <?php echo $selected ?> ><?php echo $option['name'] ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_field_preload_desc ?></i>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="tabs_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-tab_all_display"><?php echo $entry_tab_all_display; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($tab_all_display) { ?>
										<input type="radio" name="tab_all_display" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="tab_all_display" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$tab_all_display) { ?>
										<input type="radio" name="tab_all_display" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="tab_all_display" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_tab_all_display_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-tab_max_characters"><?php echo $entry_tab_max_characters; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="tab_max_characters" value="<?php echo $tab_max_characters; ?>" id="input-count" class="form-control" />
								</div>
								<?php if ($error_tab_max_characters) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_tab_max_characters; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_tab_max_characters_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-tab_icon_display"><?php echo $entry_tab_icon_display; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($tab_icon_display) { ?>
										<input type="radio" name="tab_icon_display" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="tab_icon_display" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$tab_icon_display) { ?>
										<input type="radio" name="tab_icon_display" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="tab_icon_display" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_tab_icon_display_desc ?></i>
							</div>
						</div>
						<div class="form-group field_product_tab">
							<label class="col-sm-2 control-label" for="input-cat_order_by"><?php echo $entry_cat_order_by; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="cat_order_by" id="input-cat_order_by" class="form-control">
										<?php 
										foreach($cat_order_bys as $option_id => $option_value)
											{
												$selected = ($option_id == $cat_order_by) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_cat_order_by_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-imgcfgcat_width"><?php echo $entry_imgcfgcat_width; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="imgcfgcat_width" value="<?php echo $imgcfgcat_width; ?>" id="input-count" class="form-control" />
								</div>
								<?php if ($error_imgcfgcat_width) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_imgcfgcat_width; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_imgcfgcat_width_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-imgcfgcat_height"><?php echo $entry_imgcfgcat_height; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="imgcfgcat_height" value="<?php echo $imgcfgcat_height; ?>" id="input-count" class="form-control" />
								</div>
								<?php if ($error_imgcfgcat_height) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_imgcfgcat_height; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_imgcfgcat_height_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="items_option">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display_title"><?php echo $entry_display_title; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($display_title) { ?>
										<input type="radio" name="display_title" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="display_title" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$display_title) { ?>
										<input type="radio" name="display_title" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="display_title" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_title_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-title_maxlength"><?php echo $entry_title_maxlength; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="title_maxlength" value="<?php echo $title_maxlength; ?>" id="input-title_maxlength" class="form-control" />
								</div>
								<?php if ($error_title_maxlength) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_title_maxlength; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_title_maxlength_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display_description"><?php echo $entry_display_description; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<label class="radio-inline">
										<?php if ($display_description) { ?>
										<input type="radio" name="display_description" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<?php } else { ?>
										<input type="radio" name="display_description" value="1" />
										<?php echo $text_yes; ?>
										<?php } ?>
									</label>
									<label class="radio-inline">
										<?php if (!$display_description) { ?>
										<input type="radio" name="display_description" value="0" checked="checked" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="display_description" value="0" />
										<?php echo $text_no; ?>
										<?php } ?>
									</label>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_description_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-description_maxlength"><?php echo $entry_description_maxlength; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="description_maxlength" value="<?php echo $description_maxlength; ?>" id="input-description_maxlength" class="form-control" />
								</div>
								<?php if ($error_description_maxlength) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_description_maxlength; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_description_maxlength_desc ?></i>
								<?php } ?>
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
							<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="width" value="<?php echo $width; ?>" id="input-width" class="form-control" />
								</div>
								<?php if ($error_width) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_width; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_width_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="height" value="<?php echo $height; ?>" id="input-height" class="form-control" />
								</div>
								<?php if ($error_height) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_height; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_height_desc ?></i>
								<?php } ?>
							</div>
						</div>
					</div>
			<!-- ----------------------------------------------------------------------- -->
					<div class="tab-pane" id="effect_option">
						<label class="col-sm-12"><u style="color:#4e9e41">For Type Show Load More</u></label>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-effect"><?php echo $entry_effect; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="effect" id="input-effect" class="form-control">
										<?php 
										foreach($effects as $option_id => $option_value)
											{
												$selected = ($option_id == $effect) ? 'selected' :'';
										?>
												<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
										<?php
											}
										?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_effect_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-duration"><?php echo $entry_duration; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="duration" value="<?php echo $duration; ?>" id="input-duration" class="form-control" />
								</div>
								<?php if ($error_duration) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_duration; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_duration_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-delay"><?php echo $entry_delay; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="delay" value="<?php echo $delay; ?>" id="input-delay" class="form-control" />
								</div>
								<?php if (!empty($error_delay)) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_delay; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_delay_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<label class="col-sm-12"><u style="color:#4e9e41">For Type Show Slider</u></label>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="autoplay" id="input-autoplay" class="form-control">
										<?php if ($autoplay) { ?>
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
							<label class="col-sm-2 control-label" for="input-display_nav"><?php echo $entry_display_nav; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="display_nav" id="input-display_nav" class="form-control">
										<?php if ($display_nav) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_nav_desc ?></i>
							</div>
						</div>	
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-display_loop"><?php echo $entry_display_loop; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="display_loop" id="input-display_loop" class="form-control">
										<?php if ($display_loop) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_display_loop_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-touchdrag"><?php echo $entry_touchdrag; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="touchdrag" id="input-touchdrag" class="form-control">
										<?php if ($touchdrag) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_touchdrag_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-mousedrag"><?php echo $entry_mousedrag; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="mousedrag" id="input-mousedrag" class="form-control">
										<?php if ($mousedrag) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_mousedrag_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-pausehover"><?php echo $entry_pausehover; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<select name="pausehover" id="input-pausehover" class="form-control">
										<?php if ($pausehover) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
								<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_pausehover_desc ?></i>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplay_timeout"><?php echo $entry_autoplay_timeout; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="autoplay_timeout" value="<?php echo $autoplay_timeout; ?>" id="input-autoplay_timeout" class="form-control" />
								</div>
								<?php if (!empty($entry_autoplay_timeout_error)) { ?>
									<div class="text-danger col-sm-12"><?php echo $entry_autoplay_timeout_error; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_autoplay_timeout_desc ?></i>
								<?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-autoplay_speed"><?php echo $entry_autoplay_speed; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="autoplay_speed" value="<?php echo $autoplay_speed; ?>" id="input-autoplay_speed" class="form-control" />
								</div>
								<?php if (!empty($entry_autoplay_speed_error)) { ?>
									<div class="text-danger col-sm-12"><?php echo $entry_autoplay_speed_error; ?></div>
								<?php }else { ?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_autoplay_speed_desc ?></i>
								<?php } ?>
							</div>
						</div>						
					</div>
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
		$('#input-catid_preload').append('<option value='+item['value']+'>' + item['label'] + '</option>');
	}
});
	
$('#featured-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
	var id_par = $(this).parent().attr('id').substr(17);
	
	$("#input-catid_preload option[value='"+id_par+"']").each(function() {
    $(this).remove();
});
});




$('input[name=\'field_product_tab\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=module/so_listing_tabs/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'field_product_tab\']').val('');
		
		$('#featured-field_product_tab' + item['value']).remove();
		
		$('#featured-field_product_tab').append('<div id="featured-field_product_tab' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="field_product_tab[]" value="' + item['value'] + '" /></div>');
		
		$('#input-field_preload').append('<option value='+item['value']+'>' + item['label'] + '</option>');
		
	}
});
	
$('#featured-field_product_tab').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
	var id_par = $(this).parent().attr('id').substr(26);
	$("#input-field_preload option[value='"+id_par+"']").each(function() {
		$(this).remove();
	});
});
//--></script>
<script type="text/javascript"><!--
	$('#so_module a:first').tab('show');
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
	if($("input[name='type_source']:radio:checked").val() == '0')
	{
		$('.field_product_tab').hide();
		$('#category_preload').show();
		$('.input-product_order_form').show();
	}else
	{
		$('.field_product_tab').show();
		$('#category_preload').hide();
		$('.input-product_order_form').hide();
	}

	$("input[name='type_source']").change(function(){
		val = $(this).val();
		if(val ==0)
		{
			$('.field_product_tab').hide();
			$('#category_preload').show();
			$('.input-product_order_form').show();
		}else
		{
			$('.field_product_tab').show();
			$('#category_preload').hide();
			$('.input-product_order_form').hide();
		}
	});
	
	$('#input-type_show').change(function(){
		var that = $(this), opt_select = $('option:selected', that).val() ;
		console.log(opt_select);
		if (opt_select == 'loamore'){
			$('#input-nb_rows').val(1);
			$('.type_show_loadmore').addClass('hide');
		}else{
			$('.type_show_loadmore').removeClass('hide');
		}
	});
	
	$('#language').change(function(){
		var that = $(this), opt_select = $('option:selected', that).val() , _input = $('#input-name-'+opt_select);
		$('[id^="input-name-"]').addClass('hide');
		_input.removeClass('hide');
		// if (opt_select == 'loamore'){
			// $('#input-nb_rows').val(1);
			// $('.type_show_loadmore').addClass('hide');
		// }else{
			// $('.type_show_loadmore').removeClass('hide');
		// } 
	});
	
	$('.first-name').change(function(){
		$('input[name="name"]').val($(this).val());
	});


	$("input[name='tab_all_display']").change(function(){
		if($(this).val() == 1)
		{
			$('#input-catid_preload').append('<option value=*>All Product</option>');
		}else{
			$("#input-catid_preload option[value='*']").each(function() {
				$(this).remove();
			});
		}
	});
//--></script>
</div>
<?php echo $footer; ?>