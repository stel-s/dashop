<?php
class ControllerModuleSofiltershopby extends Controller {
	public function get_data(){
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('catalog/review');
		$this->load->model('module/so_filter_shop_by');
		if(isset($this->request->get['string'])){
			$string = $this->request->get['string'];
		}else{
			$string = $this->request->post['string'];
		}
		
		$array_string = explode('--',$string);
		$rat = '';
		$srch = '';
		$pid = '';
		foreach($array_string as $item){
			$array_info = explode('*',$item);
			if($array_info[0] == 'pid'){
				$pid = $array_info[1];
			}
			
			if($array_info[0] == 'rat'){
				$rat = $array_info[1];
			}
			$srch = '';
			if($array_info[0] == 'srch'){
				$srch = $array_info[1];
			}
		}
		$array_id = explode('-',$pid);
		$str_categorys = implode(",",$array_id);
		$filter_data = array(
				'filter_name'         => $srch,
				'filter_pid'             => str_replace('-',',',$pid),
				'filter_rating'         => $rat ,
			);
		$results = $this->model_module_so_filter_shop_by->getProducts($filter_data);
		
		$return_id = '';
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}
			if($return_id == ''){
				$return_id = $result['product_id'];	
			}else{
				$return_id = $return_id . '-' . $result['product_id'];	
			}
			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}
		$data['header'] = '';
		$data['breadcrumbs'] = array();
		$data['column_left'] = '';
		$data['column_right'] = '';
		$data['content_top'] = '';
		$data['heading_title'] = '';
		$data['thumb'] = '';
		$data['description'] = '';
		$data['categories'] = '';
		$data['compare'] = '';
		$data['text_compare'] = '';
		$data['button_list'] = '';
		$data['button_grid'] = '';
		$data['text_sort'] = '';
		$data['text_limit'] = '';
		$data['text_tax'] = '';
		$data['button_wishlist'] = '';
		$data['button_cart'] = '';
		$data['button_compare'] = '';
		$data['results '] = '';
		$data['pagination'] = '';
		$data['content_bottom'] = '';
		$data['footer'] = '';
		$data['results'] = '';
		$data['sorts'] = array();
		$data['limits'] = array();
		$html = array();
		if(empty($this->request->get['gethtml'])){
			$html['html'] =  file_get_contents($this->request->post['url'].'&gethtml=1&string='.$string);
			$html['html'] = $html['html'] . '<div class="sj_filter_product_id" style="display:none;" data-id="'.$return_id.'"></div>';
			echo json_encode($html);die;
		}else{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {		
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/category.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/category.tpl', $data));
			}
		}
		
	}
	public function build_data() {
		$val = $this->request->post['val'];
		$this->load->model('catalog/category');
		$this->load->model('module/so_filter_shop_by');
		
		$array_data = explode('-----',$val);
		$html = '';
		foreach($array_data as $data){
			if($html != ''){
				$html = $html . '-----';
			}
			$array_item = explode('---',$data);
			$type = $array_item[0];
			if($type == 'reset_all' || $type == 'search' || $type == 'rating'){
				$html = $html . $data;
				continue;
			}
			$html = $html . $type . '---';
			if($type == 'categories'){
				$array_categories = $array_item[1];
				$array_info = explode('--',$array_categories);
				foreach($array_info as $index => $info){
					if($index == 0){
						$html = $html . $info;
						continue;
					}
					$html = $html . '--';
					$array_ca = explode('-',$info);
					$ca_id = $array_ca[0];
					$html = $html . $array_ca[0] . '-';
					$html = $html . htmlspecialchars_decode($array_ca[1]);
					if($this->model_module_so_filter_shop_by->getProductInCategory($ca_id) != 0){
						$html = $html . '*' . $this->model_module_so_filter_shop_by->getProductInCategory($ca_id);
					}	
				}
				
				$html = $html . '---' .  $array_item[2];
			}
			
			if($type == 'field_chose' || $type == 'filed_radio'){
				$array_data= explode('--',$array_item[1]);
				foreach($array_data as $index => $data){
					if($index == 0){
						$html = $html . $data;
						continue;
					}
					
					if($index == 1){
						
						if($this->model_module_so_filter_shop_by->getFieldAttributeId($data) != -1){
							$html = $html . '--';
							$html = $html . $data;
							$aid = $this->model_module_so_filter_shop_by->getFieldAttributeId($data);
							continue;
						}else{
							$html = $html . $array_item[1];
							break;
						}
					}
					$html = $html . '--' .$data;
					if($this->model_module_so_filter_shop_by->getProductInAttribute($aid,$data) != -1){
						$html = $html . '*' . $this->model_module_so_filter_shop_by->getProductInAttribute($aid,$data);
					}					
				}
				
			}
			
			if($type == 'filed_min_max'){
				$array_data= explode('--',$array_item[1]);
				$name = $array_data[0];
				$html = $html . $name;
				$name_field = $array_data[1];
				$html = $html . '--' . $name_field;
				$aid = $this->model_module_so_filter_shop_by->getFieldAttributeId($name_field);
				$max = $array_data[2];
				$html = $html . '--' . $max;
				$min = $array_data[3];
				$html = $html . '--' . $min;
				if($this->model_module_so_filter_shop_by->getProductInAttributeM($aid,$max,$min) != -1)
				$html = $html . '--' . $this->model_module_so_filter_shop_by->getProductInAttributeM($aid,$max,$min);
			}
						
		}
		$array = array();
		$array['html'] = $html;
		echo json_encode($array);die;
	}
	
	public function index($setting) {
			$this->document->addStyle('catalog/view/javascript/jquery/so_filter_shop_by/css/so-filter-shop-by.css');
			$this->load->model('catalog/category');
			$this->load->model('module/so_filter_shop_by');
			$database = $setting['database'];
			$items = explode('-----',$database);
			$data['class'] = $setting['in_class'];
			$column = $setting['column_in_row'];
			if($column == 3){
				$data['column_cls'] = 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12';
			}
			if($column == 4){
				$data['column_cls'] = 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12';
			}
			if($column == 2){
				$data['column_cls'] = 'product-layout product-grid col-lg-6 col-md-6 col-sm-6 col-xs-12';
			}
			if($column == 1){
				$data['column_cls'] = 'product-layout product-grid col-lg-12 col-md-12 col-sm-12 col-xs-12';
			}
			$data['product_cls'] = 'product-layout product-list col-xs-12';
			$html = '<div class="so_filter_shop_by">';
			foreach($items as $item){			
				$array_item = explode('---',$item);
				$type = $array_item[0];
				$html = $html . '<div class="so_filter_shop_by_item">';
				
				$info_item = explode('--',$array_item[1]);
				if($type == 'categories' || $type == 'filed_radio'){					
					if($type == 'categories'){
						$show_logo = explode('--',$array_item[2])[0];
						$show_radio = explode('--',$array_item[2])[1];
						if($show_radio == 1){
							$html_radio = '<input type="checkbox" />';
							$cls_type = '';
						}else{
							$html_radio = '';
							$cls_type = ' sj_filter_shop_by_chose';
						}
						foreach($info_item as $index => $info){

							
							$array_info = explode('-',$info);
							if($index == 0){
								$cls = str_replace(' ','_',$info);
								$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
								$html = $html . '<div class="so_filter_shop_by_item_title sj_filter_title_click">'.$info.'<i class="fa fa-minus-circle"></i></div>';
								$html = $html . '<div class="so_filter_shop_by_item_content" data-type="'.$type.'">';
							}else if($index == (count($info_item) - 1)){							
								$ca = $this->model_catalog_category->getCategory($array_info[0]);
								if($show_logo == 1){
									if($ca['image'] != ''){
										$html_img = '<div class="sj_filter_category_img"><img src="image/'.$ca['image'] .'" alt /></div>';
									}else{
										$html_img = '<div class="sj_filter_category_img"><img src="image/cache/no_image-100x100.png' .'" alt /></div>';
									}									
								}else{
									$html_img = '';
								}
								$array_info = explode('*',$info);
								if(count($array_info) > 1){
									$data_idP =  $array_info[1];
								}else{
									$data_idP =  '-1';
								}
								$array_info = explode('-',$info);
								$title_category = explode('&amp;nbsp;',$array_info[1]);
								$title = $title_category[(count($title_category) - 1)];
								$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_last'.$cls_type.'" data-value="'.$array_info[0].'" data-product="'.$data_idP.'">'.$html_radio.$html_img.'<p>'.explode('*',$title)[0].'</p></div>';
								$html = $html . '</div>';
								$html = $html . '</div>';
							}else{
								$ca = $this->model_catalog_category->getCategory($array_info[0]);
								if($show_logo == 1){
									if($ca['image'] != ''){
										$html_img = '<div class="sj_filter_category_img"><img src="image/'.$ca['image'] .'" alt /></div>';
									}else{
										$html_img = '<div class="sj_filter_category_img"><img src="image/cache/no_image-100x100.png' .'" alt /></div>';
									}									
								}else{
									$html_img = '';
								}								
								$array_info = explode('*',$info);
								if(count($array_info) > 1){
									$data_idP =  $array_info[1];
								}else{
									$data_idP =  '-1';
								}
								$array_info = explode('-',$info);
								$title_category = explode('&amp;nbsp;',$array_info[1]);												
								$title = $title_category[(count($title_category) - 1)];
								$html = $html . '<div class="so_filter_shop_by_item_category'.$cls_type.'" data-value="'.$array_info[0].'" data-product="'.$data_idP.'">'.$html_radio.$html_img.'<p>'.explode('*',$title)[0].'</p></div>';
							}
						}
					}else{
						
						foreach($info_item as $index => $info){
							
							if($index == 1)continue;
							if($index == 0){
								$cls = str_replace(' ','_',$info);
								$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
								$html = $html . '<div class="so_filter_shop_by_item_title sj_filter_title_click">'.$info.'<i class="fa fa-minus-circle"></i></div>';
								if(isset($info_item[1])){
									$field  = explode('*',$info_item[1])[0];
								}else{
									$field = '';
								}								
								$html = $html . '<div class="so_filter_shop_by_item_content" data-type="'.$type.'" data-field="'.$field.'">';								
							}else if($index == (count($info_item) - 1)){
								$array = explode('*',$info);
								$info = $array[0];
								if(isset($array[1])){
									$data_idP = $array[1];
								}else{
									$data_idP = '-1';
								}
								$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_last" data-value="'.$info.'" data-product="'.$data_idP.'"><input type="checkbox" /><p>'.$info.'</p></div>';
								$html = $html . '</div>';
								$html = $html . '</div>';								
							}else{
								$array = explode('*',$info);
								$info = $array[0];
								if(isset($array[1])){
									$data_idP = $array[1];
								}else{
									$data_idP = '-1';
								}
								$html = $html . '<div class="so_filter_shop_by_item_category" data-value="'.$info.'"  data-product="'.$data_idP.'"><input type="checkbox" /><p>'.$info.'</p></div>';
							}
						}
					}
				}
				if($type == 'search'){
						$cls = str_replace(' ','_',$array_item[1]);
						$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
						$html = $html . '<div class="so_filter_shop_by_item_title_s">'.$array_item[1].'</div>';
						$html = $html . '<div class="so_filter_shop_by_item_content" data-type="'.$type.'">';
						$html = $html . '<input class="sj_filter_shop_by_search" type="text"/>';
						$html = $html . '<div class="sj_filter_btn_search"><i class="fa fa-search"></i></div>';
						$html = $html . '<div class="sj_filter_btn_search_delete"><i class="fa fa-times"></i></div>';
						$html = $html . '</div>';
						$html = $html . '</div>';						
				}
				if($type == 'reset_all'){
						$cls = str_replace(' ','_',$array_item[1]);
						$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
						$html = $html . '<div class="so_filter_shop_by_item_title_rs so_filter_shop_by_reset_all">'.$array_item[1].'</div>';
						$html = $html . '</div>';						
				}
				if($type == 'field_chose'){
					foreach($info_item as $index => $info){
						if($index == 1)continue;	
						if($index == 0){
							
							$cls = str_replace(' ','_',$info);							
							$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
							$html = $html . '<div class="so_filter_shop_by_item_title sj_filter_title_click">'.$info.'<i class="fa fa-minus-circle"></i></div>';
							$html = $html . '<div class="so_filter_shop_by_item_content" data-type="'.$type.'" data-field="'.$info_item[1].'">';							
						}else if($index == (count($info_item) - 1)){
							$array = explode('*',$info);
							$info = $array[0];
							if(isset($array[1])){
								$data_idP = $array[1];
							}else{
								$data_idP = '-1';
							}
							$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose sj_filter_last" data-value="'.$info.'" data-product="'.$data_idP.'"><p>'.$info.'</p></div>';
							$html = $html . '</div>';
							$html = $html . '</div>';
						}else{
							$array = explode('*',$info);
							$info = $array[0];
							if(isset($array[1])){
								$data_idP = $array[1];
							}else{
								$data_idP = '-1';
							}
							$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose" data-value="'.$info.'" data-product="'.$data_idP.'"><p>'.$info.'</p></div>';
						}
					}
				}
				if($type == 'filed_min_max'){
					$cls = $cls = str_replace(' ','_',$info_item[0]);
					$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
					$html = $html . '<div class="so_filter_shop_by_item_title sj_filter_title_click">'.$info_item[0].'<i class="fa fa-minus-circle"></i></div>';
					if(isset( $info_item[1])){
						$field  = $info_item[1];
					}else{
						$field = '';
					}
					if(count($info_item) == 5){
						$data_idP = $info_item[4];
					}else{
						$data_idP = '-1';
					}	
					$html = $html . '<div class="so_filter_shop_by_item_content" data-type="'.$type.'" data-field="'.$field.'" data-product="'.$data_idP.'">';
					$html = $html . '<div class="so_filter_shop_by_item_content_min_max">';
					$html = $html . '<div class="so_filter_shop_by_item_content_input_max" data-max="'.$info_item[2].'">'.$info_item[2].'</div>';
					$html = $html . '<div class="so_filter_shop_by_item_content_input_min" data-min="'.$info_item[3].'">'.$info_item[3].'</div>';
					$html = $html . '</div>';
					$html = $html . '<div class="so_filter_shop_by_item_content_scroll">';
					$html = $html . '<div class="so_filter_shop_by_item_scroll_content">';					
					$html = $html . '<div class="so_filter_shop_by_item_content_scroll_left"></div>';
					$html = $html . '<div class="so_filter_shop_by_item_content_scroll_right"></div>';
					$html = $html . '</div>';
					$html = $html . '</div>';
					$html = $html . '</div>';
					$html = $html . '</div>';
				}
				if($type == 'rating'){
					$cls = $cls = str_replace(' ','_',$info_item[0]);
					$cls = $cls = str_replace(' ','_',$info_item[0]);
					$html = $html . '<div class="so_filter_shop_by_item_'.$cls.'">';
					$html = $html . '<div class="so_filter_shop_by_item_title sj_filter_title_click">'.$info_item[0].'<i class="fa fa-minus-circle"></i></div>';
					$html = $html . '<div class="so_filter_shop_by_item_content" data-type="'.$type.'">';
					$html = $html . '<div class="so_filter_shop_by_item_rating">';
					$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose" data-value="5"><p><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p></div>';
					$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose" data-value="4"><p><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p></div>';
					$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose" data-value="3"><p><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p></div>';
					$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose" data-value="2"><p><i class="fa fa-star"></i><i class="fa fa-star"></i></p></div>';
					$html = $html . '<div class="so_filter_shop_by_item_category sj_filter_shop_by_chose sj_filter_last" data-value="1"><p><i class="fa fa-star"></i></p></div>';
					$html = $html . '</div>';
					$html = $html . '</div>';
					$html = $html . '</div>';
				
					
					
				}
				$html = $html . '</div>';
			}
			
			$html = $html . '</div>';
			$data['html'] = $html;
			return $this->load->view($this->config->get('config_template') . '/template/module/so_filter_shop_by.tpl', $data);
	}
}
?>