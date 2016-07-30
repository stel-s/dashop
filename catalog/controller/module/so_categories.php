<?php
class ControllerModuleSocategories extends Controller {
	public function index($setting) {
		$this->load->language('module/so_categories');
		$data['heading_title'] = $setting['name'];
		$data['text_tax'] = $this->language->get('text_tax');
		$data['view_more'] = $this->language->get('view_more');
		$this->document->addStyle('catalog/view/javascript/so_categories/css/so-categories.css');
		if ($setting['theme'] == 'theme4') {
			$this->document->addScript('catalog/view/javascript/so_categories/js/jquery.imagesloaded.js');
			$this->document->addScript('catalog/view/javascript/so_categories/js/jquery.so_accordion.js');
		}
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('module/so_categories');
		
		//General 
		$data['item_link_target'] 	= $setting['item_link_target'];
		$data['deviceclass_sfx'] 	= $setting['deviceclass_sfx'];
		$data['accmouseenter'] 		= $setting['accmouseenter'];
		
		//Items Option
		$data['cat_title_display'] 			= $setting['cat_title_display'];
		$data['cat_title_maxcharacs'] 		= $setting['cat_title_maxcharacs'];
		$data['cat_sub_title_display'] 		= $setting['cat_sub_title_display'];
		$data['cat_sub_title_maxcharacs'] 	= $setting['cat_sub_title_maxcharacs'];
		$data['cat_all_product'] 			= $setting['cat_all_product'];
		$data['disp_title_module'] 		= (int)$setting['disp_title_module'] ;
		
		//Image Option
		$data['product_image'] 		= $setting['product_image'];
		$data['height'] 			= $setting['height'];
		$data['width'] 				= $setting['width'];
		$data['placeholder_path'] 	= $setting['placeholder_path'];
		
		//Advanced
		$data['pretext'] 			= $setting['pretext'];
		$data['posttext'] 			= $setting['posttext'];

		//
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['head_name'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['head_name'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['head_name']  = $setting['head_name'];
		}

		//Default
		$data['theme'] = $setting['theme'];	
		$catids = $setting['category'];
		$list = array();
		$cats = array();
		$_catids = (array)self::processCategory($catids);
		foreach($_catids as $category_id)
		{
			$category_info = $this->model_catalog_category->getCategory($category_id);
			if($category_info['image'] == null)
			{
				$data['list'][] = array(
					'title' 	=> $category_info['name'],
					'image'		=> $setting['placeholder_path'],
					'link'  	=> $this->url->link('product/category', 'path=' . $category_id),
					'child_cat' => self::getCategoryson($category_id,$setting),
					'product_image' => $setting['product_image'],
				);
			}else{
				$data['list'][] = array(
					'title' 	=> $category_info['name'],
					'image'		=> $this->model_tool_image->resize($category_info['image'], $setting['width'], $setting['height']),
					'link'  	=> $this->url->link('product/category', 'path=' . $category_id),
					'child_cat' => self::getCategoryson($category_id,$setting),
					'product_image' => $setting['product_image'],
				);
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/so_categories/so_categories.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/so_categories/so_categories.tpl', $data);
		} else {
			return $this->load->view('default/template/module/so_categories/so_categories.tpl', $data);
		}
	}
	public function getCategoryson($category_id, $setting)
	{
		$categoryss = array();
		if($setting['child_category'] ==1)
		{
			$filter_data = array(
				'category_id'  => $category_id,
				'limit'        => $setting['source_limit'],
				'start' 	   => 0,
				'width'        => $setting['width'],
				'height'       => $setting['height'],
				'category_depth' => $setting['category_depth']
			);
			$categoryss = $this->model_module_so_categories->getCategories_son_categories($filter_data);
		}
		return $categoryss;
	}
	public function getProducts($category_id_list,$setting)
	{
		
		$filter_data = array(
			'filter_category_id'  => implode(',',$category_id_list),
			'sort'         => $setting['product_sort'],
			'order'        => $setting['product_ordering'],
			'limit'        => $setting['source_limit'],
			'start' 	   => $setting['start']
		);
		$cat['count'] = $this->model_module_so_categories->getTotalProducts_categories($filter_data);
		if ($cat['count'] > 0) 
		{
			$products_arr = $this->model_module_so_categories->getProducts_categories($filter_data);
			foreach($products_arr as $product_info)
			{
				$product_image = $this->model_catalog_product->getProductImages($product_info['product_id']);
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				}elseif(isset($product_image[0]['image'])){
					$image = $this->model_tool_image->resize($product_image[0]['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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
				
				$name = (($setting['cat_title_maxcharacs'] != 0 || strlen($product_info['name']) > $setting['cat_title_maxcharacs']) ? utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['cat_title_maxcharacs']) . '..' : $product_info['name']);
				$description = (($setting['cat_title_maxcharacs'] != 0 || strlen($product_info['description']) > $setting['cat_title_maxcharacs']) ? utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['cat_title_maxcharacs']) . '..' : $product_info['description']);
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