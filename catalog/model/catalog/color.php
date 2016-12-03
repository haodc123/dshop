<?php

class ModelCatalogColor extends Model {
    public function getTotalProducts($data = array()) {
        $sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";

        if (!empty($data['filter_category_id'])) {
            $sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
        }

        $sql .= " WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
        }

        if (!empty($data['filter_price'])) {
            $sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
        }

        if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND p.status = '" . (int) $data['filter_status'] . "'";
        }

        // Loc theo muc gia
        if (isset($data['min']) && isset($data['max'])) {
            if ($data['min'] == 0 && $data['max'] != 0) {
                $sql .= " AND p.price <'" . $data['max'] . "'";
            } else if ($data['max'] == 0 && $data['min'] != 0) {
                $sql .= " AND p.price >'" . $data['min'] . "'";
            } else if ($data['min'] != 0 && $data['max'] != 0) {
                $sql .= " AND p.price >= '" . $data['min'] . "' AND p.price <= '" . $data['max'] . "'";
            }
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getColor() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "color WHERE status=1");
        return $query->rows;
    }
    public function getColorCode($color) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "color WHERE code= '" . $this->db->escape($color) . "'");
        if ($query->num_rows) {
            return array(
                'color_id' => $query->row['color_id'],
                'name' => $query->row['name'],
                'code' => $query->row['code'],
                'color' => $query->row['color'],
                'sort_order' => $query->row['sort_order'],
                'status' => $query->row['status'],
                'language_id' => $query->row['language_id'],
            );
        } else {
            return false;
        }
    }

    public function getSizeCode($size) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "size WHERE code= '" . $this->db->escape($size) . "'");
        if ($query->num_rows) {
            return array(
                'size_id' => $query->row['size_id'],
                'name' => $query->row['name'],
                'code' => $query->row['code'],
                'sort_order' => $query->row['sort_order'],
                'status' => $query->row['status'],
                'language_id' => $query->row['language_id'],
            );
        } else {
            return false;
        }
    }

}

?>