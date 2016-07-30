<?php
class ControllerModuleSodeals extends Controller {
	public function index($setting) {
		static $module = 1;
		$this->load->language('module/so_deals');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_tax'] = $this->language->get('text_tax');
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('module/so_deals');
		$this->document->addStyle('catalog/view/javascript/so_deals/css/style.css');
		$this->document->addStyle('catalog/view/javascript/so_deals/css/css3.css');
		if (!defined ('OWL_CAROUSEL'))
		{
			$this->document->addStyle('catalog/view/javascript/so_deals/css/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/so_deals/js/owl.carousel.js');
			define( 'OWL_CAROUSEL', 1 );
		}
		
		if (!isset($setting['limit'])) {
			$setting['limit'] = 3;
		}
		if (!isset($setting['start'])) {
			$setting['start'] = 0;
		}
		if (!isset($setting['width'])) {
			$setting['width'] = 100;
		}
		if (!isset($setting['height'])) {
			$setting['height'] = 200;
		}
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		//General 
		$data['item_link_target'] 	= $setting['item_link_target'];
		$data['nb_column0'] 		= $setting['nb_column0'];
		$data['nb_column1'] 		= $setting['nb_column1'];
		$data['nb_column2'] 		= $setting['nb_column2'];
		$data['nb_column3'] 		= $setting['nb_column3'];
		$data['nb_column4'] 		= $setting['nb_column4'];
		$data['start'] 				= $setting['start'];
		
		//Items Option
		$data['display_title'] 			= $setting['display_title'];
		$data['title_maxlength'] 		= $setting['title_maxlength'];
		$data['display_description'] 	= $setting['display_description'];
		$data['description_maxlength'] 	= $setting['description_maxlength'];
		$data['class_suffix'] 			= $setting['class_suffix'];
		$data['disp_title_module'] 		= (int)$setting['disp_title_module'] ;
		$data['display_price'] 			= $setting['display_price'];
		$data['display_add_to_cart'] 	= $setting['display_add_to_cart'];
		$data['display_wishlist'] 		= $setting['display_wishlist'];
		$data['display_compare'] 		= $setting['display_compare'];
		
		// image option
		$data['product_image'] = $setting['product_image'];
		
		//Effect Option
		$data['margin'] 				= $setting['margin'];
		$data['slideBy'] 				= $setting['slideBy'];
		$data['autoplay'] 				= ($setting['autoplay'] ==1 ? "true" : "false");
		$data['autoplay_hover_pause'] 	= ($setting['autoplayHoverPause'] ==1 ? "true" : "false");
		$data['autoplay_timeout'] 		= $setting['autoplayTimeout'];
		$data['autoplaySpeed'] 			= $setting['autoplaySpeed'];
		$data['startPosition'] 			= $setting['startPosition'];
		$data['mouseDrag'] 				= ($setting['mouseDrag'] == 1 ? "true" : "false" );
		$data['touchDrag'] 				= ($setting['touchDrag'] == 1 ? "true" : "false" );
		$data['loop'] 					= ($setting['loop'] == 1 ? "true" : "false" );
		$data['dots'] 					= ($setting['dots'] == 1 ? "true" : "false");
		$data['navs'] 					= ($setting['navs'] == 1 ? "true" : "false");
		$data['button_page'] 			= $setting['button_page'];
		$data['dotsSpeed'] 				= $setting['dotsSpeed'];
		$data['navSpeed'] 				= $setting['navSpeed'];
		
		$data['effect'] 			= $setting['effect'];
		$data['duration'] 			= $setting['duration'];
		$data['delay'] 				= $setting['delay'];

		

		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['head_name'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['head_name'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['head_name']  = $setting['head_name'];
		}
		
	
		
		//Default	
		$catids = $setting['category'];
		$list = array();
		$product_arr = array();
		$cats = array();
		$_catids = (array)self::processCategory($catids);
		if(count($_catids) != 0)
		{
			$category_id_list = self::getCategoryson($_catids,$setting);
			$product_arr = self::getProducts($category_id_list,$setting);
		}
		$data['list'] = $product_arr;
		
		$data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/so_deals/default.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/so_deals/default.tpl', $data);
		} else {
			return $this->load->view('default/template/module/so_deals/default.tpl', $data);
		}
	}
	
	public function getCategoryson($category_id, $setting)
	{
		$category_list = array();
		foreach($category_id as $category_item)
		{
			$checkCategory = $this->model_module_so_deals->checkCategory($category_item);
			if(isset($checkCategory) && $checkCategory[0]['status'] == 1 && $checkCategory != null)
			{
				$category_list[] =  $category_item;
			}
		}
		if($setting['child_category'] ==1)
		{
			for($i=1; $i<=$setting['category_depth'];$i++)
			{
				$filter_data = array(
					'category_id'  => implode(',',$category_list),
				);
				
				$categoryss = $this->model_module_so_deals->getCategories_son_deals($filter_data);

				foreach ($categoryss as $category)
				{
					if(!in_array($category['category_id'],$category_list))
					{
						$category_list[] = $category['category_id'];
					}
				}
			}
		}
		return $category_list;
	}
	public function getProducts($category_id_list,$setting)
	{
		$list = array();
		$filter_data = array(
			'filter_category_id'  => implode(',',$category_id_list),
			'sort'         => $setting['product_sort'],
			'order'        => $setting['product_ordering'],
			'limit'        => $setting['source_limit'],
			'start' 	   => $setting['start']
		);
		$cat['count'] = $this->model_module_so_deals->getTotalProducts_deals($filter_data);
		if ($cat['count'] > 0) 
		{
			$products_arr = $this->model_module_so_deals->getProducts_deals($filter_data);
			$cat['child'] = array();
			foreach($products_arr as $product_info)
			{	
				$product_image = $this->model_catalog_product->getProductImages($product_info['product_id']);
				if ($product_info['image'] && $setting['product_get_image_data']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				}elseif(isset($product_image[0]['image']) && $setting['product_get_image_image']){
					$image = $this->model_tool_image->resize($product_image[0]['image'], $setting['width'], $setting['height']);
				} else {
					$url = file_exists("image/so_deals/images/".$setting['placeholder_path']);
					if ($url) {
						$image_name = "so_deals/images/".$setting['placeholder_path'];
					} else {
						$image_name = "no_image.png";
					}
					$image = $this->model_tool_image->resize($image_name, $setting['width'], $setting['height']);
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				
				
				
				$specialPriceToDate = '';
				if (strtotime ($product_info['date_start']) != false && strtotime ($product_info['date_end']) != false)
				{
					$current = date ('Y/m/d H:i:s');
					$start_date = date ('Y/m/d H:i:s', strtotime ($product_info['date_start']));
					$date_end = date ('Y/m/d H:i:s', strtotime ($product_info['date_end']));
					if (strtotime ($date_end) >= strtotime ($current) && strtotime ($start_date) <= strtotime ($date_end))
						$specialPriceToDate = $date_end;
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
				$name = (($setting['title_maxlength'] != 0 && strlen($product_info['name']) > $setting['title_maxlength'] ) ? (utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['title_maxlength']) .'..') : $product_info['name']);
				$description = (($setting['description_maxlength'] != 0 && strlen($product_info['description']) > $setting['description_maxlength'] ) ? utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_maxlength']) . '..' : $product_info['description']);
				
				
				$cat['child'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
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
					'specialPriceToDate' => $specialPriceToDate,
				);
			}
			$list = $cat['child'];
		}
		return $list;
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