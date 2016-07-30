<?php
class ModelModuleSolatestblog extends Model {
	
	public function getListBlogs( $data ){
		
		// $sql = ' SELECT b.*,bd.article_title,bd.description,cd.name as category_title, cd.simple_blog_category_id as category_id FROM '
								// . DB_PREFIX . "simple_blog_article b LEFT JOIN "
								// . DB_PREFIX . "simple_blog_article_description bd ON b.simple_blog_article_id=bd.simple_blog_article_id  and bd.language_id=".(int)$this->config->get('config_language_id')." LEFT JOIN "
								// .DB_PREFIX."simple_blog_article_to_category ac ON ac.simple_blog_article_id = b.simple_blog_article_id LEFT JOIN "
								// . DB_PREFIX . 'simple_blog_category c ON c.simple_blog_category_id=ac.simple_blog_category_id  LEFT JOIN ' 
								// . DB_PREFIX . 'simple_blog_category_description cd ON c.simple_blog_category_id=cd.simple_blog_category_id  and cd.language_id='.(int)$this->config->get('config_language_id') ;
		$sql = ' SELECT b.*,bd.article_title,bd.description, (SELECT COUNT(*) FROM '.DB_PREFIX.'simple_blog_comment bc WHERE bc.simple_blog_article_id = b.simple_blog_article_id) AS comment,(SELECT COUNT(*) FROM '.DB_PREFIX.'simple_blog_view bv WHERE bv.simple_blog_article_id = b.simple_blog_article_id) AS view  FROM '
								. DB_PREFIX . "simple_blog_article b LEFT JOIN "
								. DB_PREFIX . "simple_blog_article_description bd ON b.simple_blog_article_id=bd.simple_blog_article_id  and bd.language_id=".(int)$this->config->get('config_language_id')." " ;
				
		$sql .=" WHERE b.status = '1' AND bd.language_id=".(int)$this->config->get('config_language_id');
		
		if( isset($data['filter_category_id']) && $data['filter_category_id'] ){
			$sql .= " AND b.category_id=".(int)$data['filter_category_id'];
		}
		
		
		if( isset($data['filter_tag']) && $data['filter_tag'] ){
			$tmp = explode (",",$data['filter_tag'] );
			
			if( count($tmp) > 1  ){
				
				$t = array();
				foreach( $tmp as $tag ){
					$t[] = 'b.tags LIKE "%'.$this->db->escape( $tag ).'%"';
					
				}
				$sql .= ' AND  '.implode(" OR ", $t ).' ';	

			}else {
				$sql .= ' AND b.tags LIKE "%'.$this->db->escape( $data['filter_tag'] ).'%"';
			}
		}
		
		if( isset($data['featured']) ){
			$sql .= ' AND featured=1 '; 
		}
		
		if( isset($data['not_in']) && $data['not_in'] ){
			$sql .= ' AND b.blog_id NOT IN('.$data['not_in'].')';
		}
		$sort_data = array(
			'bd.title',
			'b.hits',
			'b.`position`',
			'b.date_added'
		);	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			}else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY b.`date_added`";	
		}
		
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(bd.article_title) DESC";
		} else {
			$sql .= " ASC, LCASE(bd.article_title) ASC";
		} 
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
	
		$query = $this->db->query( $sql );
		$blogs = $query->rows;
		return $blogs; 
	}
	 public function getUsers(){
        $sql = "SELECT * FROM `" . DB_PREFIX . "user`";
        $query = $this->db->query( $sql );
        $users = $query->rows;
        $output = array();
        foreach( $users as $user ){
            $output[$user['user_id']] = $user['username'];
        }
        return $output;
    }
}