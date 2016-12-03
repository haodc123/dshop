<?php

class ModelPurchaseDelivery extends Model {

    public function getProduct($product_id) {
        $query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'");
        if ($query->num_rows) {
            return array(
                'product_id' => $query->row['product_id'],
                'name' => $query->row['name'],
                'model' => $query->row['model'],
                'color' => $query->row['color'],
                'size' => $query->row['size'],
                'mc' => $query->row['mc'],
                'mcs' => $query->row['mcs'],
                'quantity' => $query->row['quantity'],
                'image' => $query->row['image'],
                'price' => $query->row['price'],
                'sort_order' => $query->row['sort_order'],
                'status' => $query->row['status'],
                'display' => $query->row['display'],
                'date_added' => $query->row['date_added'],
                'date_modified' => $query->row['date_modified'],
               
            );
        } else {
            return false;
        }
    }
    
    public function addDelivery($data) {
     
        $this->db->query("INSERT INTO `" . DB_PREFIX . "purchase` SET reference_no = '" . $this->db->escape($data['reference_no']) . "', warehouse_id = '" . (int) $data['warehouse_id'] . "', supplier_id = '" . (int) $data['supplier_id'] . "', supplier = '" . $this->db->escape($data['supplier']) . "', note= '" . $this->db->escape($data['note']) . "', total = '" . (float) $data['total'] . "', quantity = '" . (int) $data['total_quantity'] . "', language_id='" . (int) $this->config->get('config_language_id') . "', date_added= '" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['date_added'])? str_replace('/','-', $data['date_added']): $data['date_added']))) . "', ip='".  $this->db->escape($this->request->server['REMOTE_ADDR']). "', user_id='".  $this->user->getId() . "', status =0, receipt_delivery ='delivery', date_modified = NOW()");
        $purchase_id = $this->db->getLastId();
        if (isset($data['purchase_product'])) {
            foreach ($data['purchase_product'] as $purchase_product) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product SET purchase_id = '" . (int) $purchase_id . "', product_id = '" . (int) $purchase_product['product_id'] . "', name = '" . $this->db->escape($purchase_product['name']) . "', mcs = '" . $this->db->escape($purchase_product['mcs']) . "', mc = '" . $this->db->escape($purchase_product['mc']) . "', color = '" . $this->db->escape($purchase_product['color']) . "', size = '" . $this->db->escape($purchase_product['size']) . "', model = '" . $this->db->escape($purchase_product['model']) . "', quantity = '" . (int) $purchase_product['quantity'] . "', price = '" . (float) $purchase_product['price'] . "', total = '" . (float) $purchase_product['total'] . "'");
             }
        }
    }
    public function editDelivery($purchase_id, $data) {
        // Restock products before subtracting the stock later on
        $this->db->query("UPDATE `" . DB_PREFIX . "purchase` SET date_added= '" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['date_added'])? str_replace('/','-', $data['date_added']): $data['date_added']))) . "', reference_no = '" . $this->db->escape($data['reference_no']) . "', note = '" . $this->db->escape($data['note']) . "', warehouse_id = '" . (int) $data['warehouse_id'] . "', supplier = '" . $this->db->escape($data['supplier']) . "', supplier_id = '" . $this->db->escape($data['supplier_id']) . "', total = '" . (float) $data['total'] . "', quantity = '" . (float) $data['total_quantity'] . "', date_modified = NOW() WHERE purchase_id = '" . (int) $purchase_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = '" . (int) $purchase_id . "'");

        if (isset($data['purchase_product'])) {

            foreach ($data['purchase_product'] as $purchase_product) {

                $this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product SET purchase_id = '" . (int) $purchase_id . "', product_id = '" . (int) $purchase_product['product_id'] . "', name = '" . $this->db->escape($purchase_product['name']) . "', mc = '" . $this->db->escape($purchase_product['mc']) . "', mcs = '" . $this->db->escape($purchase_product['mcs']) . "', color = '" . $this->db->escape($purchase_product['color']) . "', size = '" . $this->db->escape($purchase_product['size']) . "', model = '" . $this->db->escape($purchase_product['model']) . "', quantity = '" . (int) $purchase_product['quantity'] . "', price = '" . (float) $purchase_product['price'] . "', total = '" . (float) $purchase_product['total'] . "'");
            }
        }
    }
    public function comfirmDelivery($purchase_id) {
        $purchase_products = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = '" . (int) $purchase_id . "'");
        
        if ($purchase_products->num_rows) {
            foreach ($purchase_products->rows as $purchase_product) {
                $this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity -" . (int) $purchase_product['quantity'] . ") WHERE product_id = '" . (int) $purchase_product['product_id'] . "'");
            }
        }
        $this->db->query("UPDATE `" . DB_PREFIX . "purchase` SET status=1 WHERE purchase_id='" . (int) $purchase_id . "'");
    }

    public function deleteDelivery($purchase_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "purchase` WHERE purchase_id = '" . (int) $purchase_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = '" . (int) $purchase_id . "'");
     }

    public function getDelivery($purchase_id) {
        $purchase_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase WHERE purchase_id = '" . (int) $purchase_id . "'");
        if ($purchase_query->num_rows) {
            return array(
                'purchase_id' => $purchase_query->row['purchase_id'],
                'reference_no' => $purchase_query->row['reference_no'],
                'warehouse_id' => $purchase_query->row['warehouse_id'],
                'supplier' => $purchase_query->row['supplier'],
                'supplier_id' => $purchase_query->row['supplier_id'],
                'note' => $purchase_query->row['note'],
                'quantity' => $purchase_query->row['quantity'],
                'total' => $purchase_query->row['total'],
                'date_added' => $purchase_query->row['date_added'],
                'date_modified' => $purchase_query->row['date_modified']
            );
        } else {
            return false;
        }
    }
    public function getDeliveries($data = array()) {
        
        $sql = "SELECT DISTINCT * FROM " . DB_PREFIX . "purchase WHERE  status=0 AND receipt_delivery='delivery' AND language_id='" . (int) $this->config->get('config_language_id') . "'";
        if (!empty($data['filter_purchase_id'])) {
            $sql .= " AND purchase_id = '" . (int) $data['filter_purchase_id'] . "'";
        }
        if (!empty($data['filter_quantity'])) {
            $sql .= " AND quantity = '" . (int) $data['filter_quantity'] . "'";
        }
        if (!empty($data['filter_reference_no'])) {
            $sql .= " AND reference_no LIKE '%" . $this->db->escape($data['filter_reference_no']) . "%'";
        }
        if (!empty($data['filter_supplier'])) {
            $sql .= " AND supplier_id = '" . $this->db->escape($data['filter_supplier']) . "'";
        }
        if (!empty($data['filter_warehouse'])) {
            $sql .= " AND warehouse_id = '" . $this->db->escape($data['filter_warehouse']) . "'";
        }
        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(date_added) = DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_added'])? str_replace('/','-', $data['filter_date_added']): $data['filter_date_added']))) . "')";
        }

        if (!empty($data['filter_date_modified'])) {
            $sql .= " AND DATE(date_modified) =  DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_modified'])? str_replace('/','-', $data['filter_date_modified']): $data['filter_date_modified']))) . "')";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(date_added) >= DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_start'])? str_replace('/','-', $data['filter_date_start']): $data['filter_date_start']))) . "')";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(date_added) <= DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_end'])? str_replace('/','-', $data['filter_date_end']): $data['filter_date_end']))) . "')";
        }
        if (!empty($data['filter_total'])) {
            $sql .= " AND total = '" . (float) $data['filter_total'] . "'";
        }
       $sql .= " GROUP BY purchase_id";
          $sort_data = array(
            'purchase_id',
            'reference_no',
            'date_added',
            'date_modified',
            'quantity',
            'total',
         );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY purchase_id";
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

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalDeliveries($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "purchase`  WHERE language_id='" . (int) $this->config->get('config_language_id') . "'";

         if (!empty($data['filter_purchase_id'])) {
            $sql .= " AND purchase_id = '" . (int) $data['filter_purchase_id'] . "'";
        }
        if (!empty($data['filter_quantity'])) {
            $sql .= " AND quantity = '" . (int) $data['filter_quantity'] . "'";
        }
        if (!empty($data['filter_reference_no'])) {
            $sql .= " AND reference_no LIKE '%" . $this->db->escape($data['filter_reference_no']) . "%'";
        }
        if (!empty($data['filter_supplier'])) {
            $sql .= " AND supplier_id = '" . $this->db->escape($data['filter_supplier']) . "'";
        }
        if (!empty($data['filter_warehouse'])) {
            $sql .= " AND warehouse_id = '" . $this->db->escape($data['filter_warehouse']) . "'";
        }
        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(date_added) = DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_added'])? str_replace('/','-', $data['filter_date_added']): $data['filter_date_added']))) . "')";
        }
        
        if (!empty($data['filter_date_modified'])) {
            $sql .= " AND DATE(date_modified) =  DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_modified'])? str_replace('/','-', $data['filter_date_modified']): $data['filter_date_modified']))) . "')";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(date_added) >= DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_start'])? str_replace('/','-', $data['filter_date_start']): $data['filter_date_start']))) . "')";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(date_added) <= DATE('" . $this->db->escape(date('Y-m-d',strtotime(str_replace('/','-', $data['filter_date_end'])? str_replace('/','-', $data['filter_date_end']): $data['filter_date_end']))) . "')";
        }
        if (!empty($data['filter_total'])) {
            $sql .= " AND total = '" . (float) $data['filter_total'] . "'";
        }
         
        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getDeliveryProducts($purchase_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = '" . (int) $purchase_id . "'");

        return $query->rows;
    }

    public function getTotalDate($date_added) {

        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "purchase WHERE date_added = '" . $this->db->escape($date_added) . "'");

        return $query->row['total'] + 1;
    }

    public function getSupplier($supplier_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "supplier WHERE supplier_id = '" . (int) $supplier_id . "'");
        return $query->row ? $query->row : "";
    }

    public function getTotalProductsByWarehouseId($warehouse_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "purchase WHERE warehouse_id = '" . (int) $warehouse_id . "'");
        return $query->row['total'];
    }

    public function getDeliveryOptions($purchase_id, $purchase_product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_option WHERE purchase_id = '" . (int) $purchase_id . "' AND purchase_product_id = '" . (int) $purchase_product_id . "'");
        return $query->rows;
    }

    public function getProductBarcode($mcs) {

        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product  WHERE mcs = '" . $this->db->escape($mcs) . "' AND status = '1'");

        if ($query->num_rows) {
            return array(
                'product_id' => $query->row['product_id'],
                'quantity' => $query->row['quantity'],
            );
        } else {
            return false;
        }
    }

}
?>