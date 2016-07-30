<?php
class ControllerModuleSolatestblog extends Controller {
	private $error = array();
	public $data = array();
	public function index() {
		// Load language
		$this->load->language('module/so_latest_blog');
		$data['objlang'] = $this->language;

		// Load breadcrumbs
		$data['breadcrumbs'] = $this->_breadcrumbs();

		$this->load->model('extension/module');
		$this->load->model('module/so_latest_blog');
		if($this->checkDatabase()) {
			$this->document->setTitle($this->language->get('error_database'));

			$data['text_install_message'] = $this->language->get('text_install_message');

			$data['text_upgread'] = $this->language->get('text_upgread');

			$data['error_database'] = $this->language->get('error_database');

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('module/so_latest_blog/notification.tpl', $data));
		} else {
			$this->document->setTitle($this->language->get('heading_title'));

			// Delete Module
			if( isset($this->request->get['module_id']) && isset($this->request->get['delete']) ){
				$this->model_extension_module->deleteModule( $this->request->get['module_id'] );
				$this->response->redirect($this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'], 'SSL'));
			}

			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				if (!isset($this->request->get['module_id'])) {

					$this->model_extension_module->addModule('so_latest_blog', $this->request->post);

				} else {
					$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				}

				$action = isset($this->request->post["action"]) ? $this->request->post["action"] : "";
				unset($this->request->post['action']);
				$data = $this->request->post;

				$this->session->data['success'] = $this->language->get('text_success');
				if($action == "save_edit") {
					$this->response->redirect($this->url->link('module/so_latest_blog', 'module_id='.$this->request->post['moduleid'].'&token=' . $this->session->data['token'], 'SSL'));
				}elseif($action == "save_new"){
					$this->response->redirect($this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'], 'SSL'));
				}else{
					$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
				}
			}
			if (!isset($this->request->get['module_id'])) {
				$data['action'] = $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$data['action'] = $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
			}

			$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

			$moduleid_new= $this->model_module_so_latest_blog->getModuleId(); // Get module id

			$default = array(
				'last_moduleid' 		=>$moduleid_new[0]['Auto_increment'],
				'name' 					=> '',
				'module_description'	=> array(),
				'disp_title_module'		=> '1',
				'status'				=> '1',
				'class_suffix'			=> '',
				'item_link_target'		=> '_blank',
				'nb_column0'			=> '4',
				'nb_column1'			=> '4',
				'nb_column2'			=> '3',
				'nb_column3'			=> '2',
				'nb_column4'			=> '1',
				'limit'					=> '6',
				'button_page'			=> 'under',
				'type_show'				=> 'simple',
				'nb_row'				=> '1',
				'display_title'			=> '1',
				'title_maxlength'		=> '50',
				'display_description'	=> '1',
				'description_maxlength' => '100',
				'display_author'		=> '1',
				'display_comment'		=> '1',
				'display_view' 			=> '1',
				'display_date_added'	=> '1',
				'display_readmore'		=> '1',
				'readmore_text'			=> 'Read more',
				'blog_image'			=> '1',
				'blog_get_featured_image'=> '1',
				'width'					=> '100',
				'height'				=> '75',
				'blog_placeholder_path'		=> 'nophoto.png',
				'margin'				=> '5',
				'slideBy'				=> '1',
				'autoplay'				=> '0',
				'autoplay_timeout'		=> '5000',
				'pausehover'			=> '0',
				'autoplaySpeed'			=> '1000',
				'startPosition'			=> '0',
				'mouseDrag'				=> '1',
				'touchDrag'				=> '1',
				'dots'					=> '1',
				'dotsSpeed'				=> '500',
				'loop'					=> '1',
				'navs'					=> '1',
				'navSpeed'				=> '500',
				'effect'				=> 'starwars',
				'duration'				=> '800',
				'delay'					=> '500'
			);
			if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST') || $this->request->server['REQUEST_METHOD'] == 'POST' && !$this->validate() && isset($this->request->get['module_id'])) {
				$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
				$module_info['last_moduleid'] = $this->request->get['module_id'];
				$data['action'] = $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
				$data['subheading'] = $this->language->get('text_edit_module') . $module_info['name'];
				$data['selectedid'] = $this->request->get['module_id'];
			} else {
				$module_info = $default;
				$data['selectedid'] = 0;
				$data['action'] = $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'], 'SSL');
				$data['subheading'] = $this->language->get('text_create_new_module');
			}

			$data['token'] = $this->session->data['token'];
			$this->load->model('localisation/language');
			$data['languages'] = $this->model_localisation_language->getLanguages();
			$data['error']= $this->error;

			// Save and Stay --------------------------------------------------------------
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}
			$data['text_layout'] = sprintf($this->language->get('text_layout'), $this->url->link('design/layout', 'token=' . $this->session->data['token'], 'SSL'));

			// ---------------------------Load module --------------------------------------------
			$data['modules'] = array( 0=> $module_info );
			$data['moduletabs'] = $this->model_extension_module->getModulesByCode( 'so_latest_blog' );
			$data['link'] = $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'] . '', 'SSL');

			//--------------------------------Load Data -------------------------------------------
			$data['item_link_targets'] = array(
				'_blank' => $this->language->get('value_blank'),
				'_self'  => $this->language->get('value_self'),
			);

			//Column
			$data['nb_columns'] = array(
				'1'   => '1',
				'2'   => '2',
				'3'   => '3',
				'4'   => '4',
				'6'   => '6',
			);
			//button page
			$data['button_pages'] = array(
				'top' => "Top",
				'under' => "Under",
			);
			// Type show
			$data['type_shows']  = array(
				'simple' => $this->language->get('type_show_simple'),
				'slider' => $this->language->get('type_show_slider')
			);

			$data['nb_rows'] = array(
				'1'   => '1',
				'2'   => '2',
				'3'   => '3',
				'4'   => '4',
				'5'   => '5',
				'6'   => '6',
			);

			//Effect
			$data['effects'] = array(
				'none' 			=> $this->language->get('effect_none'),
				'fadeIn' 		=> $this->language->get('effect_fadeIn'),
				'zoomIn' 		=> $this->language->get('effect_zoomIn'),
				'zoomOut' 		=> $this->language->get('effect_zoomOut'),
				'slideLeft'  	=> $this->language->get('effect_slideLeft'),
				'slideRight' 	=> $this->language->get('effect_slideRight'),
				'slideTop' 		=> $this->language->get('effect_slideTop'),
				'slideBottom' 	=> $this->language->get('effect_slideBottom'),
				'flip'			=> $this->language->get('effect_flip'),
				'flipInX' 		=> $this->language->get('effect_flipInX'),
				'flipInY' 		=> $this->language->get('effect_flipInY'),
				'starwars'		=> $this->language->get('effect_starwars'),
				'bounceIn' 		=> $this->language->get('effect_bounceIn'),
				'bounceInUp' 	=> $this->language->get('effect_bounceInUp'),
				'bounceInDown' 	=> $this->language->get('effect_bounceInDown'),
				'pageTop'		=> $this->language->get('effect_pageTop'),
				'pageBottom' 	=> $this->language->get('effect_pageBottom'),
			);
			/*--------------------------------------------*/

			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			// Module description
			$data['module_description'] = $module_info['module_description'];
			$this->response->setOutput($this->load->view('module/so_latest_blog/so_latest_blog.tpl', $data));

		}
	}
	public function checkDatabase() {
		$database_not_found = $this->validateTable();

		if(!$database_not_found) {
			return true;
		}

		return false;
	}
	public function validateTable() {
		$table_name = $this->db->escape('simple_blog_article');

		$table = DB_PREFIX . $table_name;

		$query = $this->db->query("SHOW TABLES LIKE '{$table}'");

		return $query->num_rows;
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/so_latest_blog')) {
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

		if ($this->request->post['limit'] != '0' && !filter_var($this->request->post['limit'],FILTER_VALIDATE_FLOAT) || $this->request->post['limit'] < 0) {
			$this->error['limit'] = $this->language->get('error_limit');
		}

		if ($this->request->post['title_maxlength'] != '0' && !filter_var($this->request->post['title_maxlength'],FILTER_VALIDATE_FLOAT) || $this->request->post['title_maxlength'] < 0) {

			$this->error['title_maxlength'] = $this->language->get('error_title_maxlength');
		}

		if ($this->request->post['description_maxlength'] != '0' && !filter_var($this->request->post['description_maxlength'],FILTER_VALIDATE_FLOAT) || $this->request->post['description_maxlength'] < 0) {
			$this->error['description_maxlength'] = $this->language->get('error_description_maxlength');
		}

		if ((utf8_strlen($this->request->post['readmore_text']) < 1) ) {
			$this->error['readmore_text'] = $this->language->get('error_readmore_text');
		}

		if (!filter_var($this->request->post['width'],FILTER_VALIDATE_FLOAT) || $this->request->post['width'] < 0) {
			$this->error['width'] = $this->language->get('error_width');
		}
		if (!filter_var($this->request->post['height'],FILTER_VALIDATE_FLOAT) || $this->request->post['height'] < 0) {
			$this->error['height'] = $this->language->get('error_height');
		}
		if ($this->request->post['autoplay_timeout'] != '0' && !filter_var($this->request->post['autoplay_timeout'],FILTER_VALIDATE_INT) || $this->request->post['autoplay_timeout'] < 0) {
			$this->error['autoplay_timeout'] = $this->language->get('error_autoplay_timeout');
		}

		if (!filter_var($this->request->post['navSpeed'],FILTER_VALIDATE_INT) || $this->request->post['navSpeed'] < 0) {
			$this->error['navSpeed'] = $this->language->get('error_navSpeed');
		}

		if ($this->request->post['duration'] != '0' && !filter_var($this->request->post['duration'],FILTER_VALIDATE_INT) || $this->request->post['duration'] < 0) {
			$this->error['duration'] = $this->language->get('error_duration');
		}

		if ($this->request->post['delay'] != '0' && !filter_var($this->request->post['delay'],FILTER_VALIDATE_INT) || $this->request->post['delay'] < 0) {
			$this->error['delay'] = $this->language->get('error_delay');
		}
		if (!filter_var($this->request->post['margin'],FILTER_VALIDATE_INT) || $this->request->post['margin'] < 0) {
			$this->error['margin'] = $this->language->get('error_margin');
		}

		if (!filter_var($this->request->post['slideBy'],FILTER_VALIDATE_INT) || $this->request->post['slideBy'] < 0) {
			$this->error['slideBy'] = $this->language->get('error_slideBy');
		}
		if (!filter_var($this->request->post['autoplaySpeed'],FILTER_VALIDATE_INT) || $this->request->post['autoplaySpeed'] < 0) {
			$this->error['autoplaySpeed'] = $this->language->get('error_autoplaySpeed');
		}

		if ($this->request->post['startPosition'] != '0' && !filter_var($this->request->post['startPosition'],FILTER_VALIDATE_INT) || $this->request->post['startPosition'] < 0) {
			$this->error['startPosition'] = $this->language->get('error_startPosition');
		}
		if (!filter_var($this->request->post['dotsSpeed'],FILTER_VALIDATE_INT) || $this->request->post['dotsSpeed'] < 0) {
			$this->error['dotsSpeed'] = $this->language->get('error_dotsSpeed');
		}
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		return !$this->error;
	}

	public function _breadcrumbs(){
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$this->data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/so_latest_blog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}
		return $this->data['breadcrumbs'];
	}
}