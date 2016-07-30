<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save'); ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $objlang->get('entry_button_save')?></button>
				<a class="btn btn-success" onclick="$('#action').val('save_edit');$('#form-featured').submit();" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save_and_edit'); ?>" ><i class="fa fa-pencil-square-o"></i> <?php echo $objlang->get('entry_button_save_and_edit')?></a>
				<a class="btn btn-info" onclick="$('#action').val('save_new');$('#form-featured').submit();" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save_and_new'); ?>" ><i class="fa fa-book"></i>  <?php echo $objlang->get('entry_button_save_and_new')?></a>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_cancel'); ?>" class="btn btn-danger"><i class="fa fa-reply"></i>  <?php echo $objlang->get('entry_button_cancel')?></a>
			</div>
			<h1><?php echo $objlang->get('heading_title'); ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if (isset($error['warning'])) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['warning']; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if (isset($success) && !empty($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_layout; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $subheading; ?></h3>
		</div>
		<div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
				<!-- Nav tabs -->
				<div class="row">
					<ul class="nav nav-tabs" role="tablist">
						<li <?php if( $selectedid ==0 ) { ?>class="active" <?php } ?>> <a href="<?php echo $link; ?>"> <span class="fa fa-plus"></span> <?php echo $objlang->get('button_add_module');?></a></li>
						<?php $i=1; foreach( $moduletabs as $key => $module ){ ?>
						<li role="presentation" <?php if( $module['module_id']==$selectedid ) { ?>class="active"<?php } ?>>
						<a href="<?php echo $link; ?>&module_id=<?php echo $module['module_id']?>" aria-controls="bannermodule-<?php echo $key; ?>"  >
							<span class="fa fa-pencil"></span> <?php echo $module['name']?>
						</a>
						</li>
						<?php $i++ ;} ?>
					</ul>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<?php $module_row = 1; ?>
						<?php foreach ($modules as $module) { ?>
						<?php if( $selectedid ){ ?>
						<div class="pull-right">
							<a href="<?php echo $action;?>&delete=1" class="remove btn btn-danger" ><span><i class="fa fa-remove"></i> <?php echo $objlang->get('entry_button_delete');?></span></a>
						</div>
						<?php } ?>
						<div  id="tab-module<?php echo $module_row; ?>" class="col-sm-12">
					<div class="form-group"> <!-- Module Name-->
						<input type="hidden" name="action" id="action" value=""/>
						<input type="hidden" name="moduleid" value="<?php echo $module['last_moduleid']; ?>" />
						<label class="col-sm-3 control-label" for="input-name"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_name_desc'); ?>"><?php echo $objlang->get('entry_name'); ?> </span></label>
						<div class="col-sm-9">
							<div class="col-sm-5">
								<input type="text" name="name" value="<?php echo $module['name']; ?>" placeholder="<?php echo $objlang->get('entry_name'); ?>" id="input-name" class="form-control" />
							</div>
							<?php if (isset($error['name'])) { ?>
							<div class="text-danger col-sm-12"><?php echo $error['name']; ?></div>
							<?php }?>
						</div>
					</div>
					<div class="form-group"> <!-- Header title-->
						<label class="col-sm-3 control-label" for="input-head_name"><b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_head_name_desc'); ?>"><?php echo $objlang->get('entry_head_name'); ?> </span></label>
						<div class="col-sm-9">
							<div class="col-sm-5">
								<?php $i = 0;
								foreach ($languages as $language) { $i++; ?>
									<input type="text" name="module_description[<?php echo $language['language_id']; ?>][head_name]" placeholder="<?php echo $objlang->get('entry_head_name'); ?>" id="input-head-name-<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" class="form-control <?php echo ($i>1) ? ' hide ' : ' first-name'; ?>" />
								<?php if($i == 1){ ?>
									<input type="hidden" class="form-control" id="input-head_name" placeholder="<?php echo $objlang->get('entry_head_name'); ?>" value="<?php echo isset($module_description[$language['language_id']]['head_name']) ? $module_description[$language['language_id']]['head_name'] : ''; ?>" name="head_name">
								<?php } ?>
								<?php } ?>
							</div>
							<div class="col-sm-3">
								<select  class="form-control" id="language">
									<?php foreach ($languages as $language) { ?>
									<option value="<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></option>
									<?php } ?>
								</select>
							</div>
							<?php if (isset($error['head_name'])) { ?>
							<div class="text-danger col-sm-12"><?php echo $error['head_name']; ?></div>
							<?php }?>
						</div>
					</div>
					<div class="form-group"> <!--Display header title -->
						<label class="col-sm-3 control-label" for="input-disp_title_module"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_title_module_desc'); ?>"><?php echo $objlang->get('entry_display_title_module'); ?> </span></label>
						<div class="col-sm-9">
							<div class="col-sm-5">
								<select name="disp_title_module" id="input-disp_title_module" class="form-control">
									<?php
											if ($module['disp_title_module']) { ?>
									<option value="1" selected="selected"><?php echo $objlang->get('text_yes'); ?></option>
									<option value="0"><?php echo $objlang->get('text_no'); ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $objlang->get('text_yes'); ?></option>
									<option value="0" selected="selected"><?php echo $objlang->get('text_no'); ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group"> <!--Status -->
						<label class="col-sm-3 control-label" for="input-status"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_status_desc'); ?>"><?php echo $objlang->get('entry_status'); ?> </span></label>
						<div class="col-sm-9">
							<div class="col-sm-5">
								<select name="status" id="input-status" class="form-control">
									<?php if ($module['status']) { ?>
									<option value="1" selected="selected"><?php echo $objlang->get('text_enabled'); ?></option>
									<option value="0"><?php echo $objlang->get('text_disabled'); ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $objlang->get('text_enabled'); ?></option>
									<option value="0" selected="selected"><?php echo $objlang->get('text_disabled'); ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
				</div>
				
						<div class="tab-pane">
							<ul class="nav nav-tabs" id="so_youtech">
								<li>
									<a href="#so_module_module" data-toggle="tab">
										<?php echo $objlang->get('entry_module') ?>
									</a>
								</li>
								<li>
									<a href="#so_module_blog_option" data-toggle="tab">
										<?php echo $objlang->get('entry_blog_option') ?>
									</a>
								</li>
								<li>
									<a href="#so_module_image_option" data-toggle="tab">
										<?php echo $objlang->get('entry_image_option') ?>
									</a>
								</li>
								<li>
									<a href="#effect_option" data-toggle="tab">
										<?php echo $objlang->get('entry_effect_option') ?>
									</a>
								</li>
							</ul>
							<div class="tab-content">
						<!-- ----------------------------------------------------------------------- -->
								<div class="tab-pane" id="so_module_module"> <!--General Option -->
									<div class="form-group"> <!--Class suffix -->
										<label class="col-sm-3 control-label" for="input-class_suffix"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_class_suffix_desc'); ?>"><?php echo $objlang->get('entry_class_suffix'); ?> </span> </label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="class_suffix" value="<?php echo $module['class_suffix']; ?>" id="input-class_suffix" class="form-control" />
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Open link-->
										<label class="col-sm-3 control-label" for="input-open_link"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_open_link_desc'); ?>"><?php echo $objlang->get('entry_open_link'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="item_link_target" id="input-open_link" class="form-control">
													<?php
													foreach($item_link_targets as $option_id => $option_value)
													{
													$selected = ($option_id == $module['item_link_target']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
													}
												?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Limit -->
										<label class="col-sm-3 control-label" for="input-limit">
											<b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_limit_desc'); ?>"><?php echo $objlang->get('entry_limit'); ?> </span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="limit" value="<?php echo $module['limit']; ?>" id="input-limit" class="form-control" />
											</div>
											<?php if (isset($error['limit'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['limit']; ?></div>
											<?php }?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="input-button_page">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_page_desc'); ?>"><?php echo $objlang->get('entry_button_page'); ?> </span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="button_page" id="input-button_page" class="form-control">
													<?php
														foreach($button_pages as $option_id => $option_value)
													{
													$selected = ($option_id == $module['button_page']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--column 1-->
										<label class="col-sm-3 control-label" for="input-column_1200"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column0_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="nb_column0" id="input-column_1200" class="form-control">
													<?php
												foreach($nb_columns as $option_id => $option_value)
													{
													$selected = ($option_id == $module['nb_column0']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
													}
												?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--column 2-->
										<label class="col-sm-3 control-label" for="input-column_992_1199"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column1_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="nb_column1" id="input-column_992_1199" class="form-control">
													<?php
												foreach($nb_columns as $option_id => $option_value)
													{
													$selected = ($option_id == $module['nb_column1']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
													}
												?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--column 3-->
										<label class="col-sm-3 control-label" for="input-column_768_991"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column2_desc'); ?>"><?php echo $objlang->get('entry_column'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="nb_column2" id="input-column_768_991" class="form-control">
													<?php
												foreach($nb_columns as $option_id => $option_value)
													{
													$selected = ($option_id == $module['nb_column2']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
													}
												?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--column 4-->
										<label class="col-sm-3 control-label" for="input-column_480_767"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column3_desc'); ?>"><?php echo $objlang->get('entry_column'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="nb_column3" id="input-column_480_767" class="form-control">
													<?php
												foreach($nb_columns as $option_id => $option_value)
													{
													$selected = ($option_id == $module['nb_column3']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
													}
												?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--column 5-->
										<label class="col-sm-3 control-label" for="input-column_0_479"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_column4_desc'); ?>"><?php echo $objlang->get('entry_column'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="nb_column4" id="input-column_0_479" class="form-control">
													<?php foreach($nb_columns as $option_id => $option_value)
													{
													$selected = ($option_id == $module['nb_column4']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
												}
											?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Type show-->
										<label class="col-sm-3 control-label" for="input-type_show">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_type_show_desc'); ?>"><?php echo $objlang->get('entry_type_show'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="type_show" id="input-type_show" class="form-control">
													<?php
													foreach($type_shows as $option_id => $type)
													{
													$selected = ($option_id == $module['type_show']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $type ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="input-nb_row">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_nb_row_desc'); ?>"><?php echo $objlang->get('entry_nb_row'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="nb_row" id="input-nb_row" class="form-control">
													<?php
													foreach($nb_rows as $option_id => $option_value)
													{
													$selected = ($option_id == $module['nb_row']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
														}
													?>
												</select>
											</div>
										</div>
									</div>
								</div>

						<!-- ----------------------------------------------------------------------- -->
								<div class="tab-pane" id="so_module_blog_option"> <!--blog Option -->
									<div class="form-group"> <!--Display Title -->
										<label class="col-sm-3 control-label" for="input-display_title"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_title_desc'); ?>"><?php echo $objlang->get('entry_display_title'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_title']) { ?>
													<input type="radio" name="display_title" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_title" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_title']) { ?>
													<input type="radio" name="display_title" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_title" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Title Maxlength -->
										<label class="col-sm-3 control-label" for="input-title_maxlength"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_title_maxlength_desc'); ?>"><?php echo $objlang->get('entry_title_maxlength'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="title_maxlength" value="<?php echo $module['title_maxlength']; ?>" id="input-title_maxlength" class="form-control" />
											</div>
											<?php if (isset($error['title_maxlength'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['title_maxlength']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--Display Description -->
										<label class="col-sm-3 control-label" for="input-display_description"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_description_desc'); ?>"><?php echo $objlang->get('entry_display_description'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_description']) { ?>
													<input type="radio" name="display_description" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_description" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_description']) { ?>
													<input type="radio" name="display_description" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_description" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Description Maxlength -->
										<label class="col-sm-3 control-label" for="input-description_maxlength"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_description_maxlength_desc'); ?>"><?php echo $objlang->get('entry_description_maxlength'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="description_maxlength" value="<?php echo $module['description_maxlength']; ?>" id="input-description_maxlength" class="form-control" />
											</div>
											<?php if (isset($error['description_maxlength'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['description_maxlength']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--Display Author -->
										<label class="col-sm-3 control-label" for="input-display_author">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_author_desc'); ?>"><?php echo $objlang->get('entry_display_author'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_author']) { ?>
													<input type="radio" name="display_author" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_author" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_author']) { ?>
													<input type="radio" name="display_author" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_author" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Display comment -->
										<label class="col-sm-3 control-label" for="input-display_comment">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_comment_desc'); ?>"><?php echo $objlang->get('entry_display_comment'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_comment']) { ?>
													<input type="radio" name="display_comment" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_comment" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_comment']) { ?>
													<input type="radio" name="display_comment" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_comment" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Display view -->
										<label class="col-sm-3 control-label" for="input-display_view">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_view_desc'); ?>"><?php echo $objlang->get('entry_display_view'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_view']) { ?>
													<input type="radio" name="display_view" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_view" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_view']) { ?>
													<input type="radio" name="display_view" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_view" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Display date added -->
										<label class="col-sm-3 control-label" for="input-display_date_added">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_date_added_desc'); ?>"><?php echo $objlang->get('entry_display_date_added'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_date_added']) { ?>
													<input type="radio" name="display_date_added" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_date_added" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_date_added']) { ?>
													<input type="radio" name="display_date_added" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_date_added" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Display Readmore -->
										<label class="col-sm-3 control-label" for="input-display_readmore">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_display_readmore_desc'); ?>"><?php echo $objlang->get('entry_display_readmore'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['display_readmore']) { ?>
													<input type="radio" name="display_readmore" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="display_readmore" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['display_readmore']) { ?>
													<input type="radio" name="display_readmore" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="display_readmore" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--Readmore text -->
										<label class="col-sm-3 control-label" for="input-readmore_text">
											<b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_readmore_text_desc'); ?>"><?php echo $objlang->get('entry_readmore_text'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="readmore_text" value="<?php echo $module['readmore_text']; ?>" id="input-readmore_text" class="form-control" />
											</div>
											<?php if (isset($error['readmore_text'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['readmore_text']; ?></div>
											<?php } ?>
										</div>
									</div>

								</div>
						<!-- ----------------------------------------------------------------------- -->
								<div class="tab-pane" id="so_module_image_option">  <!--Image Option -->
									<div class="form-group"> <!--blog Image -->
										<label class="col-sm-3 control-label" for="input-blog_image">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_blog_image_desc'); ?>"><?php echo $objlang->get('entry_blog_image'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['blog_image']) { ?>
													<input type="radio" name="blog_image" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="blog_image" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['blog_image']) { ?>
													<input type="radio" name="blog_image" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="blog_image" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--blog Get Image From Tab Image -->
										<label class="col-sm-3 control-label" for="input-blog_get_featured_image">
											<span data-toggle="tooltip" title="<?php echo $objlang->get('entry_blog_get_featured_image_desc'); ?>"><?php echo $objlang->get('entry_blog_get_featured_image'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['blog_get_featured_image']) { ?>
													<input type="radio" name="blog_get_featured_image" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="blog_get_featured_image" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['blog_get_featured_image']) { ?>
													<input type="radio" name="blog_get_featured_image" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="blog_get_featured_image" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--blog Width -->
										<label class="col-sm-3 control-label" for="input-width">
											<b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_width_desc'); ?>"><?php echo $objlang->get('entry_width'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="width" value="<?php echo $module['width']; ?>" id="input-width" class="form-control" />
											</div>
											<?php if (isset($error['width'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['width']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--blog height -->
										<label class="col-sm-3 control-label" for="input-height">
											<b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_height_desc'); ?>"><?php echo $objlang->get('entry_height'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="height" value="<?php echo $module['height']; ?>" id="input-height" class="form-control" />
											</div>
											<?php if (isset($error['height'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['height']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--Placeholder Path -->
										<label class="col-sm-3 control-label" for="input-blog_placeholder_path">
											<b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_blog_placeholder_path_desc'); ?>"><?php echo $objlang->get('entry_blog_placeholder_path'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="blog_placeholder_path" value="<?php echo $module['blog_placeholder_path']; ?>" id="input-blog_placeholder_path" class="form-control" />
											</div>
											<?php if (isset($error['blog_placeholder_path'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['blog_placeholder_path']; ?></div>
											<?php } ?>
										</div>
									</div>
								</div>
						<!-- ----------------------------------------------------------------------- -->
								<div class="tab-pane" id="effect_option"> <!--Effect Option -->
									<div class="form-group"> <!--Margin -->
										<label class="col-sm-3 control-label" for="input-margin"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_margin_desc'); ?>"><?php echo $objlang->get('entry_margin'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="margin" value="<?php echo $module['margin']; ?>" id="input-margin" class="form-control" />
											</div>
											<?php if (isset($error['margin'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['margin']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--slideBy -->
										<label class="col-sm-3 control-label" for="input-slideBy"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_slideBy_desc'); ?>"><?php echo $objlang->get('entry_slideBy'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="slideBy" value="<?php echo $module['slideBy']; ?>" id="input-slideBy" class="form-control" />
											</div>
											<?php if (isset($error['slideBy'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['slideBy']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--autoplay -->
										<label class="col-sm-3 control-label" for="input-autoplay"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_autoplay_desc'); ?>"><?php echo $objlang->get('entry_autoplay'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['autoplay']) { ?>
													<input type="radio" name="autoplay" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="autoplay" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['autoplay']) { ?>
													<input type="radio" name="autoplay" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="autoplay" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--autoplay Timeout -->
										<label class="col-sm-3 control-label" for="input-autoplay_timeout">
											<b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_autoplayTimeout_desc'); ?>"><?php echo $objlang->get('entry_autoplay_timeout'); ?></span>
										</label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="autoplay_timeout" value="<?php echo $module['autoplay_timeout']; ?>" id="input-autoplay_timeout" class="form-control" />
											</div>
											<?php if (isset($error['autoplay_timeout'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['autoplay_timeout']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--autoplay Hover Pause -->
										<label class="col-sm-3 control-label" for="input-pausehover"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_pausehover_desc'); ?>"><?php echo $objlang->get('entry_pausehover'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['pausehover']) { ?>
													<input type="radio" name="pausehover" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="pausehover" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['pausehover']) { ?>
													<input type="radio" name="pausehover" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="pausehover" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--autoplay Speed-->
										<label class="col-sm-3 control-label" for="input-autoplaySpeed"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_autoplaySpeed_desc'); ?>"><?php echo $objlang->get('entry_autoplaySpeed'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="autoplaySpeed" value="<?php echo $module['autoplaySpeed']; ?>" id="input-autoplaySpeed" class="form-control" />
											</div>
											<?php if (isset($error['autoplaySpeed'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['autoplaySpeed']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--start Position-->
										<label class="col-sm-3 control-label" for="input-startPosition"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_startPosition_desc'); ?>"><?php echo $objlang->get('entry_startPosition'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="startPosition" value="<?php echo $module['startPosition']; ?>" id="input-startPosition" class="form-control" />
											</div>
											<?php if (isset($error['startPosition'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['startPosition']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--mouse Drag-->
										<label class="col-sm-3 control-label" for="input-mouseDrag"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_mouseDrag_desc'); ?>"><?php echo $objlang->get('entry_mouseDrag'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['mouseDrag']) { ?>
													<input type="radio" name="mouseDrag" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="mouseDrag" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['mouseDrag']) { ?>
													<input type="radio" name="mouseDrag" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="mouseDrag" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--touch Drag-->
										<label class="col-sm-3 control-label" for="input-touchDrag"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_touchDrag_desc'); ?>"><?php echo $objlang->get('entry_touchDrag'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['touchDrag']) { ?>
													<input type="radio" name="touchDrag" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="touchDrag" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['touchDrag']) { ?>
													<input type="radio" name="touchDrag" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="touchDrag" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!-- Loop -->
										<label class="col-sm-3 control-label" for="input-loop"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_loop_desc'); ?>"><?php echo $objlang->get('entry_loop'); ?> </span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['loop']) { ?>
													<input type="radio" name="loop" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="loop" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['loop']) { ?>
													<input type="radio" name="loop" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="loop" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--button page-->
										<label class="col-sm-3 control-label" for="input-button_page"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_page_desc'); ?>"><?php echo $objlang->get('entry_button_page'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="button_page" id="input-button_page" class="form-control">
													<?php
											foreach($button_pages as $option_id => $option_value)
													{
													$selected = ($option_id == $module['button_page']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
												}
											?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--dots-->
										<label class="col-sm-3 control-label" for="input-dots"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_dots_desc'); ?>"><?php echo $objlang->get('entry_dots'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['dots']) { ?>
													<input type="radio" name="dots" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="dots" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['dots']) { ?>
													<input type="radio" name="dots" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="dots" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--dots Speed-->
										<label class="col-sm-3 control-label" for="input-dotsSpeed"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_dotsSpeed_desc'); ?>"><?php echo $objlang->get('entry_dotsSpeed'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="dotsSpeed" value="<?php echo $module['dotsSpeed']; ?>" id="input-dotsSpeed" class="form-control" />
											</div>
											<?php if (isset($error['dotsSpeed'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['dotsSpeed']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--navs-->
										<label class="col-sm-3 control-label" for="input-navs"><span data-toggle="tooltip" title="<?php echo $objlang->get('entry_navs_desc'); ?>"><?php echo $objlang->get('entry_navs'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<label class="radio-inline">
													<?php if ($module['navs']) { ?>
													<input type="radio" name="navs" value="1" checked="checked" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } else { ?>
													<input type="radio" name="navs" value="1" />
													<?php echo $objlang->get('text_yes'); ?>
													<?php } ?>
												</label>
												<label class="radio-inline">
													<?php if (!$module['navs']) { ?>
													<input type="radio" name="navs" value="0" checked="checked" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } else { ?>
													<input type="radio" name="navs" value="0" />
													<?php echo $objlang->get('text_no'); ?>
													<?php } ?>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--nav Speed-->
										<label class="col-sm-3 control-label" for="input-navSpeed"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_navspeed_desc'); ?>"><?php echo $objlang->get('entry_navspeed'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="navSpeed" value="<?php echo $module['navSpeed']; ?>" id="input-navSpeed" class="form-control" />
											</div>
											<?php if (isset($error['navSpeed'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['navSpeed']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--effect-->
										<label class="col-sm-3 control-label" for="input-effect"> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_effect_desc'); ?>"><?php echo $objlang->get('entry_effect'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<select name="effect" id="input-effect" class="form-control">
													<?php
											foreach($effects as $option_id => $option_value)
													{
													$selected = ($option_id == $module['effect']) ? 'selected' :'';
													?>
													<option value="<?php echo $option_id ?>" <?php echo $selected ?> ><?php echo $option_value ?></option>
													<?php
												}
											?>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"> <!--duration-->
										<label class="col-sm-3 control-label" for="input-duration"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_duration_desc'); ?>"><?php echo $objlang->get('entry_duration'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="duration" value="<?php echo $module['duration']; ?>" id="input-duration" class="form-control" />
											</div>
											<?php if (isset($error['duration'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['duration']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group"> <!--delay-->
										<label class="col-sm-3 control-label" for="input-delay"> <b style="font-weight:bold; color:#f00">*</b> <span data-toggle="tooltip" title="<?php echo $objlang->get('entry_delay_desc'); ?>"><?php echo $objlang->get('entry_delay'); ?></span></label>
										<div class="col-sm-9">
											<div class="col-sm-5">
												<input type="text" name="delay" value="<?php echo $module['delay']; ?>" id="input-delay" class="form-control" />
											</div>
											<?php if (isset($error['delay'])) { ?>
											<div class="text-danger col-sm-12"><?php echo $error['delay']; ?></div>
											<?php }?>
										</div>
									</div>
								</div>
								<?php $module_row++; ?>
								<?php } ?>
							</div>
						</div>
						<!-- --------------------------------------------------------------- -->
					</div>
				</div>
        	</form>
      	</div>
    </div>	
  </div>

<script type="text/javascript"><!--
	$('#so_youtech a:first').tab('show');
	$('#language').change(function(){
		var that = $(this), opt_select = $('option:selected', that).val() , _input = $('#input-head-name-'+opt_select);
		$('[id^="input-head-name-"]').addClass('hide');
		_input.removeClass('hide');
	});
	$('.first-name').change(function(){
		$('input[name="head_name"]').val($(this).val());
	});
//--></script>
</div>
<?php echo $footer; ?>