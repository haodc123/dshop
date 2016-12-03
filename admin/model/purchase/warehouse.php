<?php
class ModelPurchaseWarehouse extends Model {
	public function addWarehouse($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "warehouse SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "'");
        $this->cache->delete('warehouse');
	}
	
	public function editWarehouse($warehouse_id, $data) {
      	$this->db->query("UPDATE " . DB_PREFIX . "warehouse SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE warehouse_id = '" . (int)$warehouse_id . "'");
        $this->cache->delete('warehouse');
	}
	
	public function deleteWarehouse($warehouse_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "warehouse WHERE warehouse_id = '" . (int)$warehouse_id . "'");
		$this->cache->delete('warehouse');
	}	
	
	public function getWarehouse($warehouse_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "warehouse WHERE warehouse_id = '" . (int)$warehouse_id . "'");
		return $query->row;
	}
	
	public function getWarehouses($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "warehouse";

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
	

	public function getTotalWarehouses() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "warehouse");
		
		return $query->row['total'];
	}	
}
?>