<?php
class ControllerCommonMaintenance extends Controller {
	public function index() {

         //=========== OpenCart Shortcodes
         
         // Shortcodes
         $shortcodes = new Shortcodes($this->registry);
         $this->registry->set('shortcodes', $shortcodes);
         
         //=== Default shortcodes
         $this->load->helper('shortcodes_default');
         
         $class         = new ShortcodesDefault($this->registry);
         $scDefaults    = get_class_methods($class);
         foreach ($scDefaults as $shortcode) {
            $this->shortcodes->add_shortcode($shortcode, $shortcode, $class);
         }

         //=== Extensions shortcodes : for extensions developer
         $files = glob(DIR_APPLICATION . '/view/shortcodes/*.php');
         if ($files) {
            foreach ($files as $file) {
               require_once($file);
               
               $file     = basename($file, ".php");
               $extClass = 'Shortcodes' . preg_replace('/[^a-zA-Z0-9]/', '', $file);
               
               $class   = new $extClass($this->registry);
               $scExtensions = get_class_methods($class);
               foreach ($scExtensions as $shortcode) {
                  $this->shortcodes->add_shortcode($shortcode, $shortcode, $class);
               }
            }
         }
         
         //=== Themes shortcodes : for theme developer
         $file = DIR_TEMPLATE . $this->config->get('config_template') . '/shortcodes_theme.php';
         if (file_exists($file)) {
            require_once($file);
            
            $class      = new ShortcodesTheme($this->registry);
            $scThemes   = get_class_methods($class);
            foreach ($scThemes as $shortcode) {
               $this->shortcodes->add_shortcode($shortcode, $shortcode, $class);
            }
         }
         
         //=== Custom shortcodes : user power!
         $file = DIR_TEMPLATE . $this->config->get('config_template') . '/shortcodes_custom.php';
         if (file_exists($file)) {
            require_once($file);
            
            $class      = new ShortcodesCustom($this->registry);
            $scCustom   = get_class_methods($class);
            foreach ($scCustom as $shortcode) {
               $this->shortcodes->add_shortcode($shortcode, $shortcode, $class);
            }
         }
         
         //=========== END :: OpenCart Shortcodes
         
		if ($this->config->get('config_maintenance')) {
			$route = '';

			if (isset($this->request->get['route'])) {
				$part = explode('/', $this->request->get['route']);

				if (isset($part[0])) {
					$route .= $part[0];
				}
			}

			// Show site if logged in as admin
			$this->user = new User($this->registry);

			if (($route != 'payment' && $route != 'api') && !$this->user->isLogged()) {
				return new Action('common/maintenance/info');
			}
		}
	}

	public function info() {
		$this->load->language('common/maintenance');

		$this->document->setTitle($this->language->get('heading_title'));

		if ($this->request->server['SERVER_PROTOCOL'] == 'HTTP/1.1') {
			$this->response->addHeader('HTTP/1.1 503 Service Unavailable');
		} else {
			$this->response->addHeader('HTTP/1.0 503 Service Unavailable');
		}

		$this->response->addHeader('Retry-After: 3600');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_maintenance'),
			'href' => $this->url->link('common/maintenance')
		);

		$data['message'] = $this->language->get('text_message');

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/maintenance.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/maintenance.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/maintenance.tpl', $data));
		}
	}
}
