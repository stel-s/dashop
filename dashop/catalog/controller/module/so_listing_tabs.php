<?php
class ControllerModuleSolistingtabs extends Controller {
	public function index($setting) {
		$module = 'so_listing_tabs';
		$this->load->language('module/so_listing_tabs');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_tax'] = $this->language->get('text_tax');
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('module/so_listing_tabs');
		$this->document->addStyle('catalog/view/javascript/so_listing_tabs/css/so-listing-tabs.css');
		$this->document->addStyle('catalog/view/javascript/so_listing_tabs/css/animate.css');
		if(!defined('SO_OWL_CAROUSEL')){
		$this->document->addStyle('catalog/view/javascript/so_listing_tabs/css/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/so_listing_tabs/js/owl.carousel.js');
		define('SO_OWL_CAROUSEL', 1);
		}
		
		if (!isset($setting['limit'])) {
			$setting['limit'] = 3;
		}
		if (!isset($setting['start'])) {
			$setting['start'] = 0;
		}
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$setting['width'] = ((int)$setting['width'] == 0 ? "150" : (int)$setting['width']);
		$setting['height'] = ((int)$setting['height'] == 0 ? "150" : (int)$setting['height']);
		$setting['imgcfgcat_width'] = ((int)$setting['imgcfgcat_width'] == 0 ? "30" : (int)$setting['imgcfgcat_width']);
		$setting['imgcfgcat_height'] = ((int)$setting['imgcfgcat_height'] == 0 ? "30" : (int)$setting['imgcfgcat_height']);
		//General 
		$data['item_link_target'] 	= $setting['item_link_target'];
		$data['start'] 				= $setting['start'];
		// Source Option
		$data['type_source'] 			= $setting['type_source'];
		$_catids__ = (array)self::processCategory($setting['category']);
		$category_id_list = self::getCategoryson($_catids__,$setting);
		
		$data['setting'] = serialize($setting);
		
		$data['category_id_list'] 		= implode(',',$category_id_list);
		
		//Tabs Option
		$data['tab_all_display'] 	= $setting['tab_all_display'];
		$data['tab_max_characters'] = $setting['tab_max_characters'];
		$data['tab_icon_display'] 	= $setting['tab_icon_display'];
		$data['imgcfgcat_width'] 	= (int)$setting['imgcfgcat_width'];
		$data['imgcfgcat_height'] 	= (int)$setting['imgcfgcat_height'];
		$data['source_limit'] 		= (int)$setting['source_limit'];
		$data['child_category'] 		= (int)$setting['child_category'];
		$data['category_depth'] 		= (int)$setting['category_depth'];
		
		//Items Option
		$data['display_title'] 			= $setting['display_title'];
		$data['title_maxlength'] 		= $setting['title_maxlength'];
		$data['display_description'] 	= $setting['display_description'];
		$data['description_maxlength'] 	= $setting['description_maxlength'];
		
		//Image Option
		$data['product_image'] 		= $setting['product_image'];
		$data['effect'] 			= $setting['effect'];
		$data['duration'] 			= $setting['duration'];
		$data['delay'] 				= $setting['delay'];
		
		//Advanced
		$data['type_show']			= $setting['type_show'];
		//Default	
		
		
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['name'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['name'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['name']  = $setting['name'];
		}
		
		$data['class_suffix'] = $setting['class_suffix'];
		$data['moduleid']  = $setting['moduleid'];
		$data['tag_id'] 		= 'so_listing_tabs_'.$data['moduleid'];
		$data['nb_column0'] = $setting['nb_column0'];
		$data['nb_column1'] = $setting['nb_column1'];
		$data['nb_column2'] = $setting['nb_column2'];
		$data['nb_column3'] = $setting['nb_column3'];
		$data['nb_column4'] = $setting['nb_column4'];
		$data['nb_rows'] = (int)$setting['nb_rows'];
		$data['autoplay'] = (int)$setting['autoplay'] > 0 ? 'true' : 'false' ;
		$data['display_nav'] = (int)$setting['display_nav'] > 0 ? 'true' : 'false' ;
		$data['display_loop'] = (int)$setting['display_loop'] > 0 ? 'true' : 'false' ;
		$data['touchdrag'] = (int)$setting['touchdrag'] > 0 ? 'true' : 'false' ;
		$data['mousedrag'] = (int)$setting['mousedrag'] > 0 ? 'true' : 'false' ;
		$data['pausehover'] = (int)$setting['pausehover'] > 0 ? 'true' : 'false' ;
		$data['autoplay_timeout'] = (int)$setting['autoplay_timeout'] ;
		$data['autoplay_speed'] = (int)$setting['autoplay_speed'] ;
		$data['disp_title_module'] = (int)$setting['disp_title_module'] ;
		$data['class_ltabs'] 	= 'ltabs00-' . $setting['nb_column0'] . ' ltabs01-' . $setting['nb_column0'] . ' ltabs02-' . $setting['nb_column1'] . ' ltabs03-' . $setting['nb_column2'] .' ltabs04-' . $setting['nb_column4'] ;
		$data['direction'] =  $this->language->get('direction') == 'rtl' ?  'true' : 'false';
		$is_ajax = isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
		if($is_ajax && $_POST['is_ajax_listing_tabs']){
			
			$setting 					= unserialize($_POST['setting']);
			$setting['start'] 			= $_POST['ajax_reslisting_start'];
			$start						= $setting['start'];
			$product_image 				= $setting['product_image'];
			$display_title				= $setting['display_title'];
			$display_description		= $setting['display_description'];
			$item_link_target 	= $setting['item_link_target'];
			$button_cart = $this->language->get('button_cart');
			$button_wishlist = $this->language->get('button_wishlist');
			$button_compare = $this->language->get('button_compare');
			$text_tax = $this->language->get('text_tax');
			$tag_id		= 'so_listing_tabs_'.$_POST['lbmoduleid'];
			$type_show			= $setting['type_show'];
			$nb_column0 = $setting['nb_column0'];
			$nb_column1 = $setting['nb_column1'];
			$nb_column2 = $setting['nb_column2'];
			$nb_column3 = $setting['nb_column3'];
			$nb_column4 =  $setting['nb_column4'];
			$effect			= $setting['effect'];
			$nb_rows = (int)$setting['nb_rows'];
			$autoplay = (int)$setting['nb_rows'] > 0 ? 'true' : 'false' ;
			$display_nav = (int)$setting['display_nav'] > 0 ? 'true' : 'false' ;
			$display_loop = (int)$setting['display_loop'] > 0 ? 'true' : 'false' ;
			$touchdrag = (int)$setting['touchdrag'] > 0 ? 'true' : 'false' ;
			$mousedrag = (int)$setting['mousedrag'] > 0 ? 'true' : 'false' ;
			$pausehover = (int)$setting['pausehover'] > 0 ? 'true' : 'false' ;
			$autoplay_timeout = (int)$setting['autoplay_timeout'] ;
			$autoplay_speed = (int)$setting['autoplay_speed'] ;
			$class_ltabs 	= 'ltabs00-' . $setting['nb_column0'] . ' ltabs01-' . $setting['nb_column0'] . ' ltabs02-' . $setting['nb_column1'] . ' ltabs03-' . $setting['nb_column2'] .' ltabs04-' . $setting['nb_column4'] ;
			$direction =  $this->language->get('direction') == 'rtl' ?  'true' : 'false';
			if($setting['type_source'] == "0")
			{
				$categoryid 	= $_POST['categoryid']; 
				$category_id 	= self::getCategoryson($categoryid ,$setting);
				$child_items 	= self::getProducts( $category_id,$setting);
			}else
			{
				
				$catids 					= $setting['category'];
				$_catids 					= (array)self::processCategory($catids);
				$category_id_list 			= self::getCategoryson($_catids,$setting);
				$setting['product_sort'] 	= $_POST['categoryid'];
				$child_items 				= self::getProducts($category_id_list,$setting);
			}
			$rl_loaded = $start;
			$tab_id = $_POST['categoryid'];
			$tab_id = $tab_id == '*' ? 'all' : $tab_id;
			$result = new stdClass();
			ob_start();
			include("catalog/view/theme/".$this->config->get('config_template')."/template/module/so_listing_tabs/default_items.tpl");
			$buffer = ob_get_contents();
			$result->items_markup = preg_replace(
					array(
							'/ {2,}/',
							'/<!--.*?-->|\t|(?:\r?\n[ \t]*)+/s'
					),
					array(
							' ',
							''
					),
					$buffer
			);
			ob_end_clean();
			die (json_encode($result));
		}else
		{
			if($setting['type_source'] == '0')
				{
					$data['list'] = self::getListCategoriesFilter($setting);
				}
				else
				{
					$data['list'] = self::getListArticlesFilter($setting);
				}
		}
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/so_listing_tabs/default.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/so_listing_tabs/default.tpl', $data);
		} else {
			return $this->load->view('default/template/module/so_listing_tabs/default.tpl', $data);
		}
	}
	public function getListCategoriesFilter($setting)
	{
		$catids = $setting['category'];
		settype($catids, 'array');
		$cat_order_by = $setting['cat_order_by'];
		
		$list = array();
		$cats = array();
		if (empty($catids)) return;
		$_catids = (array)self::processCategory($catids);
		if (empty($_catids)) return;
		foreach ($_catids as $cid) {
			$category = $this->model_catalog_category->getCategory($cid);
			$cats[] = $category;
			// switch ($cat_order_by) {
				// default:
				// case 'name':
					// usort($cats, create_function('$a, $b', 'return strnatcasecmp( $a["name"], $b["name"]);'));
					// break;
				// case 'lft':
					// usort($cats, create_function('$a, $b', 'return $a->lft < $b->lft;'));
					// break;
				// case 'random':
					// shuffle($cats);
					// break;
			// }
		}

		if ($setting['tab_all_display'] ==1) {
			$all['category_id'] = '*';
			$all['name'] = 'All Product';
			$all['image'] = '';
			array_unshift($cats, $all);
		}
		$catidpreload = $setting['catid_preload'];
		$selected = false;
		
		// foreach ($cats as $cat) {
			// if(isset($cat['sel']))
			// {
				// unset($cat['sel']);
			// }
			// $category_id_list = self::getCategoryson($cat['category_id'],$setting);
			
			// $filter_data = array(
				// 'filter_category_id'  	=> implode(',',$category_id_list),
				// 'sort'         			=> $setting['product_sort'],
				// 'order'        			=> $setting['product_ordering'],
				// 'limit'        			=> $setting['source_limit'],
				// 'start' 	   			=> $setting['start']
			// );
			// $cat['count'] = $this->model_module_so_listing_tabs->getTotalProducts_listing_tabs($filter_data);
			// if($cat['count'] > 0){
				// if ($catidpreload != "*" && in_array($catidpreload,$category_id_list) && $catidpreload == $cat['category_id']) {
					// $cat['sel'] = 'sel';
					// $selected = true;
					// $cat['child'] = self::getProducts($category_id_list,$setting);
				// }else if($catidpreload == "*" && $catidpreload == $cat['category_id'])
				// {
					// $category_id_list_ = self::getCategoryson($catidpreload,$setting);
					// $cat['sel'] = 'sel';
					// $selected = true;
					// $cat['child'] = self::getProducts($category_id_list_,$setting);
				// }else if (	$selected ==  false){
					// $catidpreload = $cats[0]['category_id'];
					// $cat['sel'] = 'sel';
					// $selected = true;
					// $cat['child'] = self::getProducts($catidpreload,$setting);
				// }
				
				// if($cat['image'] != null)
				// {
					// $cat['icon_image'] =$this->model_tool_image->resize($cat['image'], $setting['imgcfgcat_width'], $setting['imgcfgcat_height']);
				// }else{
					// $cat['icon_image'] =$this->model_tool_image->resize('placeholder.png', $setting['imgcfgcat_width'], $setting['imgcfgcat_height']);
				// }
				// $list[$cat['category_id']] = $cat;
			// }
		// }
		
		
		$_cats = array();
		foreach ($cats as $cat) {
			
			$category_id_list = self::getCategoryson($cat['category_id'],$setting);
			$filter_data = array(
				'filter_category_id'  	=> implode(',',$category_id_list),
				'sort'         			=> $setting['product_sort'],
				'order'        			=> $setting['product_ordering'],
				'limit'        			=> $setting['source_limit'],
				'start' 	   			=> $setting['start']
			);
			$cat['category_id_list'] = $category_id_list;
			$cat['count'] = $this->model_module_so_listing_tabs->getTotalProducts_listing_tabs($filter_data);
			if($cat['count'] > 0){
				$_cats[] = $cat;
			}
			
		}
		//var_dump($_cats); die;
		if (empty($_cats))
			return;
		foreach($_cats as $cat) {	
			if(isset($cat['sel'])){
				unset($cat['sel']);
			}
			if ($cat['count'] > 0) {
				if ($cat['category_id'] == $catidpreload) {
					$cat['sel'] = 'sel';
					$cat['child'] = self::getProducts($cat['category_id_list'], $setting);
					$selected = true;
				}
				if($cat['image'] != null)
				{
					$cat['icon_image'] =$this->model_tool_image->resize($cat['image'], $setting['imgcfgcat_width'], $setting['imgcfgcat_height']);
				}else{
					$cat['icon_image'] =$this->model_tool_image->resize('placeholder.png', $setting['imgcfgcat_width'], $setting['imgcfgcat_height']);
				}
				$list[$cat['category_id']] = $cat;
			}
		}
		
		if (!$selected) {
			foreach ($_cats as $cat) {
				if ($cat['count'] > 0) {
					$cat['sel'] = 'sel';
					$cat['child'] = self::getProducts($cat['category_id_list'], $setting);
					if($cat['image'] != null)
					{
						$cat['icon_image'] =$this->model_tool_image->resize($cat['image'], $setting['imgcfgcat_width'], $setting['imgcfgcat_height']);
					}else{
						$cat['icon_image'] =$this->model_tool_image->resize('placeholder.png', $setting['imgcfgcat_width'], $setting['imgcfgcat_height']);
					}
					$list[$cat['category_id']] = $cat;
					break;
				}
			}
		}
		
		return $list;
	}
	public function getListArticlesFilter($setting)
	{
		$catids = $setting['category'];
		$list = array();
		$cats = array();
		$_catids = (array)self::processCategory($catids);
		$filters = $setting['field_product_tab'];
		$articles_filter = array();
		$filter_preload = $setting['field_preload'];
		if(empty($filters)) return;
		if(!in_array($filter_preload,$filters)) {
			foreach ($filters as $filter) {
				$filter_preload = $filter;
				break;
			}
		}
		$category_id_list = self::getCategoryson($_catids,$setting);
		
		foreach ($filters as $filter) {
			$filter_data = array(
				'filter_category_id'  	=> implode(',',$category_id_list),
				'sort'         			=> $setting['product_sort'],
				'order'        			=> $setting['product_ordering'],
				'limit'        			=> $setting['source_limit'],
				'start' 	   			=> $setting['start']
			);
			$aritles['count'] = $this->model_module_so_listing_tabs->getTotalProducts_listing_tabs($filter_data);
			$aritles['category_id'] = $filter;
			$aritles['title'] = $this->getLabel($filter);
			array_unshift($articles_filter, $aritles);
		}
		
		foreach ($articles_filter as $filter) {
			if ($filter['count'] > 0) {
				if ($filter['category_id'] == $filter_preload) {
					$filter['sel'] = 'sel';
					$setting['product_sort'] = $filter_preload;
					$filter['child'] = self::getProducts($category_id_list, $setting);
				}
				$list[$filter['category_id']] = $filter;
			}
		}
		
		return $list;
	}
	public function getCategoryson($category_id, $setting)
	{
		$category_arr = array();
		if(!is_array($category_id))
		{
			if($category_id=="*")
			{
				$category_id = $setting['category'];
			}else{
				$category_id = array($category_id);
			}
		}
		$category_arr = $category_id;
		if($setting['child_category'] ==1)
		{
			$category_arr =$category_id;
			for($i=1; $i<= (int)$setting['category_depth'];$i++)
			{
				$filter_data = array(
					'category_id'  => implode(',',$category_arr),
					'category_depth' => $setting['category_depth']
				);
				$categoryss = $this->model_module_so_listing_tabs->getCategories_son_listing_tabs($filter_data);
				foreach ($categoryss as $category)
				{
					if(!in_array($category['category_id'],$category_arr))
					{
						$category_arr[] = $category['category_id'];
					}
				}
			}
		}
		
		return $category_arr;
	}
	public function getProducts($category_id_list,$setting)
	{
		$list = array();
		if(is_array($category_id_list))
		{
			$filter_data = array(
				'filter_category_id'  => implode(',',$category_id_list),
				'sort'         => $setting['product_sort'],
				'order'        => $setting['product_ordering'],
				'limit'        => (int)$setting['source_limit'],
				'start' 	   => $setting['start']
			);
		}else{
			$filter_data = array(
				'filter_category_id'  => $category_id_list,
				'sort'         => $setting['product_sort'],
				'order'        => $setting['product_ordering'],
				'limit'        => (int)$setting['source_limit'],
				'start' 	   => $setting['start']
			);
		}
		
		$cat['count'] = $this->model_module_so_listing_tabs->getTotalProducts_listing_tabs($filter_data);
		if ($cat['count'] > 0) 
		{
			$products_arr = $this->model_module_so_listing_tabs->getProducts_listing_tabs($filter_data);
			foreach($products_arr as $product_info)
			{
				$product_image = $this->model_catalog_product->getProductImages($product_info['product_id']);
				$setting['width'] = ($setting['width'] == 0 ? "30px" : $setting['width']);
				$setting['height'] = ($setting['height'] == 0 ? "30px" : $setting['height']);
				
				$product_image_first = array_shift($product_image);
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					if($product_image){
						$image2 = $this->model_tool_image->resize($product_image[0]['image'], $setting['width'], $setting['height']);
					}else{
						$image2='';
					}
					
				}elseif(isset($product_image_first['image'])){
					$image = $this->model_tool_image->resize($product_image_first['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					$image2='';
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				$name = (($setting['title_maxlength'] != 0 && strlen($product_info['name']) > $setting['title_maxlength']) ? utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['title_maxlength']) . '..' : $product_info['name']);
				$description = (($setting['description_maxlength'] != 0 && strlen($product_info['description']) > $setting['description_maxlength']) ? utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_maxlength']) . '..' : $product_info['description']);
				$cat['child'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'thumb2'       => $image2,
					'name'        => $name,
					'description' => $description,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'date_added'  => $product_info['date_added'],
					'model'  	  => $product_info['model'],
					'quantity'    => $product_info['quantity'],
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
				);
			}
			$list = $cat['child'];
		}
		return $list;
	}
	private  function getLabel($filter){
		switch ($filter) {
			case 'p_price' : return $this->language->get('price');
			case 'pd_name' : return $this->language->get('name');
			case 'p_model' : return $this->language->get('model');
			case 'p_quantity' : return $this->language->get('quantity');
			case 'rating' : return $this->language->get('rating');
			case 'p_sort_order' : return $this->language->get('sort_add');
			case 'p_date_added' : return $this->language->get('date_add');
		}
	}
	
	private function processCategory($catids)
	{
		$catpubid = array();
		if (empty($catids)) return;
		foreach ($catids as $i => $cid) {
			$category = $this->model_catalog_category->getCategory($cid);
		
			$cats[$i] = $category;
			if (empty($category)) {
				unset($cats[$i]);
			} else {
				$catpubid[] = $category['category_id'];
			}
		}
		return $catpubid;
	}

	

	
}