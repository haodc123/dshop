<?php
class ModelCatalogSupplier extends Model {
	public function addSupplier($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "supplier SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "'");
		
		$supplier_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "supplier SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE supplier_id = '" . (int)$supplier_id . "'");
		}
		
		if (isset($data['supplier_store'])) {
			foreach ($data['supplier_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "supplier_to_store SET supplier_id = '" . (int)$supplier_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
				
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'supplier_id=" . (int)$supplier_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('supplier');
	}
	
	public function editSupplier($supplier_id, $data) {
      	$this->db->query("UPDATE " . DB_PREFIX . "supplier SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE supplier_id = '" . (int)$supplier_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "supplier SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE supplier_id = '" . (int)$supplier_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "supplier_to_store WHERE supplier_id = '" . (int)$supplier_id . "'");

		if (isset($data['supplier_store'])) {
			foreach ($data['supplier_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "supplier_to_store SET supplier_id = '" . (int)$supplier_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
			
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'supplier_id=" . (int)$supplier_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'supplier_id=" . (int)$supplier_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('supplier');
	}
	
	public function deleteSupplier($supplier_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "supplier WHERE supplier_id = '" . (int)$supplier_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "supplier_to_store WHERE supplier_id = '" . (int)$supplier_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'supplier_id=" . (int)$supplier_id . "'");
			
		$this->cache->delete('supplier');
	}	
	
	public function getSupplier($supplier_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'supplier_id=" . (int)$supplier_id . "') AS keyword FROM " . DB_PREFIX . "supplier WHERE supplier_id = '" . (int)$supplier_id . "'");
		return $query->row;
	}
	
	public function getSuppliers($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "supplier";

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
	
	public function getSupplierStores($supplier_id) {
		$supplier_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "supplier_to_store WHERE supplier_id = '" . (int)$supplier_id . "'");

		foreach ($query->rows as $result) {
			$supplier_store_data[] = $result['store_id'];
		}
		
		return $supplier_store_data;
	}
	
	public function getTotalSuppliersByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "supplier WHERE image_id = '" . (int)$image_id . "'");

		return $query->row['total'];
	}

	public function getTotalSuppliers() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "supplier");
		
		return $query->row['total'];
	}	
}
?>