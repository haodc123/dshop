<?php
class ModelCatalogSize extends Model {
	public function addSize($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "size SET name = '" . $this->db->escape($data['name']) . "', code='" . $this->db->escape($data['code']) . "', status='" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
        $this->cache->delete('size');
	}
        public function deleteSize($size_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "size WHERE size_id = '" . (int)$size_id . "'");
                $this->cache->delete('size');
	}
        
         public function editSize($size_id,$data) {
		
                $this->db->query("UPDATE `" . DB_PREFIX . "size` SET name = '" . $this->db->escape($data['name']). "', code ='" . $this->db->escape($data['code']) . "', status = '" . (int)$data['status']. "', sort_order = '" . (int)$data['sort_order'] . "' WHERE size_id = '" . (int)$size_id . "'");
                
               
//                $product_size= $this->db->query("SELECT * FROM `" . DB_PREFIX . "product` WHERE size = '" .  $this->db->escape($size) . "'");
//                foreach ($product_size->rows as $product) {
//                    $this->db->query("UPDATE `" . DB_PREFIX . "product` SET size = '" . $this->db->escape($data['size']) . "', model_size = '" . $this->db->escape($product['model'].'-'.$data['size']) . "' WHERE size = '" . $this->db->escape($product['size']) . "' and model = '" . $this->db->escape($product['model']) . "'");
//                
//                }
	}
	
	public function getSize($size_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "size WHERE size_id = '" . (int)$size_id . "'");
		return $query->row;
	}
	
	public function getSizes($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "size";

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
        
	public function getTotalSizes() {
            $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "size");
        return $query->row['total'];
        }
	public function getExitSize($size_id,$name) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "size WHERE size_id!='" . (int)$size_id . "' and  name='".$this->db->escape($name)."'");
        return $query->row['total'];
	}
//        public function getTotalProductsBySizeId() {
//            $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "size");
//        return $query->row['total'];
//        }
        
}
?>