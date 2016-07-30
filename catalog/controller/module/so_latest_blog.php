<?php
class ControllerModuleSolatestblog extends Controller {
	public function index($setting) {
		$this->load->language('module/so_latest_blog');
		$data['heading_title'] = $this->language->get('text_latest');
		$this->load->model('catalog/category');
		
		$this->load->model('module/so_latest_blog');
		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/javascript/so_latest_blog/css/style.css');
		$this->document->addStyle('catalog/view/javascript/so_latest_blog/css/animate.css');
		if (!defined ('OWL_CAROUSEL'))
		{
			$this->document->addStyle('catalog/view/javascript/so_latest_blog/css/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/so_latest_blog/js/owl.carousel.js');
			define( 'OWL_CAROUSEL', 1 );
		}
	
	// General options
		$data['class_suffix'] 			= $setting['class_suffix'];
		$data['item_link_target'] 		= $setting['item_link_target'];
		$data['button_page'] 			= $setting['button_page'];
		$data['type_show']				= $setting['type_show'];
		$data['nb_column0'] = $setting['nb_column0'];
		$data['nb_column1'] = $setting['nb_column1'];
		$data['nb_column2'] = $setting['nb_column2'];
		$data['nb_column3'] = $setting['nb_column3'];
		$data['nb_column4'] = $setting['nb_column4'];
		$data['nb_rows'] = $setting['nb_row'];
	// Blogs options
		$data['display_title'] 			= $setting['display_title'];
		$data['display_description'] 	= $setting['display_description'];
		$data['display_author'] 		= $setting['display_author'];
		$data['display_comment'] 		= $setting['display_comment'];
		$data['display_view'] 			= $setting['display_view'];
		$data['display_date_added'] 	= $setting['display_date_added'];
		$data['blog_image'] 			= $setting['blog_image'];
		$data['moduleid']  				= $setting['moduleid'];
		$data['disp_title_module'] 		= (int)$setting['disp_title_module'];
		$data['width'] 					= $setting['width'];
		$data['height']	 				= $setting['height'];
		$data['class_suffix']  	 		= isset($setting['class_suffix'])?$setting['class_suffix']:'';
		$data['display_readmore'] 		= $setting['display_readmore'];
		$data['readmore_text']  	 	= isset($setting['readmore_text'])?$setting['readmore_text']:'Readmore';
	// effect
		$data['autoplay'] = $setting['autoplay'];
		if ($data['autoplay'] == 1) {
			$data['autoplay_timeout'] = $setting['autoplay_timeout'];
		}else{
			$data['autoplay_timeout'] = 0;
		}
		$data['margin'] = $setting['margin'];
		$data['slideBy'] = $setting['slideBy'];
		$data['effect'] = $setting['effect'];
		$data['duration'] = $setting['duration'];
		$data['delay'] = $setting['delay'];
		$data['pausehover'] = $setting['pausehover'];
		$data['autoplaySpeed'] = $setting['autoplaySpeed'];
		$data['loop'] = $setting['loop'];
		$data['startPosition'] = $setting['startPosition'];
		$data['mouseDrag'] = $setting['mouseDrag'];
		$data['touchDrag'] = $setting['touchDrag'];
		$data['dots'] 	= ($setting['dots'] == 1) ? "true" : "false";
		$data['dotsSpeed'] 				= $setting['dotsSpeed'];
		$data['nav'] 					= ($setting['navs'] == 1 ? "true" : "false");
		$data['navSpeed'] 				= $setting['navSpeed'];
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['head_name'] 			= html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['head_name'], ENT_QUOTES, 'UTF-8');
		}else{
			$data['head_name']  		= $setting['head_name'];
		}
		
		// Get blogs
		$data['blogs']= self::getListBlogs($setting);

		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/so_latest_blog/default.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/so_latest_blog/default.tpl', $data);
		} else {
			return $this->load->view('default/template/module/so_latest_blog/default.tpl', $data);
		}
	
	}
	
	public function getListBlogs($setting)
	{
		if (!isset($setting['limit'])) {
			$setting['limit'] = 9;
		}
		if (!isset($setting['width'])) {
			$setting['width'] = 100;
		}
		if (!isset($setting['height'])) {
			$setting['height'] = 200;
		}
		
		$filter_data = array(
			'sort'  => 'b.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);
		$blogs = $this->model_module_so_latest_blog->getListBlogs($filter_data);
		
		$users = $this->model_module_so_latest_blog->getUsers();
		
		foreach( $blogs as $key => $blog ){
			if ($blogs[$key]['featured_image'] && $setting['blog_get_featured_image']){
				$blogs[$key]['thumb'] = $this->model_tool_image->resize($blog['featured_image'], (int)$setting['width'], (int)$setting['height'] );
			}else {
				$url = file_exists("image/so_latest_blog/images/".$setting['blog_placeholder_path']);
				if ($url) {
					$image_name = "so_latest_blog/images/".$setting['blog_placeholder_path'];
				} else {
					$image_name = "no_image.png";
				}
				$blogs[$key]['thumb'] = $this->model_tool_image->resize($image_name, (int)$setting['width'], (int)$setting['height']);
				
			}					
			// Title
			$title = $blog['article_title'];
			$title_maxlength = ((strlen($blog['article_title']) > $setting['title_maxlength'] && $setting['title_maxlength'] !=0)  ? utf8_substr(strip_tags(html_entity_decode($blog['article_title'], ENT_QUOTES, 'UTF-8')), 0, $setting['title_maxlength']) . '..' : $blog['article_title']);
			
			// Description
			$description 	= ((strlen($blog['description']) > $setting['description_maxlength'] && $setting['description_maxlength'] != 0) ? utf8_substr(strip_tags(html_entity_decode($blog['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_maxlength']) . '..' : $blog['description']);
			
			$blogs[$key]['title'] 			= $title;
			$blogs[$key]['title_maxlength'] = $title_maxlength;
			$blogs[$key]['description'] 	= $description;
			$blogs[$key]['author'] 			= isset($users[$blog['simple_blog_author_id']])? $users[$blog['simple_blog_author_id']]:$this->language->get('text_none_author');
			//$blogs[$key]['category_link'] 	=  $this->url->link( 'pavblog/category', "path=".$blog['category_id'] );
			$blogs[$key]['date_added']      = $blog['date_added']; 
			$blogs[$key]['date_modified']   = $blog['date_modified'];
			$blogs[$key]['comment_count'] 	=  $blog['comment'];
			$blogs[$key]['view_count'] 		=  $blog['view'];
			$blogs[$key]['link'] 			=  $this->url->link( 'simple_blog/article/view','simple_blog_article_id='.$blog['simple_blog_article_id'] );
			// text comment
			if($blog['comment'] > 0)
			{
				$blogs[$key]['text_comment']   = $this->language->get('text_comments');
			}else{
				$blogs[$key]['text_comment']   = $this->language->get('text_comment');
			}
			
			// text view
			if($blog['view'] > 0)
			{
				$blogs[$key]['text_view']   = $this->language->get('text_views');
			}else{
				$blogs[$key]['text_view']   = $this->language->get('text_view');
			}
		}
		$data['blogs'] = $blogs;
		
		return $data['blogs'];
	}
}