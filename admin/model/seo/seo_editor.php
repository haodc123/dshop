<?php

class ModelSeoSeoEditor extends Model {

//    public function addSeoEditor($data) {
//        $this->db->query("INSERT INTO " . DB_PREFIX . "tag SET  language_id = '" . (int) $this->config->get('config_language_id') . "', name = '" . $this->db->escape($data['name']) . "', keyword = '" . $this->db->escape($data['keyword']) . "', meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "', meta_description = '" . $this->db->escape($data['meta_description']). "', category_id = '" . $this->db->escape($data['category_id']) . "'");
//        $tag_id = $this->db->getLastId();
//
//        if ($data['keyword']) {
//            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'tag_id=" . (int) $tag_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
//        }
//        $this->cache->delete('tag');
//    }
//
//    public function editSeoEditor($tag_id, $data) {
//        $this->db->query("UPDATE " . DB_PREFIX . "tag SET language_id = '" .(int) $this->config->get('config_language_id') . "', keyword = '" . $this->db->escape($data['keyword']) . "', name = '" . $this->db->escape($data['name']) . "', meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "', meta_description = '" . $this->db->escape($data['meta_description']) . "'WHERE tag_id = '" . (int) $tag_id . "'");
//        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int) $tag_id . "'");
//
//        if ($data['keyword']) {
//            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'tag_id=" . (int) $tag_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
//        }
//
//        $this->cache->delete('tag');
//    }
//
//    public function deleteSeoEditor($tag_id) {
//        $this->db->query("DELETE FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int) $tag_id . "'");
//
//        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int) $tag_id . "'");
//
//        $this->cache->delete('tag');
//    }
//
//   		
//    public function getSeoEditor($tag_id) {
//        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' AND tag_id= '" . (int) $tag_id . "'");
//        return $query->row;
//    }

    public function getSeoProduct($product_id) {
        $query = $this->db->query("SELECT DISTINCT p.product_id as product_id, pd2.name as name, pd2.meta_keyword as meta_keyword, pd2.meta_description as meta_description, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query ='product_id=" . (int) $product_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd2 ON (p.product_id = pd2.product_id) WHERE pd2.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.product_id= '" . (int) $product_id . "'");
        if ($query->num_rows){
            return array(
                'type' =>'Product',
                'product_id' => $query->row['product_id'],
                'name' => $query->row['name'],
                'meta_description' => $query->row['meta_description'],
                'meta_keyword' => $query->row['meta_keyword'],
                'keyword' => $query->row['keyword'],
            );
        } else {
            return false;
        }
    }
    public function getSeoTag($tag_id) {
        $query = $this->db->query("SELECT DISTINCT t.tag_id as tag_id, t.name as name, t.meta_keyword as meta_keyword, t.meta_description as meta_description, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query ='tag_id=" . (int) $tag_id . "') AS keyword FROM " . DB_PREFIX . "tag t  WHERE t.language_id = '" . (int) $this->config->get('config_language_id') . "' AND t.tag_id= '" . (int) $tag_id . "'");
        if ($query->num_rows){
            return array(
                'type' =>'Tag',
                'tag_id' => $query->row['tag_id'],
                'name' => $query->row['name'],
                'meta_description' => $query->row['meta_description'],
                'meta_keyword' => $query->row['meta_keyword'],
                'keyword' => $query->row['keyword'],
            );
        } else {
            return false;
        }
    }
     public function getSeoCategory($category_id) {
        $query = $this->db->query("SELECT DISTINCT c.category_id as category_id, cd2.name as name, cd2.meta_keyword as meta_keyword, cd2.meta_description as meta_description, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query ='category_id=" . (int) $category_id . "') AS keyword FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE cd2.language_id = '" . (int) $this->config->get('config_language_id') . "' AND c.category_id= '" . (int) $category_id . "'");
        if ($query->num_rows){
            return array(
                'type' =>'Category',
                'category_id' => $query->row['category_id'],
                'name' => $query->row['name'],
                'meta_description' => $query->row['meta_description'],
                'meta_keyword' => $query->row['meta_keyword'],
                'keyword' => $query->row['keyword'],
            );
        } else {
            return false;
        }
    }
    public function getSeoProducts($data) {
        $sql =" SELECT DISTINCT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd2 ON (p.product_id = pd2.product_id) WHERE  pd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
         if (!empty($data['filter_name'])) {
            $sql .= " AND pd2.name='" . $data['filter_name'] . "'";
        }
//         if (!empty($data['filter_keyword'])) {
//            $sql .= " AND pd2.keyword='" . $data['filter_keyword'] . "'";
//        }
         if (!empty($data['filter_meta_keyword'])) {
            $sql .= " AND pd2.meta_keyword='" . $data['filter_meta_keyword'] . "'";
        }
         if (!empty($data['filter_meta_description'])) {
            $sql .= " AND pd2.meta_description='" . $data['filter_meta_description'] . "'";
        }
        $sql .= " GROUP BY product_id";
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }
            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }
         $product_data = array();

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->getSeoProduct($result['product_id']);
        }
        return $product_data;
    
    }
    
    public function getSeoCategories($data) {
        $sql =" SELECT DISTINCT c.category_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE  cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
         if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name='" . $data['filter_name'] . "'";
        }
//         if (!empty($data['filter_keyword'])) {
//            $sql .= " AND cd2.keyword='" . $data['filter_keyword'] . "'";
//        }
         if (!empty($data['filter_meta_keyword'])) {
            $sql .= " AND cd2.meta_keyword='" . $data['filter_meta_keyword'] . "'";
        }
         if (!empty($data['filter_meta_description'])) {
            $sql .= " AND cd2.meta_description='" . $data['filter_meta_description'] . "'";
        }
        
        $sql .= " GROUP BY c.category_id";
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }
        $category_data = array();
        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $category_data[$result['category_id']] = $this->getSeoCategory($result['category_id']);
        }
        return $category_data;
    
    }
    
    public function getSeoTags($data) {
        
        $sql =" SELECT DISTINCT t.tag_id FROM " . DB_PREFIX . "tag t WHERE  t.language_id = '" . (int)$this->config->get('config_language_id') . "'";
          if (!empty($data['filter_name'])) {
            $sql .= " AND t.name='" . $data['filter_name'] . "'";
        }
         if (!empty($data['filter_keyword'])) {
            $sql .= " AND t.keyword='" . $data['filter_keyword'] . "'";
        }
         if (!empty($data['filter_meta_keyword'])) {
            $sql .= " AND t.meta_keyword='" . $data['filter_meta_keyword'] . "'";
        }
         if (!empty($data['filter_meta_description'])) {
            $sql .= " AND t.meta_description='" . $data['filter_meta_description'] . "'";
        }
        
        $sql .= " GROUP BY tag_id";
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }
        $category_data = array();
        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $category_data[$result['tag_id']] = $this->getSeoTag($result['tag_id']);
        }
        return $category_data;
    
    }
    
      public function getTotalSeoEditors() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tag");
        return $query->row['total'];
     
    }
    public function getTotalSeoCategories($data) {
        $sql ="SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE  cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $sql .= " GROUP BY c.category_id";
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
        return $query->row['total'];  
    }
    public function getTotalSeoProducts($data) {
        $sql ="SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd2 ON (p.product_id = pd2.product_id) WHERE  pd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $sql .= " GROUP BY p.product_id";
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
        return $query->row['total'];  
    }
    public function getTotalSeoTags($data) {
        $sql ="SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "tag t WHERE  t.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $sql .= " GROUP BY t.tag_id";
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
        return $query->row['total'];  
    }
}

?>