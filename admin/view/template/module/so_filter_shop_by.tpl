
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary sj_filter_submit"><i class="fa fa-save"></i></button>
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
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal sj_filter_form">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?> <b style="color:#f00">*</b></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
								</div>
								<?php if ($error_name) { ?>
									<div class="text-danger col-sm-12"><?php echo $error_name; ?></div>
								<?php }else{?>
									<i class="col-sm-12" style="font-weight:normal; color:#ccc"><?php echo $entry_name_desc ?></i>
								<?php } ?>
							</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-name"><?php echo 'In CLass'; ?></label>
							<div class="col-sm-10">
								<div class="col-sm-5">
									<input type="text" name="in_class" value="<?php echo $in_class; ?>" id="input-class" class="form-control" />
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
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo 'Column';?></label>
						<div class="col-sm-10">
							<div class="col-sm-5">
								<select name="column_in_row" id="input-column" class="form-control">
									<?php 
										if($column_in_row == ''){
											$index = 4;
										}else{
											$index = $column_in_row;
										}
										for($i = 1; $i < 5; $i++){
			
											if($index == $i){	
												$selected_c = ' selected="selected"';
											}else{
												$selected_c = '';
											}
											echo '<option value="'.$i.'"'.$selected_c.'>'.$i.'</option>';
										}
									?>
								</select>
							</div>
						</div>
					</div>
					<input type="hidden" name="database" value="<?php if(isset($database) && $database != '')echo $database;?>" class="sj_filter_shop_by_database"/>
			</form>
      </div>
	  <div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-paw"></i> <?php echo $text_edit_content; ?></h3>
	 </div>
	 <div class="panel-body">
	 <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->
				<div class="col-sm-4 sj_filter_shop_by_content_menu">
						<div class="btn btn-warning sj_filter_shop_by_content_menu_title">Content</div>
						<div class="sj_filter_shop_by_content_menu_content">
							
							
						</div>
						<div class="sj_fulll_absolute"></div>
				</div>
				 <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------->
				 <div class="col-sm-4 sj_filter_shop_by_content_menu_type">
						<div class="btn btn-warning sj_filter_shop_by_content_menu_title">Chose Type Filter</div>
						<div class="sj_wrap_border">
							<div class="sj_wrap">
								<div class="bg-success sj_item_type_filter" data-type="categories"><div class="sj_move_type_filter">Categories</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
								<div class="bg-success sj_item_type_filter" data-type="filed_min_max"><div class="sj_move_type_filter">Filed Min Max</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
								<div class="bg-success sj_item_type_filter" data-type="field_chose"><div class="sj_move_type_filter">Filed Chose</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
								<div class="bg-success sj_item_type_filter" data-type="search"><div class="sj_move_type_filter">Search</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
								<!-- <div class="bg-success sj_item_type_filter" data-type="model"><div class="sj_move_type_filter">Model</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div> -->
								<div class="bg-success sj_item_type_filter" data-type="filed_radio"><div class="sj_move_type_filter">Filed Radio</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
								<div class="bg-success sj_item_type_filter" data-type="reset_all"><div class="sj_move_type_filter">Reset All</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
								<div class="bg-success sj_item_type_filter" data-type="rating"><div class="sj_move_type_filter">Rating</div><div class="sj_action_type_filter"><i class="fa fa-paper-plane-o"></i></div></div>
							</div>
						</div>						
				 </div>
				  <div class="col-sm-4 sj_filter_shop_by_content_menu_categories">
						<div class="btn btn-warning sj_filter_shop_by_content_menu_title sj_chose_categories_title">Chose Category<input class="sj_filter_search_categories"type="text" readonly="true"/></div>
						<div class="sj_wrap_border sj_chose_categories_relative">
							<div class="sj_wrap sj_chose_categories">
						<?php 
						foreach($categories as $ca){ 
							$str_name = str_replace('&nbsp;','',$ca['name']);
							$array_str_name = explode('&gt;',$str_name);
							$data_name = $array_str_name[count($array_str_name) - 1];
						?>
							<div class="bg-success sj_item_category" data-name="<?php echo $data_name;?>" data-id="<?php echo $ca['category_id'];?>"><div class="sj_move_category_filter" data-html="<?php echo $ca['name'];?>"><?php echo $ca['name'];?></div><div class="sj_action_category_filter"><i class="fa fa-paper-plane-o"></i></div></div>
						<?php } ?>
							</div>
							<div class="sj_not_chose"></div>
						</div>
				  </div>
	</div>
    </div>	
		
  </div>
</div>	
<div class="sj_filter_type_move"></div>
<div class="bg-success sj_filter_type_move_category"></div>
<?php echo $footer; ?>

<script type="text/javascript">
	$(document).ready(function(){
		var index;
		var val_database = $('.sj_filter_shop_by_database').val();
		var height_title_item;
		if(val_database != ''){
			var array_item_content = val_database.split('-----');
			for(var i = 0; i < array_item_content.length; i++){
					$('.sj_filter_shop_by_content_menu_content').append('<div class="sj_filter_shop_by_content_menu_conten_item_wrap"></div>');
					var element = $('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').eq(i);
					var array_info = array_item_content[i].split('---');
					var type = array_info[0];
					element.html('<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="'+array_info[0]+'">'+
												'<div class="sj_title_item"><p>Categories</p><input type="text" value="Categories"/></div>'+
												'<div class="sj_action_item">'+
													'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
													'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
													'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
												'</div>');
					
					if(type != 'search' && type != 'reset_all'){
						element.append('<div class="sj_filter_shop_by_content_menu_conten_item"></div>');
					}
					if(type == 'field_chose' || type == 'filed_radio'){
						element.find('.sj_filter_shop_by_content_menu_conten_item').append('<div class="sj_content_wrap"></div><div class="sj_finter_input_add bg-success">Add<i class="fa fa-plus"></i></div>');
					}
					if(type == 'categories'){
						element.append('<div class="sj_filter_shop_by_content_category_type" style="display:none;"></div>');
						var info =  array_info[2].split('--');
						for(var t = 0; t < info.length; t++){
								if(info[t] == 1){
									var bg = 'darkgoldenrod';
									var text = 'Show';
								}else{
									var bg = 'darkgray';
									var text = 'Hide';
								}
								if(t == 0){
									var cls = 'logo';
									var text_c = 'Logo';
								}else{
									var cls = 'radio';
									var text_c = 'Radio';
								}
								element.find('.sj_filter_shop_by_content_category_type').append('<div class="sj_filter_category_show_'+cls+'" data-val="'+info[t]+'" style="background: '+bg+'">'+text+' '+text_c+'</div>');
						}	
					}
					var array_e = array_info[1].split('--');
					for(var e = 0; e < array_e.length; e++){
							if(e == 0){
									element.find('.sj_title_item p').html(array_e[e]);
									element.find('.sj_title_item input').val(array_e[e]);
							}else{
									if(type == 'categories'){
										var info_caregory = array_e[e].split('-');
										element.find('.sj_filter_shop_by_content_menu_conten_item').append('<div class="sj_filter_category_item_wrap bg-success" style="height: auto;"><div class="sj_name_category" data-id="'+info_caregory[0]+'">'+info_caregory[1].split('*')[0]+'</div><div class="sj_action_category"><div class="sj_action_category_delete"><i class="fa fa-times"></i></div></div></div>')
									}
									if(type == 'filed_min_max'){
										if(e == 1){
											var name_f = 'Field:'
										}
										if(e == 2){
											var name_f = 'Max:'
										}
										if(e == 3){
											var name_f = 'Min:'
										}
										if(e == 4)continue;
										element.find('.sj_filter_shop_by_content_menu_conten_item').append('<div class="sj_finter_input bg-success">'+
																																						'<div class="sj_finter_input_name">'+name_f+'</div>'+
																																						'<div class="sj_finter_input_content"><input type="text" value="'+array_e[e]+'"/></div>'+
																																					'</div>');
																																					
									}
									if(type == 'field_chose' || type == 'filed_radio'){
											if(e == 1){
												var name_f = 'Field:'
												var data = array_e[e];
											}else{
												var name_f = 'Value:';
												var data = array_e[e].split('*')[0];
											}
											
											element.find('.sj_filter_shop_by_content_menu_conten_item .sj_content_wrap').append('<div class="sj_finter_input bg-success"><div class="sj_finter_input_name">'+name_f+'</div><div class="sj_finter_input_content"><input type="text" value="'+data+'"/></div></div>');
									}
							}							
					}
					height_title_item = 28;					
			}
		}
		var array_html_type = new Array();
		array_html_type['categories']       = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="categories">'+
																	'<div class="sj_title_item"><p>Categories</p><input type="text" value="Categories"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>'+
																'<div class="sj_filter_shop_by_content_menu_conten_item">'+
																		
																'</div>'+
																'<div class="sj_filter_shop_by_content_category_type" style="display:none;">'+
																	'<div class="sj_filter_category_show_logo" data-val="1">Show Logo</div>'+
																	'<div class="sj_filter_category_show_radio" data-val="1">Show Radio</div>'+
																'</div>';
		array_html_type['reset_all']       = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="reset_all">'+
																	'<div class="sj_title_item"><p>Reset All</p><input type="text" value="Reset All"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>';
																
		array_html_type['filed_min_max'] = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="filed_min_max">'+
																	'<div class="sj_title_item"><p>Min Max</p><input type="text" value="Min Max"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>'+
																'<div class="sj_filter_shop_by_content_menu_conten_item">'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Field:</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Max</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Min</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																'</div>';	
		array_html_type['field_chose'] = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="field_chose">'+
																	'<div class="sj_title_item"><p>Field Chose</p><input type="text" value="Field Chose"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>'+
																'<div class="sj_filter_shop_by_content_menu_conten_item">'+
																	'<div class="sj_content_wrap">'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Field:</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Value</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																		
																	'</div>'+
																	'<div class="sj_finter_input_add bg-success">Add<i class="fa fa-plus"></i>'+
																		
																	'</div>'+
																'</div>';	
																
		array_html_type['filed_radio'] = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="filed_radio">'+
																	'<div class="sj_title_item"><p>Field Radio</p><input type="text" value="Field Radio"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>'+
																'<div class="sj_filter_shop_by_content_menu_conten_item">'+
																	'<div class="sj_content_wrap">'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Field:</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																		'<div class="sj_finter_input bg-success">'+
																			'<div class="sj_finter_input_name">Value</div>'+
																			'<div class="sj_finter_input_content"><input type="text"/></div>'+
																		'</div>'+
																		
																	'</div>'+
																	'<div class="sj_finter_input_add bg-success">Add<i class="fa fa-plus"></i>'+
																		
																	'</div>'+
																'</div>';
																
		array_html_type['search'] = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="search">'+
																	'<div class="sj_title_item"><p>Search</p><input type="text" value="Search"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>';
		array_html_type['rating'] = '<div class="bg-success sj_filter_shop_by_content_menu_title_item" data-type="rating">'+
																	'<div class="sj_title_item"><p>Rating</p><input type="text" value="Rating"/></div>'+
																	'<div class="sj_action_item">'+
																	'<div class="sj_action_item_action sj_action_item_remove"><i class="fa fa-times"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_move"><i class="fa fa-arrows"></i></div>'+
																	'<div class="sj_action_item_action sj_action_item_edit"><i class="fa fa-pencil"></i></div>'+
																	'</div>'+
																'</div>';
																
		var move_on = 0;
		$('body').on('click','.sj_filter_shop_by_content_menu_conten_item_wrap .sj_title_item',function(){
				var type = $(this).parent().attr('data-type');
				if(type == 'search' || type == 'reset_all'){
					$('.sj_filter_shop_by_content_menu_conten_item').slideUp();
					index = -1;
					$('.sj_not_chose').css('display','block');
					$('.sj_chose_categories_title input').attr('readonly','true');
					$('.sj_filter_shop_by_content_menu_conten_item_wrap').find('.sj_filter_shop_by_content_menu_conten_item').removeClass('sj_filter_group_categories');
					$('.sj_filter_shop_by_content_category_type').css('display','none');
					return;
				}
				
				if(index == $(this).parent().parent().index()){
					$('.sj_filter_shop_by_content_menu_conten_item').slideUp();
					index = -1;
					$('.sj_not_chose').css('display','block');
					$('.sj_chose_categories_title input').attr('readonly','true');
					$('.sj_filter_shop_by_content_menu_conten_item_wrap').find('.sj_filter_shop_by_content_menu_conten_item').removeClass('sj_filter_group_categories');
					$('.sj_filter_shop_by_content_category_type').css('display','none');
					return;
				}
				
				$('.sj_filter_shop_by_content_menu_conten_item_wrap').find('.sj_filter_shop_by_content_menu_conten_item').removeClass('sj_filter_group_categories');
				$('.sj_filter_shop_by_content_category_type').css('display','none');
				if(type == 'categories'){
					$('.sj_not_chose').css('display','none');
					$('.sj_chose_categories_title input').removeAttr('readonly');
					$(this).parent().parent().find('.sj_filter_shop_by_content_menu_conten_item').addClass('sj_filter_group_categories');
					$(this).parent().parent().find('.sj_filter_shop_by_content_category_type').css('display','block');
				}else{
					$('.sj_not_chose').css('display','block');
					$('.sj_chose_categories_title input').attr('readonly','true');
					
				}
				$('.sj_filter_shop_by_content_menu_conten_item').slideUp();
				$(this).parent().parent().find('.sj_filter_shop_by_content_menu_conten_item').slideDown();
				index = $(this).parent().parent().index();
		});

		var move_on_tab_y;
		var on_mouse_down = 0;
		var move_on_tab_top;
		var move_on_tab_html;
		
		$('body').on('click','.sj_filter_shop_by_content_menu_conten_item_wrap .sj_action_item .sj_action_item_remove',function(event){
				$(this).parent().parent().parent().remove();
		})
		$('body').on('mousedown','.sj_filter_shop_by_content_menu_conten_item_wrap .sj_action_item .sj_action_item_move',function(event){
				$('.sj_filter_shop_by_content_menu_conten_item').slideUp();
				move_on_tab_y = event.pageY;
				on_mouse_down = 1;
				var height = parseInt($(this).parent().parent().parent().css('height'));
				height_title_item = height;
				$('.sj_fulll_absolute').css('display','block');
				var index = parseInt($(this).parent().parent().parent().index());
				move_on_tab_html = $(this).parent().parent().parent().html();
				var css_height = height * index ;		
				//alert(css_height);		
				move_on_tab_top = css_height;
				var margin = 10*index + 10;
				move_on_tab_top = css_height + margin;
				//alert(margin);
				//alert(css_height + margin);
				$('.sj_filter_shop_by_content_menu_content').find('.sj_filter_shop_by_content_menu_conten_item_wrap').eq(index).after('<div class="sj_move_on_menu"></div>')
				$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('height',height + 'px');
				$(this).parent().parent().parent().addClass('sj_move_on_menu_absolute');
				$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu_absolute').css('top',(css_height + margin) + 'px');
		});
		
		$('body').mouseup(function(){
				if(on_mouse_down == 1){
					on_mouse_down = 0;
					$('.sj_fulll_absolute').css('display','none');
					$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').addClass('sj_filter_shop_by_content_menu_conten_item_wrap');
					$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').html(move_on_tab_html);
					$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('height','auto');
					$('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').removeClass('sj_move_on_menu');
					$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu_absolute').remove();
				}else{
					return;
				}
		});
		
		$('body').mousemove(function(event){
			if(on_mouse_down == 1){
				var move_on_y = event.pageY;
				var css_top =move_on_tab_top + parseInt(move_on_y) - parseInt(move_on_tab_y);
				$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').remove();
				$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu_absolute').css('top',css_top + 'px');
				var index = parseInt((css_top)/(height_title_item+10));
				if(index < 0){
						
						$('.sj_filter_shop_by_content_menu_content').prepend('<div class="sj_move_on_menu"></div>');
						$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('marginTop','10px');
				}else if(index > (parseInt($('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').length)-1)){
						$('.sj_filter_shop_by_content_menu_content').append('<div class="sj_move_on_menu"></div>');
				}else{
						$('.sj_filter_shop_by_content_menu_content').find('.sj_filter_shop_by_content_menu_conten_item_wrap').eq(index).after('<div class="sj_move_on_menu"></div>')
				}			
				$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('height',height_title_item + 'px');
			}	
		});
		
		$('.sj_filter_shop_by_content_menu_type .sj_item_type_filter .sj_action_type_filter').on('click',function(){
				var type= $(this).parent().attr('data-type');
		});
		
		$('body').on('click','.sj_filter_shop_by_content_menu_title_item .sj_action_item .sj_action_item_edit',function(){
				$(this).parent().parent().find('.sj_title_item p').css('display','none');
				$(this).parent().parent().find('.sj_title_item input').css('display','block');
				$(this).parent().parent().find('.sj_title_item input').focus();
		});
		
		$('body').on('focusout','.sj_filter_shop_by_content_menu_title_item .sj_title_item input',function(){
				var val = $(this).val();
				$(this).parent().parent().find('.sj_title_item p').css('display','block');
				$(this).parent().parent().find('.sj_title_item p').html(val);
				$(this).css('display','none');
		});
	
		var on_move_type = 0;
		var on_move_type_x;
		var on_move_type_y;
		var css_move_type_top;
		var css_move_type_left;
		$('body').on('mousedown','.sj_filter_shop_by_content_menu_type .sj_item_type_filter',function(event){
				$('.sj_filter_shop_by_content_category_type').css('display','none');
				$('.sj_filter_shop_by_content_menu_conten_item').slideUp();
				index = -1;
				var type = $(this).attr('data-type');
				on_move_type = 1;
				var scroll = $(window).scrollTop();
				var offset = $(this).offset();
				var left = offset.left;
				var top = offset.top - scroll;
				on_move_type_x = event.screenX;
				on_move_type_y = event.screenY;
				css_move_type_top = top;
				css_move_type_left = left;
				$('.sj_filter_type_move').css('top',top+'px');
				$('.sj_filter_type_move').css('left',left+'px');
				$('.sj_filter_type_move').css('display','block');
				$('.sj_filter_type_move').css('height',$(this).css('height'));
				$('.sj_filter_type_move').css('width',$(this).css('width'));
				height_title_item = parseInt($(this).css('height'));
				$('.sj_filter_type_move').empty();
				$('.sj_filter_type_move').html(array_html_type[type]);
				move_on_tab_html = array_html_type[type];
		});
		
		$('body').mousemove(function(event){
				if(on_move_type == 1){
					var x = event.screenX;
					var y = event.screenY;
					var top = css_move_type_top + y - on_move_type_y;
					var left = css_move_type_left + x - on_move_type_x;
					$('.sj_filter_type_move').css('top',top+'px');
					$('.sj_filter_type_move').css('left',left+'px');
					$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').remove();
					var offset = $('.sj_filter_shop_by_content_menu_content').offset();
					var top = offset.top;
					var left = offset.left;
					var y = event.pageY;
					var x = event.pageX;
					var top =  y - top;
					var height = $('.sj_filter_shop_by_content_menu_content').css('height');
					var max_width = left + parseInt($('.sj_filter_shop_by_content_menu_content').css('width'));
					if(top > 0 && top < parseInt(height) && x < max_width && x > left){
						index =  parseInt((top)/(height_title_item + 10));
						if(top < 20 || parseInt($('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').length) == 0){

							$('.sj_filter_shop_by_content_menu_content').prepend('<div class="sj_move_on_menu"></div>');
							$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('marginTop','10px');
						}else if(index > (parseInt($('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').length)-1)){
							$('.sj_filter_shop_by_content_menu_content').append('<div class="sj_move_on_menu"></div>');
			
						}else{
							$('.sj_filter_shop_by_content_menu_content').find('.sj_filter_shop_by_content_menu_conten_item_wrap').eq(index).after('<div class="sj_move_on_menu"></div>');

						}			
						$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('height',height_title_item + 'px');
						
					}else{
						$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').remove();
					}								
				}
		})
		var on_hover_content = 0;
				
		$('body').mouseup(function(){
				if(on_move_type == 1){
						on_move_type = 0;
						$('.sj_filter_type_move').css('display','none');
						if($('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').length == 1){						
						
						$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').addClass('sj_filter_shop_by_content_menu_conten_item_wrap');
						$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').html(move_on_tab_html);
						$('.sj_filter_shop_by_content_menu_content .sj_move_on_menu').css('height','auto');
						
						$('.sj_move_on_menu').find('.sj_filter_shop_by_content_menu_conten_item').slideDown();
						var type = $('.sj_move_on_menu').find('.sj_filter_shop_by_content_menu_title_item').attr('data-type');
						$('.sj_filter_shop_by_content_menu_conten_item_wrap').find('.sj_filter_shop_by_content_menu_conten_item').removeClass('sj_filter_group_categories');
						
						if(type == 'categories'){
							$('.sj_not_chose').css('display','none');
							$('.sj_chose_categories_title input').removeAttr('readonly');
							$('.sj_move_on_menu').find('.sj_filter_shop_by_content_menu_conten_item').addClass('sj_filter_group_categories');
							$('.sj_move_on_menu').find('.sj_filter_shop_by_content_category_type').css('display','block');
						}else{
							$('.sj_not_chose').css('display','block');
							$('.sj_chose_categories_title input').attr('readonly','true');
						}
						if(parseInt($('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').length) == 0){
							index = 0;
						}else{
							for(var i = 0; i < parseInt($('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').length); i++){
									if($('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').eq(i).hasClass('sj_move_on_menu')){
										index = i;
										break;
									}
							}
						}
						
						move_on = 1;
						$('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').removeClass('sj_move_on_menu');
						}
				}
		})

		$('.sj_filter_search_categories').keyup(function(){
				var low = $(this).val();
				var val = $(this).val();
				$('.sj_item_category').css('display','block');
				if(val == ''){
					for(var i = 0; i < $('.sj_item_category').length; i++){
						var change = $('.sj_item_category').eq(i).find('.sj_move_category_filter').attr('data-html');
						$('.sj_item_category').eq(i).find('.sj_move_category_filter').html(change);
					}
					return;
				}
				val = val.toUpperCase();
				var data;
				for(var i = 0; i < $('.sj_item_category').length; i++){
						data = $('.sj_item_category').eq(i).attr('data-name');
						data = data.toUpperCase();
						if(parseInt(data.indexOf(val)) == -1){
							$('.sj_item_category').eq(i).css('display','none')
						}else{
							var change = $('.sj_item_category').eq(i).find('.sj_move_category_filter').attr('data-html');
							var array_change = change.split('  ');
							var ss = array_change[(array_change.length-1)];

							change = '';
							
							if(array_change.length > 1){							
									for(var b = 0; b < (array_change.length - 1); b++){
										change = change + array_change[b] + '&nbsp;&nbsp;&gt;&nbsp;&nbsp;';
									}
									
							}
							change = change + ss.replace(low,'<span class="sj_search">'+low+'</span>');							
							$('.sj_item_category').eq(i).find('.sj_move_category_filter').html(change);
						}
				}
				
				var array_val = val.split(' ');
				if(array_val.length == 1){
						return;
				}else{
						for(var a = 0; a < array_val.length; a++){
								val = array_val[a];
								for(var e = 0; e < $('.sj_item_category').length; e++){
										data = $('.sj_item_category').eq(e).attr('data-name');
										data = data.toUpperCase();
										if(parseInt(data.indexOf(val)) != -1){
											$('.sj_item_category').eq(e).css('display','block')
										}
								}
						}
				}
				
		});
		
		$('body').on('click','.sj_filter_shop_by_content_menu_conten_item .sj_finter_input_add',function(){
				var parent = $(this).parent();
				var input = parent.find('.sj_content_wrap .sj_finter_input').eq(parseInt(parent.find('.sj_content_wrap .sj_finter_input').length) - 1).html();
				parent.find('.sj_content_wrap').append('<div class="sj_finter_input bg-success">'+input+'</div>');
		});
		var move_category = 0;
		var move_category_x;
		var move_category_y;
		var move_category_left;
		var move_category_top;
		var move_category_html;
		$('body').on('mousedown','.sj_chose_categories .sj_move_category_filter',function(event){
			move_category = 1;
			var scroll = $(window).scrollTop();
			var offset = $(this).offset();
			var left = offset.left;
			var top = offset.top - scroll;
			var id = $(this).parent().attr('data-id');
			move_category_top = top;
			move_category_left = left;
			move_category_x = event.screenX;
			move_category_y = event.screenY;
			var height = $(this).parent().css('height');
			var html = $(this).attr('data-html');
			var width = $(this).parent().css('width');
			$('.sj_filter_type_move_category').css('height',height);
			$('.sj_filter_type_move_category').css('display','block');
			$('.sj_filter_type_move_category').css('width',width);
			$('.sj_filter_type_move_category').css('top',top+'px');
			$('.sj_filter_type_move_category').css('left',left+'px');
			$('.sj_filter_type_move_category').html('<div class="sj_name_category" data-id="'+id+'">'+html+'</div><div class="sj_action_category"><div class="sj_action_category_delete"><i class="fa fa-times"></i></div></div>');			
			move_category_html = $('.sj_filter_type_move_category').html();
		});
		$('body').mousemove(function(event){
			if(move_category == 1){
					var x = event.screenX;
					var y = event.screenY;
					var top = move_category_top + y - move_category_y;
					var left = move_category_left + x - move_category_x;
					$('.sj_filter_type_move_category').css('top',top+'px');
					$('.sj_filter_type_move_category').css('left',left+'px');
					var offset = $('.sj_filter_group_categories').offset();
					var top = offset.top;
					var left = offset.left;
					var y = event.pageY;
					var x = event.pageX;
					var top =  y - top;
					var height = $('.sj_filter_group_categories').css('height');
					var max_width = left + parseInt($('.sj_filter_group_categories').css('width'));
					$('.sj_filter_group_categories .sj_move_on_categories').remove();
	
					if(top > 0 && top < parseInt(height) && x < max_width && x > left){
						var index =  parseInt((top)/(height_title_item + 10));
						if(top < 20 || parseInt($('.sj_filter_group_categories .sj_filter_category_item_wrap').length) == 0){

							$('.sj_filter_group_categories').prepend('<div class="sj_move_on_categories"></div>');

						}else if(index > (parseInt($('.sj_filter_group_categories .sj_filter_category_item_wrap').length)-1)){
							$('.sj_filter_group_categories').append('<div class="sj_move_on_categories"></div>');
			
						}else{
							$('.sj_filter_group_categories').find('.sj_filter_category_item_wrap').eq(index).after('<div class="sj_move_on_categories"></div>');

						}			

						
					}else{
						$('.sj_filter_group_categories .sj_move_on_categories').remove();
					}
			}
		})
		$('body').mouseup(function(){
				if(move_category == 1){
					move_category = 0;
					$('.sj_filter_type_move_category').css('display','none');
					if($('.sj_move_on_categories').length > 0){
						$('.sj_move_on_categories').html(move_category_html);
						$('.sj_move_on_categories').addClass('sj_filter_category_item_wrap');
						$('.sj_move_on_categories').addClass('bg-success');
						$('.sj_move_on_categories').css('height','auto');
						$('.sj_filter_category_item_wrap').removeClass('sj_move_on_categories');
					}
				}
		})
		
		$('body').on('click','.sj_filter_category_show_logo',function(){
			$(this).css('background','darkgray');
			var attr = $(this).attr('data-val');
			if(attr == 1){
				$(this).css('background','darkgray');
				$(this).attr('data-val',0);		
				$(this).html('Hide Logo');		
			}else{
				$(this).css('background','darkgoldenrod');
				$(this).attr('data-val',1);	
				$(this).html('Show Logo');		
			}
		});
		
		$('body').on('click','.sj_filter_category_show_radio',function(){
			$(this).css('background','darkgray');
			var attr = $(this).attr('data-val');
			if(attr == 1){
				$(this).css('background','darkgray');
				$(this).attr('data-val',0);		
				$(this).html('Hide Radio');		
			}else{
				$(this).css('background','darkgoldenrod');
				$(this).attr('data-val',1);	
				$(this).html('Show Radio');		
			}
		});
		
		$('body').on('click','.sj_action_category_delete',function(){
				$(this).parent().parent().remove();
		});
		$('.sj_filter_submit').click(function(){
				var val;
				var length_wrap = $('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').length;
				for(var i = 0; i < length_wrap; i++){
						var element = $('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').eq(i);
						var type = $('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').eq(i).find('.sj_filter_shop_by_content_menu_title_item').attr('data-type');
						if(i == 0){
							val = '';
						}else{
							val = val + "-----";
						}
						val = val + type + '---';
						var name = $('.sj_filter_shop_by_content_menu_content .sj_filter_shop_by_content_menu_conten_item_wrap').eq(i).find('.sj_filter_shop_by_content_menu_title_item .sj_title_item p').html();
						val = val + name;
						if(type == 'categories'){
							var length = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_filter_category_item_wrap').length;
							for(var a = 0; a < length; a++){
									var id = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_filter_category_item_wrap').eq(a).find('.sj_name_category').attr('data-id');
									val = val + '--' + id ;
									var nameE = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_filter_category_item_wrap').eq(a).find('.sj_name_category').html();
									val = val + '-' + nameE ;
							}
							element.find('.sj_filter_shop_by_content_category_type');
							val = val + '---' + element.find('.sj_filter_shop_by_content_category_type .sj_filter_category_show_logo').attr('data-val');
							val = val + '--' + element.find('.sj_filter_shop_by_content_category_type .sj_filter_category_show_radio').attr('data-val');
							continue;
						}
						if(type == "filed_min_max"){
								var length = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_finter_input').length;
								for(var a = 0; a < length; a++){
									var input = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_finter_input').eq(a).find('.sj_finter_input_content input').val();
									val = val + '--' + input ;
								}
							continue;
						}
						if(type == "search" || type == "reset_all"){
							continue;
						}
						if(type == "field_chose" || type == "filed_radio"){
								var length = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_content_wrap .sj_finter_input').length;
								for(var a = 0; a < length; a++){
									var input = element.find('.sj_filter_shop_by_content_menu_conten_item .sj_content_wrap .sj_finter_input').eq(a).find('.sj_finter_input_content input').val();
									val = val + '--' + input ;
								}
								continue;
						}
				}

				$.ajax({
					type: 'POST',
					url: '<?php echo HTTP_CATALOG;?>/index.php?route=module/so_filter_shop_by/build_data',
					data: {
						val: val,
					},
						success: function (data) {
							$('.sj_filter_shop_by_database').val(data['html']);
							$('.sj_filter_form').submit();
						},
					dataType: 'json'
				});				
		})

	})
</script>