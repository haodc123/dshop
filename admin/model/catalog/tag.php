<?php

class ModelCatalogTag extends Model {

    public function addTag($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "tag SET  language_id = '" . (int) $this->config->get('config_language_id') . "', name = '" . $this->db->escape($data['name']) . "', keyword = '" . $this->db->escape($data['keyword']) . "', meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "', meta_description = '" . $this->db->escape($data['meta_description']). "', category_id = '" . $this->db->escape($data['category_id']) . "'");
        $tag_id = $this->db->getLastId();

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'tag_id=" . (int) $tag_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }
        $this->cache->delete('tag');
    }

    public function editTag($tag_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "tag SET language_id = '" .(int) $this->config->get('config_language_id') . "', keyword = '" . $this->db->escape($data['keyword']) . "', name = '" . $this->db->escape($data['name']) . "', meta_keyword = '" . $this->db->escape($data['meta_keyword']) . "', meta_description = '" . $this->db->escape($data['meta_description']) . "'WHERE tag_id = '" . (int) $tag_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int) $tag_id . "'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'tag_id=" . (int) $tag_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('tag');
    }

    public function deleteTag($tag_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int) $tag_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int) $tag_id . "'");

        $this->cache->delete('tag');
    }

   		
    public function getTag($tag_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag WHERE language_id = '" . (int) $this->config->get('config_language_id') . "' AND tag_id= '" . (int) $tag_id . "'");
        return $query->row;
    }

    public function getTags($data) {
        $sql = "SELECT * FROM " . DB_PREFIX . "tag WHERE language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sql .= " GROUP BY tag_id ORDER BY name";

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

    public function getTotalTags() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tag");
        return $query->row['total'];
     
    }
     


}

?>