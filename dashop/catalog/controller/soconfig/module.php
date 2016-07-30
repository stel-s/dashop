<?php 
class Modules extends Controller {
	global $config, $loader,$registry;
	
	/*public function __construct($registry) {
		parent::__construct($registry);
	}*/
	
	/*public function getModules($module_position) {
		$load->model('design/layout');
		$load->model('catalog/category');
		$load->model('catalog/product');
		$load->model('catalog/information');
		
		if (isset($request->get['route'])) {
			$route = (string)$request->get['route'];
		} else {
			$route = 'common/home';
		}
		
		/*$layout_id = 0;
		
		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$request->get['path']);
				
			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));			
		}
		
		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}
		
		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}
		
		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}
				
		if (!$layout_id) {
			$layout_id = $config->get('config_layout_id');
		}*/

		/*$module_data = array();
		
		$load->model('setting/extension');
		
		$extensions = $this->model_setting_extension->getExtensions('module');		
		
		foreach ($extensions as $extension) {
			$modules = $config->get($extension['code'] . '_module');
			
			if ($modules) {
				foreach ($modules as $module) {
					if (($module['layout_id'] == $layout_id || $module['layout_id'] == 99999) && $module['position'] == $module_position && $module['status']) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);				
					}
				}
			}
		}
		
		$sort_order = array(); 
	  
		foreach ($module_data as $key => $value) {
      		$sort_order[$key] = $value['sort_order'];
    	}
		
		array_multisort($sort_order, SORT_ASC, $module_data);
		
		$data['modules'] = array();
		
		foreach ($module_data as $module) {
			$module = $this->getChild('module/' . $module['code'], $module['setting']);
			
			if ($module) {
				$data['modules'][] = $module;
			}
		}
		
		return $data['modules'];*/
	}	*/

}
?>