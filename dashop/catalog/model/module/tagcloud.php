<?php
class ModelModuleTagcloud extends Model {
    public function getRandomTags($data) {

        $limit         = isset($data['limit']) ? $data['limit'] : 5;
        $min_font_size = isset($data['min_font_size']) ? $data['min_font_size'] : 12;
        $max_font_size = isset($data['max_font_size']) ? $data['max_font_size'] : 25;
        $resize        = isset($data['resize']) && $data['resize'] == 1 ? true : false;
        
        $tagQuery = $this->db->query("SELECT tag, qty FROM " . DB_PREFIX . "tag_cloud 
            WHERE language_id = '" . $this->config->get('config_language_id') . "' 
            AND store_id = '" . (int)$this->config->get('config_store_id') . "' 
            ORDER BY RAND() LIMIT " . $limit);

        $tags = $tagQuery->rows;

        $cloudData = array(
            'tags'          => $tags,
            'resize'        => $resize,
            'min_font_size' => $min_font_size,
            'max_font_size' => $max_font_size
        );

        $tagcloud = $this->generateTagCloud($cloudData);

        return $tagcloud;
    }

    private function generateTagCloud($data) {

        $resize        = isset($data['resize']) && $data['resize'] == 1 ? true : false;
        $tags          = $data['tags'];
        $min_font_size = isset($data['min_font_size']) ? $data['min_font_size'] : 12;
        $max_font_size = isset($data['max_font_size']) ? $data['max_font_size'] : 25;

        if ($resize == true) {
            $qty_arr = array();
            foreach($tags as $tag) {
                $qty_arr[] = $tag['qty'];
            }

            if (count($qty_arr) !== 0) {
                $max_qty = max($qty_arr);
                $min_qty = min($qty_arr);
            } else {
                $max_qty = 0;
                $min_qty = 0;
            }

            $spread = $max_qty - $min_qty;

            if ($spread == 0) {
                $spread = 1;
            }

            $step = ($max_font_size - $min_font_size) / ($spread);

            $cloud = array();

            foreach ($tags as $record) {

                if($this->config->get('tagcloud_font_function') == '0') {
                    $size=rand((int)$min_font_size,(int)$max_font_size);
                } else {
                    $size = round($min_font_size + (($record['qty'] - $min_qty) * $step));
                }
                $cloud[] = '<li><a href="' . (HTTP_SERVER . 'index.php?route=product/search&amp;filter_tag=' . $record['tag']) . '&amp;tag=' . $record['tag'] . '" style="font-size: ' . $size . 'px" title="' . $record['qty'] . ' ' .$this->language->get('text_href_title') . ' ' . $record['tag'] . '">' . $record['tag'] . '</a></li>';
            }
        } else {
            foreach ($tags as $record) {
                $cloud[] = '<li><a href="' . (HTTP_SERVER . 'index.php?route=product/search&amp;filter_tag=' . $record['tag']) . '&amp;tag=' . $record['tag'] . '" title="' . $record['qty'] . ' products tagged with ' . $record['tag'] . '">' . $record['tag'] . '</a></li>';
            }
        }

        $tagcloud = '';
        if (isset($cloud)) {
            for ($x = 0; $x < count($cloud); $x++) {
                $tagcloud .= $cloud[$x];
            }
        }


        return $tagcloud;
    }
}
