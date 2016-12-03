<?php

class ModelCatalogPriceLevel extends Model {

    public function addPriceLevel($data) {
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "price_level SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int) $data['sort_order'] . "'");
        $price_level_id = $this->db->getLastId();
        if (isset($data['price_level_value'])) {
            foreach ($data['price_level_value'] as  $value) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "price_level_value SET price_level_id = '" . (int) $price_level_id . "', name = '" . $this->db->escape($value['name']) . "', min = '" . (float) $value['min'] . "', max = '" . (float) $value['max'] . "'");
            }
        }
       
    }

    public function editPriceLevel($price_level_id, $data) {

        $this->db->query("UPDATE `" . DB_PREFIX . "price_level` SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int) $data['sort_order'] . "' WHERE price_level_id = '" . (int) $price_level_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "price_level_value WHERE price_level_id = '" . (int) $price_level_id . "'");
        if (isset($data['price_level_value'])) {
            foreach ($data['price_level_value'] as $value) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "price_level_value SET price_level_id = '" . (int) $price_level_id . "', name = '" . $this->db->escape($value['name']) . "', min = '" . (float) $value['min'] . "', max = '" . (float) $value['max'] . "'");
            }
        }
         $this->cache->delete('price_level');
    }

    public function deletePriceLevel($price_level_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "price_level WHERE price_level_id = '" . (int) $price_level_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "price_level_value WHERE price_level_id = '" . (int) $price_level_id . "'");
       

        $this->cache->delete('price_level');
    }

    public function getPriceLevel($price_level_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "price_level WHERE price_level_id='" . (int) $price_level_id . "'");
        return $query->row;
    }
     public function getPriceLevelValue($price_level_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "price_level_value WHERE price_level_id='" . (int) $price_level_id . "'");
        return $query->rows;
    }

    public function getPriceLevels($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "price_level";
		
		$sort_data = array('name');	
		
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

  

    public function getTotalPriceLevelsById($price_level_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "price_level WHERE price_level_id = '" . (int) $$price_level_id. "'");

        return $query->row['total'];
    }

    public function getTotalPriceLevels() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "price_level");

        return $query->row['total'];
    }

}

?>