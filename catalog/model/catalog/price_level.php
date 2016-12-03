<?php

class ModelCatalogPriceLevel extends Model {

    public function getPriceLevel($price_level_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "price_level_value WHERE price_level_id = '" . $price_level_id . "' ");
        return $query->rows;
    }

    public function getPriceText($min, $max) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "price_level_value WHERE min= '" . (float) $min . "' and max='" . (float) $max . "'");
        if ($query->rows) {
            return $query->row['name'];
        } else {
            return false;
        }
    }

}

?>