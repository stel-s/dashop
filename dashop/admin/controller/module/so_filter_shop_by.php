<?php
class ControllerModuleSoFilterShopBy  extends Controller {
	private $error = array(); 
	public function build_data(){
		$array = array();
		$array[] = 'aaaaaaaaaaa';
		$array[] = 'bbbbbbbbb';
		echo json_encode($array);die;
	}
	public function index() { 
	$this->load->model('extension/module');
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				
				$this->model_extension_module->addModule('so_filter_shop_by', $this->request->post);
				
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
	}
	$this->document->addStyle('../catalog/view/javascript/jquery/so_filter_shop_by/css/so-filter-shop-by-back-end.css');

	$this->load->language('module/so_filter_shop_by');
    $this->document->setTitle($this->language->get('heading_title'));
	
	
    $this->load->model('setting/setting'); 
	
	$data['header']                              = $this->load->controller('common/header');
	$data['footer']                               = $this->load->controller('common/footer');
    $data['column_left']                       = $this->load->controller('common/column_left');
	$this->load->language('module/so_filter_shop_by');
	$data['heading_title']                     = $this->language->get('heading_title');
	$data['button_save'] 					 = $this->language->get('button_save');
	$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
	$data['button_cancel'] 					 = $this->language->get('button_cancel');
	$data['text_edit'] 			                 = $this->language->get('text_edit');
	$data['entry_name'] 					= $this->language->get('entry_name');
	$data['entry_name_desc'] 				= $this->language->get('entry_name_desc');
	$data['entry_status'] 					= $this->language->get('entry_status');
	$data['text_enabled'] 		= $this->language->get('text_enabled');
	$data['text_disabled'] 		= $this->language->get('text_disabled');
	$data['text_edit_content'] 		= $this->language->get('text_edit_content');
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
			'href' => $this->url->link('module/so_filter_shop_by', 'token=' . $this->session->data['token'], 'SSL')
		);
	} else {
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/so_filter_shop_by', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
		);
	}
	if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
	} else {
			$data['error_warning'] = '';
	}
	if (!isset($this->request->get['module_id'])) {
		$data['action'] = $this->url->link('module/so_filter_shop_by', 'token=' . $this->session->data['token'], 'SSL');
	} else {
		$data['action'] = $this->url->link('module/so_filter_shop_by', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
	}
	
	if (isset($this->error['name'])) {
		$data['error_name'] = $this->error['name'];
	} else {
		$data['error_name'] = '';
	}
	if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
		$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
	}
	if (isset($this->request->post['name'])) {
		$data['name'] = $this->request->post['name'];
	} elseif (!empty($module_info)) {
		$data['name'] = $module_info['name'];
		$data['status'] = $module_info['status'];
	} else {
		$data['name'] = '';
		$data['status'] = 0;
	}
	
	if (isset($this->request->post['database'])) {
		$data['database'] = $this->request->post['database'];
	} elseif (!empty($module_info)) {
		$data['database'] = $module_info['database'];
	} else {
		$data['database'] = '';
	}
	
	if (isset($this->request->post['in_class'])) {
		$data['in_class'] = $this->request->post['in_class'];
	} elseif (!empty($module_info) && isset($module_info['in_class'])) {
		$data['in_class'] = $module_info['in_class'];
	} else {
		$data['in_class'] = '#content .row';
	}
	
	
	if (isset($this->request->post['column_in_row'])) {
		$data['column_in_row'] = $this->request->post['column_in_row'];
	} elseif (!empty($module_info) && isset( $module_info['column_in_row'])) {
		$data['column_in_row'] = $module_info['column_in_row'];
	} else {
		$data['column_in_row'] = '';
	}
	
	$data['categories'] = $this->getAllCategory();
	$data['products'] = $this->getAllProducts();
	
    $this->response->setOutput($this->load->view('module/so_filter_shop_by.tpl', $data));
	}
	protected function getAllCategory(){
		$this->load->model('catalog/category');
		$category_total = $this->model_catalog_category->getTotalCategories();
		$results = $this->model_catalog_category->getCategories();

		$categories = array();
		foreach ($results as $result) {
			$categories[] = array(
				'category_id' => $result['category_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
			);
		}
		return $categories;
	}
	
	protected function getAllProducts(){
		$this->load->model('tool/image');
		$this->load->model('catalog/product');
		$product_total = $this->model_catalog_product->getTotalProducts();
		$products = array();
		$results = $this->model_catalog_product->getProducts();
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}

			$special = false;

			$product_specials = $this->model_catalog_product->getProductSpecials($result['product_id']);

			foreach ($product_specials  as $product_special) {
				if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
					$special = $product_special['price'];

					break;
				}
			}

			$products[] = array(
				'product_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $result['price'],
				'special'    => $special,
				'quantity'   => $result['quantity'],
				'status'     => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
			);
		}
		return $products;
	}
	protected function validate() {
 
       
        if (!$this->user->hasPermission('modify', 'module/so_filter_shop_by')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
        
        if (!$this->error) {
            return true;
        } else {
            return false;
        }   

    }
}