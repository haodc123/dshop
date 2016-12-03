<?php
class ModelCatalogColor extends Model {
	public function addColor($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "color SET name = '" . $this->db->escape($data['name']) . "', color= '" . $this->db->escape(strtoupper($data['color'])). "', code='" . $this->db->escape($data['code']) . "', status='" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
        $this->cache->delete('color');
	}
        public function deleteColor($color_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "color WHERE color_id = '" . (int)$color_id . "'");
                $this->cache->delete('color');
	}
        
         public function editColor($color_id, $color, $data) {
		
                $this->db->query("UPDATE `" . DB_PREFIX . "color` SET color = '" . $this->db->escape($data['color']) . "', name = '" . $this->db->escape($data['name']). "', code ='" . $this->db->escape($data['code']) . "', status = '" . (int)$data['status']. "', sort_order = '" . (int)$data['sort_order'] . "' WHERE color_id = '" . (int)$color_id . "'");
                
               
                $product_color= $this->db->query("SELECT * FROM `" . DB_PREFIX . "product` WHERE color = '" .  $this->db->escape($color) . "'");
                foreach ($product_color->rows as $product) {
                      $this->db->query("UPDATE `" . DB_PREFIX . "product` SET color = '" . $this->db->escape($data['color']) . "', model_color = '" . $this->db->escape($product['model'].'-'.$data['color']) . "' WHERE color = '" . $this->db->escape($product['color']) . "' and model = '" . $this->db->escape($product['model']) . "'");
                
                }
	}
	
	public function getColor($color_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'color_id=" . (int)$color_id . "') AS keyword FROM " . DB_PREFIX . "color WHERE color_id = '" . (int)$color_id . "'");
		
		return $query->row;
	}
	
	public function getColors($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "color";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		$sort_data = array(
			'name',
			'sort_order'
		);	
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}
		
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
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
		
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
	public function getTotalColors() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "color");
        return $query->row['total'];
	}	
}
?>