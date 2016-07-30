<?php
class ControllerModuleSolistingtabs extends Controller {
	private $error = array();
	public function index() {
		$this->load->language('module/so_listing_tabs');
		$this->load->model('catalog/category');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				
				$this->model_extension_module->addModule('so_listing_tabs', $this->request->post);
				
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		//Default
		$data['heading_title']  = $this->language->get('heading_title');

		$data['text_edit']      = $this->language->get('text_edit');
		$data['text_enabled'] 	= $this->language->get('text_enabled');
		$data['text_disabled'] 	= $this->language->get('text_disabled');
		$data['text_yes'] 			= $this->language->get('text_yes');
		$data['text_no'] 			= $this->language->get('text_no');
		$data['entry_name'] 		= $this->language->get('entry_name');
		$data['entry_name_desc'] 	= $this->language->get('entry_name_desc');
		$data['entry_nb_row']		= $this->language->get('entry_nb_row');
		$data['entry_nb_row_desc']		= $this->language->get('entry_nb_row_desc');
		$data['help_product'] 	= $this->language->get('help_product');
		
		$data['text_yes'] 		= $this->language->get('text_yes');
		$data['text_no'] 		= $this->language->get('text_no');
		$data['text_show'] 		= $this->language->get('text_show');
		$data['text_hide'] 		= $this->language->get('text_hide');
		$data['entry_status'] 	= $this->language->get('entry_status');
		$data['button_save'] 	= $this->language->get('button_save');
		$data['button_cancel'] 	= $this->language->get('button_cancel');
		$data['entry_status'] 	= $this->language->get('entry_status');
		$data['entry_include'] 	= $this->language->get('entry_include');
		$data['entry_exclude'] 	= $this->language->get('entry_exclude');
		$data['entry_type_show'] 	= $this->language->get('entry_type_show');
		//Title tabs
		$data['entry_module'] 			= $this->language->get('entry_module');
		$data['entry_display_title_module']     = $this->language->get('entry_display_title_module');
		$data['entry_status_desc']				= $this->language->get('entry_status_desc');
		$data['entry_source_option'] 	= $this->language->get('entry_source_option');
		$data['entry_tabs_option'] 		= $this->language->get('entry_tabs_option');
		$data['entry_items_option'] 	= $this->language->get('entry_items_option');
		$data['entry_image_option'] 	= $this->language->get('entry_image_option');
		$data['entry_effect_option'] 	= $this->language->get('entry_effect_option');
		$data['entry_advanced'] 	    = $this->language->get('entry_advanced');
		
		//Tabs General
		$data['entry_open_link'] 			= $this->language->get('entry_open_link');
		$data['entry_open_link_desc'] 		= $this->language->get('entry_open_link_desc');
		$data['entry_column'] 				= $this->language->get('entry_column');
		$data['entry_column_desc'] 			= $this->language->get('entry_column_desc');
		$data['entry_nb_column0_desc'] 		= $this->language->get('entry_nb_column0_desc');
		$data['entry_nb_column1_desc'] 		= $this->language->get('entry_nb_column1_desc');
		$data['entry_nb_column2_desc'] 		= $this->language->get('entry_nb_column2_desc');
		$data['entry_nb_column3_desc'] 		= $this->language->get('entry_nb_column3_desc');
		$data['entry_nb_column4_desc'] 		= $this->language->get('entry_nb_column4_desc');
		
		//Tabs Source options
		$data['entry_type_source'] 			= $this->language->get('entry_type_source');
		$data['entry_type_source_desc'] 	= $this->language->get('entry_type_source_desc');
		$data['entry_category'] 			= $this->language->get('entry_category');
		$data['entry_category_desc'] 		= $this->language->get('entry_category_desc');
		$data['entry_child_category'] 		= $this->language->get('entry_child_category');
		$data['entry_child_category_desc'] 	= $this->language->get('entry_child_category_desc');
		$data['entry_category_depth'] 		= $this->language->get('entry_category_depth');
		$data['entry_category_depth_desc'] 	= $this->language->get('entry_category_depth_desc');
		$data['entry_product_order'] 		= $this->language->get('entry_product_order');
		$data['entry_product_order_desc'] 	= $this->language->get('entry_product_order_desc');
		$data['entry_ordering']				= $this->language->get('entry_ordering');
		$data['entry_ordering_desc']		= $this->language->get('entry_ordering_desc');
		$data['entry_source_limit'] 		= $this->language->get('entry_source_limit');
		$data['entry_source_limit_desc'] 	= $this->language->get('entry_source_limit_desc');
		
		$data['entry_field_product'] 			= $this->language->get('entry_field_product');
		$data['entry_field_product_desc'] 		= $this->language->get('entry_field_product_desc');
		$data['entry_field_product_tab'] 		= $this->language->get('entry_field_product_tab');
		$data['entry_field_product_tab_desc'] 	= $this->language->get('entry_field_product_tab_desc');
		$data['entry_field_preload'] 			= $this->language->get('entry_field_preload');
		$data['entry_field_preload_desc'] 		= $this->language->get('entry_field_preload_desc');
		$data['entry_category_preload'] 		= $this->language->get('entry_category_preload');
		$data['entry_catid_preload_desc'] 		= $this->language->get('entry_catid_preload_desc');
		
		//Tabs Tabs options
		$data['entry_tab_all_display'] 				= $this->language->get('entry_tab_all_display');
		$data['entry_tab_all_display_desc'] 		= $this->language->get('entry_tab_all_display_desc');
		$data['entry_tab_max_characters'] 			= $this->language->get('entry_tab_max_characters');
		$data['entry_tab_max_characters_desc'] 		= $this->language->get('entry_tab_max_characters_desc');
		$data['entry_tab_icon_display'] 			= $this->language->get('entry_tab_icon_display');
		$data['entry_tab_icon_display_desc'] 		= $this->language->get('entry_tab_icon_display_desc');
		$data['entry_cat_order_by'] 				= $this->language->get('entry_cat_order_by');
		$data['entry_cat_order_by_desc'] 			= $this->language->get('entry_cat_order_by_desc');
		$data['entry_imgcfgcat_from_params']		= $this->language->get('entry_imgcfgcat_from_params');
		$data['entry_imgcfgcat_from_params_desc']	= $this->language->get('entry_imgcfgcat_from_params_desc');
		$data['entry_imgcfgcat_from_description']	= $this->language->get('entry_imgcfgcat_from_description');
		$data['entry_imgcfgcat_from_description_desc']= $this->language->get('entry_imgcfgcat_from_description_desc');
		$data['entry_imgcfgcat_width']				= $this->language->get('entry_imgcfgcat_width');
		$data['entry_imgcfgcat_width_desc']			= $this->language->get('entry_imgcfgcat_width_desc');
		$data['entry_imgcfgcat_height']				= $this->language->get('entry_imgcfgcat_height');
		$data['entry_imgcfgcat_height_desc']		= $this->language->get('entry_imgcfgcat_height_desc');
		
		//Tabs Items options
		$data['entry_display_title'] 				= $this->language->get('entry_display_title');
		$data['entry_display_title_desc'] 			= $this->language->get('entry_display_title_desc');
		$data['entry_title_maxlength'] 				= $this->language->get('entry_title_maxlength');
		$data['entry_title_maxlength_desc'] 		= $this->language->get('entry_title_maxlength_desc');
		$data['entry_display_description'] 			= $this->language->get('entry_display_description');
		$data['entry_display_description_desc'] 	= $this->language->get('entry_display_description_desc');
		$data['entry_description_maxlength']		= $this->language->get('entry_description_maxlength');
		$data['entry_description_maxlength_desc']	= $this->language->get('entry_description_maxlength_desc');
		$data['entry_item_created_display']			= $this->language->get('entry_item_created_display');
		$data['entry_item_created_display_desc']	= $this->language->get('entry_item_created_display_desc');
		
		//Tabs Image options
		$data['entry_product_image']		= $this->language->get('entry_product_image');
		$data['entry_product_image_desc']	= $this->language->get('entry_product_image_desc');
		$data['entry_width'] 				= $this->language->get('entry_width');
		$data['entry_width_desc'] 			= $this->language->get('entry_width_desc');
		$data['entry_height'] 				= $this->language->get('entry_height');
		$data['entry_height_desc'] 			= $this->language->get('entry_height_desc');
		
		//Tabs Effect options
		$data['entry_effect'] 			= $this->language->get('entry_effect');
		$data['entry_effect_desc'] 		= $this->language->get('entry_effect_desc');
		$data['entry_duration'] 		= $this->language->get('entry_duration');
		$data['entry_duration_desc'] 	= $this->language->get('entry_duration_desc');
		$data['entry_delay'] 			= $this->language->get('entry_delay');
		$data['entry_delay_desc'] 		= $this->language->get('entry_delay_desc');
		
		//Tabs Advanced
		$data['entry_pretext'] 			= $this->language->get('entry_pretext');
		$data['entry_pretext_desc'] 	= $this->language->get('entry_pretext_desc');
		$data['entry_posttext'] 		= $this->language->get('entry_posttext');
		$data['entry_posttext_desc'] 	= $this->language->get('entry_posttext_desc');
		$data['entry_autoplay']	= $this->language->get('entry_autoplay');
		$data['entry_display_nav'] = $this->language->get('entry_display_nav');
		$data['entry_display_nav_desc'] = $this->language->get('entry_display_nav_desc');
		$data['entry_display_loop'] = $this->language->get('entry_display_loop');
		$data['entry_display_loop_desc'] = $this->language->get('entry_display_loop_desc');
		$data['entry_touchdrag'] = $this->language->get('entry_touchdrag');
		$data['entry_touchdrag_desc'] = $this->language->get('entry_touchdrag_desc');
		$data['entry_mousedrag'] = $this->language->get('entry_mousedrag');
		$data['entry_mousedrag_desc'] = $this->language->get('entry_mousedrag_desc');
		$data['entry_pausehover'] = $this->language->get('entry_pausehover');
		$data['entry_pausehover_desc'] = $this->language->get('entry_pausehover_desc');
		$data['entry_autoplay_timeout'] = $this->language->get('entry_autoplay_timeout');
		$data['entry_autoplay_timeout_desc'] = $this->language->get('entry_autoplay_timeout_desc');
		$data['entry_autoplay_speed'] = $this->language->get('entry_autoplay_speed');
		$data['entry_autoplay_speed_desc'] = $this->language->get('entry_autoplay_speed_desc');
		$data['entry_class_suffix'] = $this->language->get('entry_class_suffix');
		// Validate
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['autoplay_speed'])) {
			$data['entry_autoplay_speed_error'] = $this->error['autoplay_speed'];
		} else {
			$data['entry_autoplay_speed_error'] = '';
		}
		
		if (isset($this->error['autoplay_timeout'])) {
			$data['entry_autoplay_timeout_error'] = $this->error['autoplay_timeout'];
		} else {
			$data['entry_autoplay_timeout_error'] = '';
		}
		
		
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		foreach($data['languages'] as $language){
			$name = 'module_description['.$language['language_id']."]['name']";
			if (isset($this->error[$name])) {
				$data['error_name'] = $this->error[$name];
				break;
			} else {
				$data['error_name'] = '';
			}
		}
		
		if (isset($this->error['nb_rows'])) {
			$data['error_nb_row'] = $this->error['nb_rows'];
		} else {
			$data['error_nb_row'] = '';
		}
		
		if (isset($this->error['category'])) {
			$data['error_category'] = $this->error['category'];
		} else {
			$data['error_category'] = '';
		}
		
		if (isset($this->error['category_depth'])) {
			$data['error_category_depth'] = $this->error['category_depth'];
		} else {
			$data['error_category_depth'] = '';
		}
		
		if (isset($this->error['source_limit'])) {
			$data['error_source_limit'] = $this->error['source_limit'];
		} else {
			$data['error_source_limit'] = '';
		}
		
		if (isset($this->error['tab_max_characters'])) {
			$data['error_tab_max_characters'] = $this->error['tab_max_characters'];
		} else {
			$data['error_tab_max_characters'] = '';
		}
		
		if (isset($this->error['title_maxlength'])) {
			$data['error_title_maxlength'] = $this->error['title_maxlength'];
		} else {
			$data['error_title_maxlength'] = '';
		}
		
		if (isset($this->error['description_maxlength'])) {
			$data['error_description_maxlength'] = $this->error['description_maxlength'];
		} else {
			$data['error_description_maxlength'] = '';
		}
		
		if (isset($this->error['imgcfgcat_width'])) {
			$data['error_imgcfgcat_width'] = $this->error['imgcfgcat_width'];
		} else {
			$data['error_imgcfgcat_width'] = '';
		}
		
		if (isset($this->error['imgcfgcat_height'])) {
			$data['error_imgcfgcat_height'] = $this->error['imgcfgcat_height'];
		} else {
			$data['error_imgcfgcat_height'] = '';
		}
		
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}
		
		if (isset($this->error['error_duration'])) {
			$data['error_duration'] = $this->error['error_duration'];
		} else {
			$data['error_duration'] = '';
		}
		
		if (isset($this->error['error_delay'])) {
			$data['error_delay'] = $this->error['error_delay'];
		} else {
			$data['error_delay'] = '';
		}
		
		
		
		
		if (isset($this->error['field_product_tab'])) {
			$data['error_field_product_tab'] = $this->error['field_product_tab'];
		} else {
			$data['error_field_product_tab'] = '';
		}
		
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_listing_tabs', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_listing_tabs', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/so_listing_tabs', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/so_listing_tabs', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		
		//----------------------------------General---------------------------------------------
		if (isset($this->request->get['module_id'])) {
			$data['moduleid'] = $this->request->get['module_id'];
		} elseif (!empty($module_info) && isset($module_info['moduleid'])) {
			$data['moduleid'] = $module_info['moduleid'];
		} else {
			$data['moduleid'] = '';
		}
		
		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}
		
		if (isset($this->request->post['disp_title_module'])) {
			$data['disp_title_module'] = $this->request->post['disp_title_module'];
		} elseif (!empty($module_info) && isset($module_info['disp_title_module'])) {
			$data['disp_title_module'] = $module_info['disp_title_module'];
		} else {
			$data['disp_title_module'] = 1;
		}
		
		if (isset($this->request->post['autoplay'])) {
			$data['autoplay'] = $this->request->post['autoplay'];
		} elseif (!empty($module_info) && isset($module_info['autoplay'])) {
			$data['autoplay'] = $module_info['autoplay'];
		} else {
			$data['autoplay'] = '1';
		}
		
		if (isset($this->request->post['display_nav'])) {
			$data['display_nav'] = $this->request->post['display_nav'];
		} elseif (!empty($module_info) && isset($module_info['display_nav'])) {
			$data['display_nav'] = $module_info['display_nav'];
		} else {
			$data['display_nav'] = '1';
		}
		
		if (isset($this->request->post['display_loop'])) {
			$data['display_loop'] = $this->request->post['display_loop'];
		} elseif (!empty($module_info) && isset($module_info['display_loop'])) {
			$data['display_loop'] = $module_info['display_loop'];
		} else {
			$data['display_loop'] = '1';
		}
		
		if (isset($this->request->post['touchdrag'])) {
			$data['touchdrag'] = $this->request->post['touchdrag'];
		} elseif (!empty($module_info) && isset($module_info['touchdrag'])) {
			$data['touchdrag'] = $module_info['touchdrag'];
		} else {
			$data['touchdrag'] = '1';
		}
		
		if (isset($this->request->post['mousedrag'])) {
			$data['mousedrag'] = $this->request->post['mousedrag'];
		} elseif (!empty($module_info) && isset($module_info['mousedrag'])) {
			$data['mousedrag'] = $module_info['mousedrag'];
		} else {
			$data['mousedrag'] = '1';
		}
		
		if (isset($this->request->post['pausehover'])) {
			$data['pausehover'] = $this->request->post['pausehover'];
		} elseif (!empty($module_info) && isset($module_info['pausehover'])) {
			$data['pausehover'] = $module_info['pausehover'];
		} else {
			$data['pausehover'] = '1';
		}
		
		if (isset($this->request->post['autoplay_timeout'])) {
			$data['autoplay_timeout'] = $this->request->post['autoplay_timeout'];
		} elseif (!empty($module_info) && isset($module_info['autoplay_timeout'])) {
			$data['autoplay_timeout'] = $module_info['autoplay_timeout'];
		} else {
			$data['autoplay_timeout'] = '5000';
		}
		
		if (isset($this->request->post['autoplay_speed'])) {
			$data['autoplay_speed'] = $this->request->post['autoplay_speed'];
		} elseif (!empty($module_info) && isset($module_info['autoplay_speed'])) {
			$data['autoplay_speed'] = $module_info['autoplay_speed'];
		} else {
			$data['autoplay_speed'] = '2000';
		}
		
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info) && isset($module_info['name'])) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		// $module_desc = isset($data['module_description']) ? $data['module_description'] : '';
		// $module_desc = !empty($module_des) ? array_shift($data['module_description']) : '';
		// $data['name'] = isset($module_desc['name']) ? $module_desc['name'] : '';
		if (isset($this->request->post['class_suffix'])) {
			$data['class_suffix'] = $this->request->post['class_suffix'];
		} elseif (!empty($module_info) && isset($module_info['class_suffix'])) {
			$data['class_suffix'] = $module_info['class_suffix'];
		} else {
			$data['class_suffix'] = '';
		}
		
		if (isset($this->request->post['nb_rows'])) {
			$data['nb_rows'] = $this->request->post['nb_rows'];
		} elseif (!empty($module_info) && isset($module_info['nb_rows'])) {
			$data['nb_rows'] = $module_info['nb_rows'];
		} else {
			$data['nb_rows'] = 1;
		}
		if (isset($this->request->post['item_link_target'])) {
			$data['item_link_target'] = $this->request->post['item_link_target'];
		} elseif (!empty($module_info)) {
			$data['item_link_target'] = $module_info['item_link_target'];
		} else {
			$data['item_link_target'] = '';
		}
		$data['item_link_targets'] = array(
					'_blank' => 'New Window',
					'_self'  => 'Same Window',
				);
		
		$data['nb_columns'] = array(
			'1'   => '1',
			'2'   => '2',
			'3'   => '3',
			'4'   => '4',
			'6'   => '6',
		);
		
		if (isset($this->request->post['nb_column0'])) {
			$data['nb_column0'] = $this->request->post['nb_column0'];
		} elseif (!empty($module_info)) {
			$data['nb_column0'] = $module_info['nb_column0'];
		} else {
			$data['nb_column0'] = 4;
		}
		
		if (isset($this->request->post['nb_column1'])) {
			$data['nb_column1'] = $this->request->post['nb_column1'];
		} elseif (!empty($module_info)) {
			$data['nb_column1'] = $module_info['nb_column1'];
		} else {
			$data['nb_column1'] = 4;
		}
		
		if (isset($this->request->post['nb_column2'])) {
			$data['nb_column2'] = $this->request->post['nb_column2'];
		} elseif (!empty($module_info)) {
			$data['nb_column2'] = $module_info['nb_column2'];
		} else {
			$data['nb_column2'] = 3;
		}
		
		if (isset($this->request->post['nb_column3'])) {
			$data['nb_column3'] = $this->request->post['nb_column3'];
		} elseif (!empty($module_info)) {
			$data['nb_column3'] = $module_info['nb_column3'];
		} else {
			$data['nb_column3'] = 2;
		}
		
		if (isset($this->request->post['nb_column4'])) {
			$data['nb_column4'] = $this->request->post['nb_column4'];
		} elseif (!empty($module_info) && isset($module_info['nb_column4'])) {
			$data['nb_column4'] = $module_info['nb_column4'];
		} else {
			$data['nb_column4'] = 1;
		}
	
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '1';
		}
		
		$data['type_shows']  = array('loadmore' => $this->language->get('type_show_loadmore'), 'slider' => $this->language->get('type_show_slider'));
		if (isset($this->request->post['type_show'])) {
			$data['type_show'] = $this->request->post['type_show'];
		} elseif (!empty($module_info) && isset($module_info['type_show'])) {
			$data['type_show'] = $module_info['type_show'];
		} else {
			$data['type_show'] = 'loamore';
		}

		//-------------------------------------Source option-----------------------------------------
		//Type Source
		if (isset($this->request->post['type_source'])) {
			$data['type_source'] = $this->request->post['type_source'];
		} elseif (!empty($module_info)) {
			$data['type_source'] = $module_info['type_source'];
		} else {
			$data['type_source'] = '1';
		}
		
		//Category
		$data['categorys'] = array();
		if (isset($this->request->post['category'])) {
			$categorys = $this->request->post['category'];
		} elseif (!empty($module_info)) {
			$categorys = $module_info['category'];
		} else {
			$categorys = array();
		}
		if($categorys != null)
		{
			foreach ($categorys as $category_id) {
				$category_info = $this->model_catalog_category->getCategory($category_id);

				if ($category_info) {
					$data['categorys'][] = array(
						'category_id' => $category_info['category_id'],
						'name'       => $category_info['name']
					);
				}
			}
		}
		
		//Child category
		if (isset($this->request->post['child_category'])) {
			$data['child_category'] = $this->request->post['child_category'];
		} elseif (!empty($module_info)) {
			$data['child_category'] = $module_info['child_category'];
		} else {
			$data['child_category'] = '1';
		}
		
		//Category depth
		if (isset($this->request->post['category_depth'])) {
			$data['category_depth'] = $this->request->post['category_depth'];
		} elseif (!empty($module_info)) {
			$data['category_depth'] = $module_info['category_depth'];
		} else {
			$data['category_depth'] = '1';
		}
		
		//Product order by
		$data['product_sorts'] = array(
			'pd_name'  => 'Name',
			'p_model'  => 'Model',
			'p_price'  => 'Price',
			'p_quantity' => 'Quantity',
			'rating' => 'Rating',
			'p_sort_order' => 'Sort Order',
			'p_date_added' => 'Date Add'
		);
		if (isset($this->request->post['product_sort'])) {
			$data['product_sort'] = $this->request->post['product_sort'];
		} elseif (!empty($module_info)) {
			$data['product_sort'] = $module_info['product_sort'];
		} else {
			$data['product_sort'] = 'pb.name';
		}
		
		//Product order direction
		$data['product_orderings'] = array(
			'ASC'   => 'Ascending',
			'DESC'  => 'Descending',
		);
		
		if (isset($this->request->post['product_ordering'])) {
			$data['product_ordering'] = $this->request->post['product_ordering'];
		} elseif (!empty($module_info)) {
			$data['product_ordering'] = $module_info['product_ordering'];
		} else {
			$data['product_ordering'] = 'ASC';
		}
		
		//Count
		if (isset($this->request->post['source_limit'])) {
			$data['source_limit'] = $this->request->post['source_limit'];
		} elseif (!empty($module_info)) {
			$data['source_limit'] = $module_info['source_limit'];
		} else {
			$data['source_limit'] = '6';
		}
		
		//Category preload
		
		if (isset($this->request->post['catid_preload'])) {
			$data['catid_preload'] = $this->request->post['catid_preload'];
		} elseif (!empty($module_info)) {
			$data['catid_preload'] = $module_info['catid_preload'];
		} else {
			$data['catid_preload'] = '';
		}
		
		
		//Field product tab
		$field_product_tab = array(
			'pd_name'  => 'Name',
			'p_model'  => 'Model',
			'p_price'  => 'Price',
			'p_quantity' => 'Quantity',
			'rating' => 'Rating',
			'p_sort_order' => 'Sort Order',
			'p_date_added' => 'Date Add'
		);
		if (isset($this->request->post['field_product_tab'])) {
			$field_product_tabs = $this->request->post['field_product_tab'];
		} elseif (!empty($module_info)) {
			$field_product_tabs = $module_info['field_product_tab'];
		} else {
			$field_product_tabs = array();
		}
		$data['field_product_tabs'] = array();
		foreach($field_product_tab as $option_id => $option_value) 
		{
			if($field_product_tabs != null && in_array($option_id,$field_product_tabs))
			{
				
				$data['field_product_tabs'][] = array(
					'product_id' => $option_id,
					'name'       => $option_value
				);
			}
		}
		
		
		
		//Field preload
		if (isset($this->request->post['field_preload'])) {
			$data['field_preload'] = $this->request->post['field_preload'];
		} elseif (!empty($module_info) && $module_info['type_source'] ==1) {
			$data['field_preload'] = $module_info['field_preload'];
		} else {
			$data['field_preload'] = 'name';
		}
		
		//-------------------------------------Tabs option-----------------------------------------
		//Tab all display
		if (isset($this->request->post['tab_all_display'])) {
			$data['tab_all_display'] = $this->request->post['tab_all_display'];
		} elseif (!empty($module_info)) {
			$data['tab_all_display'] = $module_info['tab_all_display'];
		} else {
			$data['tab_all_display'] = '1';
		}
		
		//Category Title Maxlength
		if (isset($this->request->post['tab_max_characters'])) {
			$data['tab_max_characters'] = $this->request->post['tab_max_characters'];
		} elseif (!empty($module_info)) {
			$data['tab_max_characters'] = $module_info['tab_max_characters'];
		} else {
			$data['tab_max_characters'] = '25';
		}
		
		//Display Icon
		if (isset($this->request->post['tab_icon_display'])) {
			$data['tab_icon_display'] = $this->request->post['tab_icon_display'];
		} elseif (!empty($module_info)) {
			$data['tab_icon_display'] = $module_info['tab_icon_display'];
		} else {
			$data['tab_icon_display'] = '1';
		}
		
		//Category Oder By
		$data['cat_order_bys'] = array(
			'name' => 'Name',
			'lft' => 'Ordering',
			'random' => 'Random'
		);
		if (isset($this->request->post['cat_order_by'])) {
			$data['cat_order_by'] = $this->request->post['cat_order_by'];
		} elseif (!empty($module_info)) {
			$data['cat_order_by'] = $module_info['cat_order_by'];
		} else {
			$data['cat_order_by'] = 'name';
		}
		
		
		
		//Width Image
		if (isset($this->request->post['imgcfgcat_width'])) {
			$data['imgcfgcat_width'] = $this->request->post['imgcfgcat_width'];
		} elseif (!empty($module_info)) {
			$data['imgcfgcat_width'] = $module_info['imgcfgcat_width'];
		} else {
			$data['imgcfgcat_width'] = '30';
		}
		//Height Image
		if (isset($this->request->post['imgcfgcat_height'])) {
			$data['imgcfgcat_height'] = $this->request->post['imgcfgcat_height'];
		} elseif (!empty($module_info)) {
			$data['imgcfgcat_height'] = $module_info['imgcfgcat_height'];
		} else {
			$data['imgcfgcat_height'] = '30';
		}
		//-------------------------------------Items option-----------------------------------------
		//Display title
		if (isset($this->request->post['display_title'])) {
			$data['display_title'] = $this->request->post['display_title'];
		} elseif (!empty($module_info)) {
			$data['display_title'] = $module_info['display_title'];
		} else {
			$data['display_title'] = '1';
		}
		
		//Title Maxlength
		if (isset($this->request->post['title_maxlength'])) {
			$data['title_maxlength'] = $this->request->post['title_maxlength'];
		} elseif (!empty($module_info)) {
			$data['title_maxlength'] = $module_info['title_maxlength'];
		} else {
			$data['title_maxlength'] = '50';
		}
		
		//Display Description
		if (isset($this->request->post['display_description'])) {
			$data['display_description'] = $this->request->post['display_description'];
		} elseif (!empty($module_info)) {
			$data['display_description'] = $module_info['display_description'];
		} else {
			$data['display_description'] = '1';
		}
		
		//Description Maxlength
		if (isset($this->request->post['description_maxlength'])) {
			$data['description_maxlength'] = $this->request->post['description_maxlength'];
		} elseif (!empty($module_info)) {
			$data['description_maxlength'] = $module_info['description_maxlength'];
		} else {
			$data['description_maxlength'] = '100';
		}
		
		//-------------------------------------Image option-----------------------------------------
		//Product image
		if (isset($this->request->post['product_image'])) {
			$data['product_image'] = $this->request->post['product_image'];
		} elseif (!empty($module_info)) {
			$data['product_image'] = $module_info['product_image'];
		} else {
			$data['product_image'] = '1';
		}
		
		//Width
		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '200';
		}
		
		//Height
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '200';
		}
		//-------------------------------------Effect option-----------------------------------------
		//Effect 
		$data['effects'] = array(
			'none' => 'None',
			'slideLeft'  => 'Slide Left',
			'slideRight' => 'Slide Right',
			'zoomOut' => 'Zoom Out',
			'zoomIn' =>'Zoom In',
			'flip'=>'Flip',
			'flipInX' => 'Flip in Horizontal',
			'flipInY' => 'Flip in Vertical',
			'starwars'=> 'Star war',
			'bounceIn' => 'Bounce In',
			'fadeIn' => 'Fade In',
			'pageTop'=> 'Page Top',
		);
		if (isset($this->request->post['effects'])) {
			$data['effect'] = $this->request->post['effect'];
		} elseif (!empty($module_info)) {
			$data['effect'] = $module_info['effect'];
		} else {
			$data['effect'] = 'starwars';
		}
		
		// Duration
		if (isset($this->request->post['duration'])) {
			$data['duration'] = $this->request->post['duration'];
		} elseif (!empty($module_info)) {
			$data['duration'] = $module_info['duration'];
		} else {
			$data['duration'] = '600';
		}
		
		// Delay
		if (isset($this->request->post['delay'])) {
			$data['delay'] = $this->request->post['delay'];
		} elseif (!empty($module_info)) {
			$data['delay'] = $module_info['delay'];
		} else {
			$data['delay'] = '300';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('module/so_listing_tabs.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/so_listing_tabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		
		foreach($languages as $language){
			$module_description = $this->request->post['module_description'];
			if ((utf8_strlen($module_description[$language['language_id']]['name']) < 3) || (utf8_strlen($module_description[$language['language_id']]['name']) > 64)) {
				$this->error['module_description['.$language['language_id']."]['name']"] = $this->language->get('error_name');
			}
		}
		
		if ($this->request->post['category'] == null) {
			$this->error['category'] = $this->language->get('error_category');
		}
		
		if (!filter_var($this->request->post['category_depth'],FILTER_VALIDATE_INT) || $this->request->post['category_depth'] < 0) {
			$this->error['category_depth'] = $this->language->get('error_category_depth');
		}
		if ($this->request->post['source_limit'] != '0' && !filter_var($this->request->post['source_limit'],FILTER_VALIDATE_INT) || $this->request->post['source_limit'] < 0) {
			$this->error['source_limit'] = $this->language->get('error_source_limit');
		}
		
		if ($this->request->post['tab_max_characters'] != '0' && !filter_var($this->request->post['tab_max_characters'],FILTER_VALIDATE_INT) || $this->request->post['tab_max_characters'] < 0) {
			
			$this->error['tab_max_characters'] = $this->language->get('error_tab_max_characters');
		}
		
		if ($this->request->post['description_maxlength'] != '0' && !filter_var($this->request->post['description_maxlength'],FILTER_VALIDATE_INT) || $this->request->post['description_maxlength'] < 0) {
			$this->error['description_maxlength'] = $this->language->get('error_description_maxlength');
		}
		
		if ($this->request->post['field_product_tab'] == null && $this->request->post['type_source'] ==1) {
			$this->error['field_product_tab'] = $this->language->get('error_field_product_tab');
		}
		
		if ($this->request->post['imgcfgcat_width'] != '0' && !filter_var($this->request->post['imgcfgcat_width'],FILTER_VALIDATE_INT) || $this->request->post['imgcfgcat_width'] < 0) {
			$this->error['imgcfgcat_width'] = $this->language->get('error_imgcfgcat_width');
		}
		
		if ($this->request->post['imgcfgcat_height'] != '0' && !filter_var($this->request->post['imgcfgcat_height'],FILTER_VALIDATE_INT) || $this->request->post['imgcfgcat_height'] < 0) {
			$this->error['imgcfgcat_height'] = $this->language->get('error_imgcfgcat_height');
		}
		
		if ($this->request->post['title_maxlength'] != '0' && !filter_var($this->request->post['title_maxlength'],FILTER_VALIDATE_INT) || $this->request->post['title_maxlength'] < 0) {
			$this->error['title_maxlength'] = $this->language->get('error_title_maxlength');
		}
		
		if ($this->request->post['width'] != '0' && !filter_var($this->request->post['width'],FILTER_VALIDATE_INT) || $this->request->post['width'] < 0) {
			$this->error['width'] = $this->language->get('error_width');
		}
		
		if ($this->request->post['height'] != '0' && !filter_var($this->request->post['height'],FILTER_VALIDATE_INT) || $this->request->post['height'] < 0) {
			$this->error['height'] = $this->language->get('error_height');
		}
		
		if ($this->request->post['duration'] != '0' && !filter_var($this->request->post['duration'],FILTER_VALIDATE_INT) || $this->request->post['duration'] < 0) {
			$this->error['duration'] = $this->language->get('error_duration');
		}
		
		if ($this->request->post['delay'] != '0' && !filter_var($this->request->post['delay'],FILTER_VALIDATE_INT) || $this->request->post['delay'] < 0) {
			$this->error['delay'] = $this->language->get('error_delay');
		}
		
		if ($this->request->post['nb_rows'] != '0' && !filter_var($this->request->post['nb_rows'],FILTER_VALIDATE_INT) || $this->request->post['nb_rows'] < 0) {
			$this->error['nb_rows'] = $this->language->get('error_nb_row');
			
		}
		
		if ($this->request->post['autoplay_timeout'] != '0' && !filter_var($this->request->post['autoplay_timeout'],FILTER_VALIDATE_INT) || $this->request->post['autoplay_timeout'] < 0) {
			$this->error['autoplay_timeout'] = $this->language->get('entry_autoplay_timeout_error');
		}
		
		if ($this->request->post['autoplay_speed'] != '0' && !filter_var($this->request->post['autoplay_speed'],FILTER_VALIDATE_INT) || $this->request->post['autoplay_speed'] < 0) {
			$this->error['autoplay_speed'] = $this->language->get('entry_autoplay_speed_desc');
		}
		
		return !$this->error;
	}
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$field_product_tabs = array(
				'pd_name'  => 'Name',
				'p_model'  => 'Model',
				'p_price'  => 'Price',
				'p_quantity' => 'Quantity',
				'rating' => 'Rating',
				'p_sort_order' => 'Sort Order',
				'p_date_added' => 'Date Add'
			);

			

			foreach ($field_product_tabs as $option_id => $option_value) {
				$json[] = array(
					'product_id' => $option_id,
					'name'        => strip_tags(html_entity_decode($option_value, ENT_QUOTES, 'UTF-8'))
				);
			}
		}
		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}