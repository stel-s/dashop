<?php
class ControllerModuleSocategories extends Controller {
	private $error = array();
	public function index() {
		$this->load->language('module/so_categories');
		$this->load->model('catalog/category');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				
				$this->model_extension_module->addModule('so_categories', $this->request->post);
				
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

		$data['entry_name'] 	= $this->language->get('entry_name');
		$data['entry_name_desc'] = $this->language->get('entry_name_desc');
		$data['entry_head_name'] 				= $this->language->get('entry_head_name');
		$data['entry_head_name_desc'] 			= $this->language->get('entry_head_name_desc');
		$data['entry_display_title_module']     = $this->language->get('entry_display_title_module');

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
		
		//Title tabs
		$data['entry_module'] 			= $this->language->get('entry_module');
		$data['entry_source_option'] 	= $this->language->get('entry_source_option');
		$data['entry_tabs_option'] 		= $this->language->get('entry_tabs_option');
		$data['entry_category_option'] 	= $this->language->get('entry_category_option');
		$data['entry_image_option'] 	= $this->language->get('entry_image_option');
		$data['entry_effect_option'] 	= $this->language->get('entry_effect_option');
		$data['entry_advanced'] 	    = $this->language->get('entry_advanced');
		
		//Tabs General
		$data['entry_deviceclass_sfx'] 			= $this->language->get('entry_deviceclass_sfx');
		$data['entry_deviceclass_sfx_desc'] 	= $this->language->get('entry_deviceclass_sfx_desc');
		$data['entry_theme'] 					= $this->language->get('entry_theme');
		$data['entry_theme_desc'] 				= $this->language->get('entry_theme_desc');
		$data['entry_open_link'] 				= $this->language->get('entry_open_link');
		$data['entry_open_link_desc'] 			= $this->language->get('entry_open_link_desc');
		$data['entry_accmouseenter'] 			= $this->language->get('entry_accmouseenter');
		$data['entry_accmouseenter_desc'] 		= $this->language->get('entry_accmouseenter_desc');
		
		//Tabs Source options
		$data['entry_category'] 				= $this->language->get('entry_category');
		$data['entry_category_desc'] 			= $this->language->get('entry_category_desc');
		$data['entry_child_category'] 			= $this->language->get('entry_child_category');
		$data['entry_child_category_desc'] 		= $this->language->get('entry_child_category_desc');
		$data['entry_category_depth'] 			= $this->language->get('entry_category_depth');
		$data['entry_category_depth_desc'] 		= $this->language->get('entry_category_depth_desc');
		$data['entry_source_limit'] 			= $this->language->get('entry_source_limit');
		$data['entry_source_limit_desc'] 		= $this->language->get('entry_source_limit_desc');
		
		//Tabs Items options
		
		$data['entry_category_option__'] 				= $this->language->get('entry_category_option__');
		$data['entry_sub_category_option__'] 				= $this->language->get('entry_sub_category_option__');
		$data['entry_cat_title_display'] 				= $this->language->get('entry_cat_title_display');
		$data['entry_cat_title_display_desc'] 			= $this->language->get('entry_cat_title_display_desc');
		$data['entry_cat_title_maxcharacs'] 			= $this->language->get('entry_cat_title_maxcharacs');
		$data['entry_cat_title_maxcharacs_desc'] 		= $this->language->get('entry_cat_title_maxcharacs_desc');
		$data['entry_cat_sub_title_display']			= $this->language->get('entry_cat_sub_title_display');
		$data['entry_cat_sub_title_display_desc']		= $this->language->get('entry_cat_sub_title_display_desc');
		$data['entry_cat_sub_title_maxcharacs']			= $this->language->get('entry_cat_sub_title_maxcharacs');
		$data['entry_cat_sub_title_maxcharacs_desc']	= $this->language->get('entry_cat_sub_title_maxcharacs_desc');
		$data['entry_cat_all_product']					= $this->language->get('entry_cat_all_product');
		$data['entry_cat_all_product_desc']				= $this->language->get('entry_cat_all_product_desc');
		
		//Tabs Image options
		$data['entry_product_image']			= $this->language->get('entry_product_image');
		$data['entry_product_image_desc']		= $this->language->get('entry_product_image_desc');
		$data['entry_width'] 					= $this->language->get('entry_width');
		$data['entry_width_desc'] 				= $this->language->get('entry_width_desc');
		$data['entry_height'] 					= $this->language->get('entry_height');
		$data['entry_height_desc'] 				= $this->language->get('entry_height_desc');
		$data['entry_background'] 				= $this->language->get('entry_background');
		$data['entry_background_desc'] 			= $this->language->get('entry_background_desc');
		$data['entry_placeholder_path'] 		= $this->language->get('entry_placeholder_path');
		$data['entry_placeholder_path_desc'] 	= $this->language->get('entry_placeholder_path_desc');
		
		//Tabs Advanced
		$data['entry_pretext'] 			= $this->language->get('entry_pretext');
		$data['entry_pretext_desc'] 	= $this->language->get('entry_pretext_desc');
		$data['entry_posttext'] 		= $this->language->get('entry_posttext');
		$data['entry_posttext_desc'] 	= $this->language->get('entry_posttext_desc');
		// Validate
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		foreach($data['languages'] as $language){
			$name = 'module_description['.$language['language_id']."]['head_name']";
			if (isset($this->error[$name])) {
				$data['error_head_name'] = $this->error[$name];
				break;
			} else {
				$data['error_head_name'] = '';
			}
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
		
		if (isset($this->error['cat_title_maxcharacs'])) {
			$data['error_cat_title_maxcharacs'] = $this->error['cat_title_maxcharacs'];
		} else {
			$data['error_cat_title_maxcharacs'] = '';
		}
		
		if (isset($this->error['cat_sub_title_maxcharacs'])) {
			$data['error_cat_sub_title_maxcharacs'] = $this->error['cat_sub_title_maxcharacs'];
		} else {
			$data['error_cat_sub_title_maxcharacs'] = '';
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
		
		if (isset($this->error['background'])) {
			$data['error_background'] = $this->error['background'];
		} else {
			$data['error_background'] = '';
		}
		
		if (isset($this->error['placeholder_path'])) {
			$data['error_placeholder_path'] = $this->error['placeholder_path'];
		} else {
			$data['error_placeholder_path'] = '';
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
				'href' => $this->url->link('module/so_categories', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_categories', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/so_categories', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/so_categories', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		if (isset($this->request->post['head_name'])) {
			$data['head_name'] = $this->request->post['head_name'];
		} elseif (!empty($module_info) && isset($module_info['head_name'])) {
			$data['head_name'] = $module_info['head_name'];
		} else {
			$data['head_name'] = '';
		}
		if (isset($this->request->post['disp_title_module'])) {
			$data['disp_title_module'] = $this->request->post['disp_title_module'];
		} elseif (!empty($module_info) && isset($module_info['disp_title_module'])) {
			$data['disp_title_module'] = $module_info['disp_title_module'];
		} else {
			$data['disp_title_module'] = 1;
		}

		//----------------------------------General---------------------------------------------
		if (isset($this->request->post['deviceclass_sfx'])) {
			$data['deviceclass_sfx'] = $this->request->post['deviceclass_sfx'];
		} elseif (!empty($module_info)) {
			$data['deviceclass_sfx'] = $module_info['deviceclass_sfx'];
		} else {
			$data['deviceclass_sfx'] = 'preset01-4 preset02-3 preset03-2 preset04-2 preset05-1';
		}
		
		$data['themes'] = array(
					'theme1' 	=> 'Theme 1',
					'theme2'  	=> 'Theme 2',
					'theme3' 	=> 'Theme 3',
					'theme4'  	=> 'Theme 4',
				);
		if (isset($this->request->post['theme'])) {
			$data['theme'] = $this->request->post['theme'];
		} elseif (!empty($module_info)) {
			$data['theme'] = $module_info['theme'];
		} else {
			$data['theme'] = 'theme1';
		}
		
		$data['item_link_targets'] = array(
					'_blank' => 'New Window',
					'_self'  => 'Same Window',
				);
		if (isset($this->request->post['item_link_target'])) {
			$data['item_link_target'] = $this->request->post['item_link_target'];
		} elseif (!empty($module_info)) {
			$data['item_link_target'] = $module_info['item_link_target'];
		} else {
			$data['item_link_target'] = '';
		}
		
		$data['accmouseenters'] = array(
					'click' 		=> 'Click',
					'mouseenter'  	=> 'Hover',
				);
		if (isset($this->request->post['accmouseenter'])) {
			$data['accmouseenter'] = $this->request->post['accmouseenter'];
		} elseif (!empty($module_info)) {
			$data['accmouseenter'] = $module_info['accmouseenter'];
		} else {
			$data['accmouseenter'] = 'click';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '1';
		}

		//-------------------------------------Source option-----------------------------------------
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
		
		//Count
		if (isset($this->request->post['source_limit'])) {
			$data['source_limit'] = $this->request->post['source_limit'];
		} elseif (!empty($module_info)) {
			$data['source_limit'] = $module_info['source_limit'];
		} else {
			$data['source_limit'] = '6';
		}
		//-------------------------------------Category option-----------------------------------------
		//Display title
		if (isset($this->request->post['cat_title_display'])) {
			$data['cat_title_display'] = $this->request->post['cat_title_display'];
		} elseif (!empty($module_info)) {
			$data['cat_title_display'] = $module_info['cat_title_display'];
		} else {
			$data['cat_title_display'] = '1';
		}
		
		//Title Maxlength
		if (isset($this->request->post['cat_title_maxcharacs'])) {
			$data['cat_title_maxcharacs'] = $this->request->post['cat_title_maxcharacs'];
		} elseif (!empty($module_info)) {
			$data['cat_title_maxcharacs'] = $module_info['cat_title_maxcharacs'];
		} else {
			$data['cat_title_maxcharacs'] = '25';
		}
		
		//Display sub title category
		if (isset($this->request->post['cat_sub_title_display'])) {
			$data['cat_sub_title_display'] = $this->request->post['cat_sub_title_display'];
		} elseif (!empty($module_info)) {
			$data['cat_sub_title_display'] = $module_info['cat_sub_title_display'];
		} else {
			$data['cat_sub_title_display'] = '1';
		}
		
		//Sub title category Maxlength
		if (isset($this->request->post['cat_sub_title_maxcharacs'])) {
			$data['cat_sub_title_maxcharacs'] = $this->request->post['cat_sub_title_maxcharacs'];
		} elseif (!empty($module_info)) {
			$data['cat_sub_title_maxcharacs'] = $module_info['cat_sub_title_maxcharacs'];
		} else {
			$data['cat_sub_title_maxcharacs'] = '25';
		}
		
		//Display all product
		if (isset($this->request->post['cat_all_product'])) {
			$data['cat_all_product'] = $this->request->post['cat_all_product'];
		} elseif (!empty($module_info)) {
			$data['cat_all_product'] = $module_info['cat_all_product'];
		} else {
			$data['cat_all_product'] = '1';
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
		
		//Background
		if (isset($this->request->post['background'])) {
			$data['background'] = $this->request->post['background'];
		} elseif (!empty($module_info)) {
			$data['background'] = $module_info['background'];
		} else {
			$data['background'] = '#fff';
		}
		//Background
		if (isset($this->request->post['placeholder_path'])) {
			$data['placeholder_path'] = $this->request->post['placeholder_path'];
		} elseif (!empty($module_info)) {
			$data['placeholder_path'] = $module_info['placeholder_path'];
		} else {
			$data['placeholder_path'] = 'catalog/view/javascript/jquery/so_categories/images/nophoto.jpg';
		}
		//-------------------------------------Advanced-----------------------------------------
		//Pretext 
		if (isset($this->request->post['pretext'])) {
			$data['pretext'] = $this->request->post['pretext'];
		} elseif (!empty($module_info)) {
			$data['pretext'] = $module_info['pretext'];
		} else {
			$data['pretext'] = '';
		}
		
		//Posttext 
		if (isset($this->request->post['posttext'])) {
			$data['posttext'] = $this->request->post['posttext'];
		} elseif (!empty($module_info)) {
			$data['posttext'] = $module_info['posttext'];
		} else {
			$data['posttext'] = '';
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/so_categories.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/so_categories')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();

		foreach($languages as $language){
			$module_description = $this->request->post['module_description'];
			if ((utf8_strlen($module_description[$language['language_id']]['head_name']) < 3) || (utf8_strlen($module_description[$language['language_id']]['head_name']) > 64)) {
				$this->error['module_description['.$language['language_id']."]['head_name']"] = $this->language->get('error_head_name');
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
		
		if ($this->request->post['cat_title_maxcharacs'] != '0' && !filter_var($this->request->post['cat_title_maxcharacs'],FILTER_VALIDATE_INT) || $this->request->post['cat_title_maxcharacs'] < 0) {
			
			$this->error['cat_title_maxcharacs'] = $this->language->get('error_cat_title_maxcharacs');
		}
		
		if ($this->request->post['cat_sub_title_maxcharacs'] != '0' && !filter_var($this->request->post['cat_sub_title_maxcharacs'],FILTER_VALIDATE_INT) || $this->request->post['cat_sub_title_maxcharacs'] < 0) {
			$this->error['cat_sub_title_maxcharacs'] = $this->language->get('error_cat_sub_title_maxcharacs');
		}
		
		if ($this->request->post['width'] != '0' && !filter_var($this->request->post['width'],FILTER_VALIDATE_INT) || $this->request->post['width'] < 0) {
			$this->error['width'] = $this->language->get('error_width');
		}
		
		if ($this->request->post['height'] != '0' && !filter_var($this->request->post['height'],FILTER_VALIDATE_INT) || $this->request->post['height'] < 0) {
			$this->error['height'] = $this->language->get('error_height');
		}
		
		if ($this->request->post['background'] == null ) {
			$this->error['background'] = $this->language->get('error_background');
		}
		
		if ($this->request->post['placeholder_path'] == null ) {
			$this->error['placeholder_path'] = $this->language->get('error_placeholder_path');
		}
		return !$this->error;
	}
}