<?php

class ControllerModuleCategoryProduct extends Controller {

    protected function index($setting) {
        $this->language->load('module/category_product');
        $this->data['heading_title'] = $setting['name'];

        $this->data['button_cart'] = $this->language->get('button_cart');
        $this->data['text_model'] = $this->language->get('text_model');
        $this->load->model('catalog/product');

        $this->load->model('tool/image');
        $this->data['products'] = array();
        
      //  $this->data['image_width'] = $setting['image_width'];
     //   $this->data['image_height'] = $setting['image_height'];
       $this->data['seemore']=$this->url->link('product/category','&path=' . $setting['category_id']);
        if (empty($setting['limit'])) {
            $setting['limit'] = 5;
        }
        $data = array(
            'filter_category_id' => $setting['category_id'],
            'start' => 0,
            'limit' => $setting['limit']
        );
        $results = $this->model_catalog_product->getProducts($data);
        foreach ($results as $result) {
         if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float) $result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            if ($this->config->get('config_tax')) {
                $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price']);
            } else {
                $tax = false;
            }

            if ($this->config->get('config_review_status')) {
                $rating = (int) $result['rating'];
            } else {
                $rating = false;
            }

            $this->data['products'][] = array(
                'product_id' => $result['product_id'],
                'model' => $result['model'],
                'thumb' => $image,
                'name' => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'price' => $price,
                'special' => $special,
                'tax' => $tax,
                'rating' => $result['rating'],
                'reviews' => sprintf($this->language->get('text_reviews'), (int) $result['reviews']),
                'href' => $this->url->link('product/product','&product_id=' . $result['product_id'])
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category_product.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/category_product.tpl';
        } else {
            $this->template = 'default/template/module/category_product.tpl';
        }

        $this->render();
    }

}

?>