<?php
class ModelWarehouseReceiptNote extends Model {
	public function addReceiptNote($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "receipt_note SET code = '" . $this->db->escape($data['code']) . "', name = '" .$this->db->escape($data['name']). "', price = '" . (float)$data['price'] . "', quantity = '" . (int)$data['quantity'] . "', date = '" . $this->db->escape($data['date']) . "', date_added = NOW()");
		//$receipt_note_id = $this->db->getLastId();
		$this->cache->delete('receipt_note');
	}
	
	public function editReceiptNote($receipt_note_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "receipt_note SET code = '" . $this->db->escape($data['code']) . "', name = '" .$this->db->escape($data['name']). "', price = '" . (float)$data['price'] . "', quantity = '" . (int)$data['quantity'] . "', date = '" . $this->db->escape($data['date']) . "', date_modified = NOW() WHERE receipt_note_id = '" . (int)$receipt_note_id . "'");
                $this->cache->delete('receipt_note');
	}
	
//	public function copyReceiptNote($receipt_note_id) {
//		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "receipt_note p LEFT JOIN " . DB_PREFIX . "receipt_note_description pd ON (p.receipt_note_id = receipt_note_id) WHERE p.receipt_note_id = '" . (int)$receipt_note_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
//		
//		if ($query->num_rows) {
//			$data = array();
//			
//			$data = $query->row;
//			
//			$data['sku'] = '';
//			$data['upc'] = '';
//			$data['viewed'] = '0';
//			$data['keyword'] = '';
//			$data['status'] = '0';
//						
//			$data = array_merge($data, array('receipt_note_attribute' => $this->getReceiptNoteAttributes($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_description' => $this->getReceiptNoteDescriptions($receipt_note_id)));			
//			$data = array_merge($data, array('receipt_note_discount' => $this->getReceiptNoteDiscounts($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_filter' => $this->getReceiptNoteFilters($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_image' => $this->getReceiptNoteImages($receipt_note_id)));		
//			$data = array_merge($data, array('receipt_note_option' => $this->getReceiptNoteOptions($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_related' => $this->getReceiptNoteRelated($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_reward' => $this->getReceiptNoteRewards($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_special' => $this->getReceiptNoteSpecials($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_category' => $this->getReceiptNoteCategories($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_download' => $this->getReceiptNoteDownloads($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_layout' => $this->getReceiptNoteLayouts($receipt_note_id)));
//			$data = array_merge($data, array('receipt_note_store' => $this->getReceiptNoteStores($receipt_note_id)));
//			
//			$this->addReceiptNote($data);
//		}
//	}
	
	public function deleteReceiptNote($receipt_note_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "receipt_note WHERE receipt_note_id = '" . (int)$receipt_note_id . "'");
		$this->cache->delete('receipt_note');
	}
	
	public function getReceiptNote($receipt_note_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "receipt_note WHERE receipt_note_id = '" . (int)$receipt_note_id . "'");
		return $query->row;
	}
	
	public function getReceiptNotes($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "receipt_note";
		
		if (!empty($data['filter_code'])) {
			$sql .= " WHERE code LIKE '" . $this->db->escape($data['filter_code']) . "%'";
                }
                if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
                if (!empty($data['filter_date'])) {
			$sql .= " WHERE date LIKE '" . $this->db->escape($data['filter_date']) . "%'";
		}
		$sql .= " GROUP BY receipt_note_id";
					
		$sort_data = array(
			'code',
			'name',
			'date',
			
		);	
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY code";	
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
        public function getTotalReceiptNotes($data = array()) {
		$sql = "SELECT COUNT(DISTINCT receipt_note_id) AS total FROM " . DB_PREFIX . "receipt_note";

		if (!empty($data['filter_code'])) {
			$sql .= " WHERE code LIKE '" . $this->db->escape($data['filter_code']) . "%'";
                }
                if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
                if (!empty($data['filter_date'])) {
			$sql .= " WHERE date LIKE '" . $this->db->escape($data['filter_date']) . "%'";
		}
                $query = $this->db->query($sql);
		
		return $query->row['total'];
	}
        public function getProducts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
		
		if (!empty($data['filter_model_color'])) {
			$sql .= " WHERE p.model_color LIKE '" . $this->db->escape($data['filter_model_color']) . "%'";
		}       
		$sql .= " GROUP BY p.product_id";
					
		$sort_data = array(
			'p.model_color',
			'pd.name'
                    );	
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY p.model_color";	
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
        public function getManufacturer($manufacturer_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "') AS keyword FROM " . DB_PREFIX . "manufacturer WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");
		
		return $query->row;
	}
	
	
}
?>
