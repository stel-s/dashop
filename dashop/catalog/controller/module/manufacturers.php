<?php
class ControllerModuleManufacturers extends Controller {
	public function index() {
		$this->load->language('product/manufacturer');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_brands'] = $this->language->get('text_brands');
		$data['text_index'] = $this->language->get('text_index');
		
		
		$data['brands'] = array();
		
		$this->load->model('catalog/manufacturer');
		
		$results = $this->model_catalog_manufacturer->getManufacturersByOrder();
		
		//echo "<pre>"; print_r($setting);
		$this->load->model('tool/image');
		
		foreach ($results as $result) {
				
				if (is_numeric(utf8_substr($result['name'], 0, 1))) {
					$key = '0 - 9';
				} else {
					$key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
				}
				
				if (!isset($data['brands'][$key])) {
					$data['brands'][$key]['name'] = $key;
				}
	
			$data['brands'][$key]['manufacturer'][] = array(
				'name'  => $result['name'],
				'image'  => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height')),
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
			);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturers.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/manufacturers.tpl', $data);
		} else {
			return $this->load->view('default/template/module/manufacturers.tpl', $data);
		}
	}
	
}
