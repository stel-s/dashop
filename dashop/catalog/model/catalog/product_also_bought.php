<?php
class ModelCatalogProductAlsoBought extends Model {
	public function getProductAlsoBought($product_id, $max_row)
	{
		$product_data = $this->cache->get('productAlsoBought.' . (int)$product_id);
		
		if (!$product_data) {
			$product_data = array();
	
			$sql = "
				SELECT
					DISTINCT 
					  p.product_id
					, p.tax_class_id
					, pd.name AS name
					, p.image
					, p.price
					, p.model
					, m.name AS manufacturer
					, ss.name AS stock

					, (SELECT
							AVG(r.rating) 
						FROM `" . DB_PREFIX . "review` r 
						WHERE p.product_id = r.product_id 
						GROUP BY r.product_id) AS rating 
					, COUNT(*) AS cnt
				FROM `" . DB_PREFIX . "order_product` op
				INNER JOIN `" . DB_PREFIX . "order` o
					ON o.order_id = op.order_id
				INNER JOIN `" . DB_PREFIX . "product` p
					ON op.product_id = p.product_id
				LEFT OUTER JOIN `" . DB_PREFIX . "product_description` pd
					ON p.product_id = pd.product_id
				LEFT OUTER JOIN `" . DB_PREFIX . "product_to_store` p2s
					ON p.product_id = p2s.product_id
				LEFT OUTER JOIN `" . DB_PREFIX . "manufacturer` m
					ON p.manufacturer_id = m.manufacturer_id
				LEFT OUTER JOIN `" . DB_PREFIX . "stock_status` ss
					ON p.stock_status_id = ss.stock_status_id



				WHERE o.customer_id IN (
						SELECT
							o.customer_id
						FROM `" . DB_PREFIX . "order_product` op
						INNER JOIN `" . DB_PREFIX . "order` o
							ON o.order_id = op.order_id
						WHERE op.product_id = '" . (int)$product_id . "'
						GROUP BY o.customer_id)
					AND p.product_id != '" . (int)$product_id . "'
					AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
					AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
					AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "'
					AND p.date_available <= NOW()
					AND p.status = '1'
				GROUP BY op.product_id
				 DESC
				LIMIT 0, ".$max_row.";
			";
			$product_also_bought_query = $this->db->query($sql);
			
			$product_data = $product_also_bought_query->rows;
		}
		
		return $product_data;
	}
}