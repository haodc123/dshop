<?php

class Receipt {
    private $config;
    private $db;
    private $data = array();

    public function __construct($registry) {
        $this->config = $registry->get('config');
        $this->session = $registry->get('session');
        $this->db = $registry->get('db');
        if (!isset($this->session->data['receipt']) || !is_array($this->session->data['receipt'])) {
            $this->session->data['receipt'] = array();
        }
    }

    public function getProducts() {
        if (!$this->data) {
            foreach ($this->session->data['receipt'] as $key => $quantity) {
                $product = explode(':', $key);
                $product_id = $product[0];
                $stock = true;
                // Options
                if (isset($product[1])) {
                    $options = unserialize(base64_decode($product[1]));
                } else {
                    $options = array();
                }
                $product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
                if ($product_query->num_rows) {
                    $price = $product_query->row['price'];
                    //Color
                    $color_query = $this->db->query("SELECT name FROM " . DB_PREFIX . "color WHERE code='" . $product_query->row['color'] . "'");
                    if ($color_query->num_rows) {
                        $color = $color_query->row['name'];
                    } else {
                        $color = '';
                    }
                    $size_query = $this->db->query("SELECT name FROM " . DB_PREFIX . "size WHERE code='" . $product_query->row['size'] . "'");
                    if ($size_query->num_rows) {
                        $size = $size_query->row['name'];
                    } else {
                        $size = '';
                    }
                    $this->data[$key] = array(
                        'key' => $key,
                        'product_id' => $product_query->row['product_id'],
                        'name' => $product_query->row['name'],
                        'model' => $product_query->row['model'],
                        'color' => $color,
                        'size' => $size,
                        'mc' => $product_query->row['mc'],
                        'mcs' => $product_query->row['mcs'],
                      //  'shipping' => $product_query->row['shipping'],
                        'image' => $product_query->row['image'],
                        'quantity' => $quantity,
                        'minimum' => $product_query->row['minimum'],
                        'subtract' => $product_query->row['subtract'],
                        'stock' => $stock,
                        'price' => $price,
                        'total' => $price* $quantity,
                        
                    );
                } else {
                    $this->remove($key);
                }
            }
        }

        return $this->data;
    }

    public function add($product_id, $qty = 1, $option = array()) {
        if (!$option) {
            $key = (int) $product_id;
        } else {
            $key = (int) $product_id . ':' . base64_encode(serialize($option));
        }

        if ((int) $qty && ((int) $qty > 0)) {
            if (!isset($this->session->data['receipt'][$key])) {
                $this->session->data['receipt'][$key] = (int) $qty;
            } else {
                $this->session->data['receipt'][$key] += (int) $qty;
            }
        }

        $this->data = array();
        return true;
    }

    public function update($key, $qty) {
        if ((int) $qty && ((int) $qty > 0)) {
            $this->session->data['receipt'][$key] = (int) $qty;
        } else {
            $this->remove($key);
        }

        $this->data = array();
    }

    public function remove($key) {
        if (isset($this->session->data['receipt'][$key])) {
            unset($this->session->data['receipt'][$key]);
        }

        $this->data = array();
    }

    public function clear() {
        $this->session->data['receipt'] = array();
        $this->data = array();
    }
   public function getSubTotal() {
        $total = 0;

        foreach ($this->getProducts() as $product) {
            $total += $product['total'];
        }
        return $total;
    }

    public function getTotal() {
        $total = 0;

        foreach ($this->getProducts() as $product) {
            $total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
        }

        return $total;
    }

    public function countProducts() {
        $product_total = 0;

        $products = $this->getProducts();

        foreach ($products as $product) {
            $product_total += $product['quantity'];
        }

        return $product_total;
    }

    public function hasProducts() {
        return count($this->session->data['receipt']);
    }

    public function hasStock() {
        $stock = true;

        foreach ($this->getProducts() as $product) {
            if (!$product['stock']) {
                $stock = false;
            }
        }

        return $stock;
    }

    public function hasShipping() {
        $shipping = false;

        foreach ($this->getProducts() as $product) {
            if ($product['shipping']) {
                $shipping = true;

                break;
            }
        }

        return $shipping;
    }
}

?>