<?php

class ControllerCheckoutOrder extends Controller {

    public function index() {
        // Validate cart has products and has stock.
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $this->redirect($this->url->link('checkout/cart'));
        }
        if (!isset($this->session->data['payment_address_id']) || !isset($this->session->data['shipping_address_id']) || !isset($this->session->data['shipping_method'])) {
            $this->redirect($this->url->link('checkout/checkout'));
        }
        $this->language->load('checkout/checkout');
        $this->load->model('account/address');
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_cart'),
            'href' => $this->url->link('checkout/cart'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('checkout/checkout', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_payment_method'] = $this->language->get('text_payment_method');
        $this->data['text_size'] = $this->language->get('text_size');
        $this->data['text_quantity'] = $this->language->get('text_quantity');
        $this->data['text_color'] = $this->language->get('text_color');
        $this->data['text_product_code'] = $this->language->get('text_product_code');
        $this->data['text_checkout_shipping_address'] = $this->language->get('text_checkout_shipping_address');
        $this->data['text_checkout_payment_method'] = $this->language->get('text_checkout_payment_method');




        //Address detail
        $this->load->model('checkout/address');

        $this->data['button_edit_cart'] = $this->url->link('checkout/cart');
        $this->data['button_edit_address'] = $this->url->link('checkout/checkout');

        $payment_address_info = $this->model_checkout_address->getAddress($this->session->data['payment_address_id']);

        if ($payment_address_info) {
            $this->data['payment_firstname'] = $payment_address_info['firstname'];
        } else {
            $this->data['payment_firstname'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_lastname'] = $payment_address_info['lastname'];
        } else {
            $this->data['payment_lastname'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_address_1'] = $payment_address_info['address_1'];
        } else {
            $this->data['payment_address_1'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_address_2'] = $payment_address_info['address_2'];
        } else {
            $this->data['payment_address_2'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_country'] = $payment_address_info['country'];
        } else {
            $this->data['payment_country'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_country_id'] = $payment_address_info['country_id'];
        } else {
            $this->data['payment_country_id'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_postcode'] = $payment_address_info['postcode'];
        } else {
            $this->data['payment_postcode'] = '';
        }

        if ($payment_address_info) {
            $this->data['payment_city'] = $payment_address_info['city'];
        } else {
            $this->data['payment_city'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_city'] = $payment_address_info['city'];
        } else {
            $this->data['payment_city'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_zone_id'] = $payment_address_info['zone_id'];
        } else {
            $this->data['payment_zone_id'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_zone'] = $payment_address_info['zone'];
        } else {
            $this->data['payment_zone'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_phone'] = $this->customer->getTelephone();
        } else {
            $this->data['payment_phone'] = '';
        }
        if ($payment_address_info) {
            $this->data['payment_email'] = $this->customer->getEmail();
        } else {
            $this->data['payment_email'] = '';
        }

        $shipping_address_info = $this->model_checkout_address->getAddress($this->session->data['shipping_address_id']);
        if ($shipping_address_info) {
            $this->data['shipping_firstname'] = $shipping_address_info['firstname'];
        } else {
            $this->data['shipping_firstname'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_lastname'] = $shipping_address_info['lastname'];
        } else {
            $this->data['shipping_lastname'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_address_1'] = $shipping_address_info['address_1'];
        } else {
            $this->data['shipping_address_1'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_address_2'] = $shipping_address_info['address_2'];
        } else {
            $this->data['shipping_address_2'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_country'] = $shipping_address_info['country'];
        } else {
            $this->data['shipping_country'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_country_id'] = $shipping_address_info['country_id'];
        } else {
            $this->data['shipping_country_id'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_postcode'] = $shipping_address_info['postcode'];
        } else {
            $this->data['shipping_postcode'] = '';
        }

        if ($shipping_address_info) {
            $this->data['shipping_city'] = $shipping_address_info['city'];
        } else {
            $this->data['shipping_city'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_city'] = $shipping_address_info['city'];
        } else {
            $this->data['shipping_city'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_zone_id'] = $shipping_address_info['zone_id'];
        } else {
            $this->data['shipping_zone_id'] = '';
        }
        if ($shipping_address_info) {
            $this->data['shipping_zone'] = $shipping_address_info['zone'];
        } else {
            $this->data['shipping_zone'] = '';
        }


        //End address detail
        // your cart summary
        $this->load->model('tool/image');

        $this->data['products'] = array();

        $products = $this->cart->getProducts();

        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $this->data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
            }

            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
            } else {
                $image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
            }

            $option_data = array();
            foreach ($product['option'] as $option) {
                if ($option['type'] != 'file') {
                    $value = $option['option_value'];
                } else {
                    $filename = $this->encryption->decrypt($option['option_value']);

                    $value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
                }

                $option_data[] = array(
                    'name' => $option['name'],
                    'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                );
            }

            // Display prices
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            // Display prices
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
            } else {
                $total = false;
            }

            $this->data['products'][] = array(
                'key' => $product['key'],
                'thumb' => $image,
                'name' => $product['name'],
                'color' => $product['color'],
                'size' => $product['size'],
                'model' => $product['model'],
                'mc' => $product['mc'],
                'mcs' => $product['mcs'],
                'option' => $option_data,
                'quantity' => $product['quantity'],
                'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                'reward' => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                'price' => $price,
                'total' => $total,
                'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                'remove' => $this->url->link('checkout/cart', 'remove=' . $product['key'])
            );
        }
        /* end your card sumarry */

        /* start totals */
        // Totals
        $this->load->model('setting/extension');

        $total_data = array();
        $total = 0;
        $taxes = $this->cart->getTaxes();

        // Display prices
        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
            $sort_order = array();

            $results = $this->model_setting_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('total/' . $result['code']);

                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                }

                $sort_order = array();

                foreach ($total_data as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $total_data);
            }
        }

        $this->data['totals'] = $total_data;
        /* end totals */


        // Payment method
            if (!isset($this->session->data['payment_method'])) {
                $json['error']['warning'] = $this->language->get('error_payment');
            } elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
                $json['error']['warning'] = $this->language->get('error_payment');
            }

            if ($this->config->get('config_checkout_id')) {
                $this->load->model('catalog/information');

                $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

                if ($information_info && !isset($this->request->post['agree'])) {
                    $json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
                }else{
                    $this->session->data['agree']=$this->request->post['agree'];
                }
            }
        // Payment method
        $payment_address = $this->model_checkout_address->getAddress($this->session->data['payment_address_id']);
        if (!empty($payment_address)) {
            // Totals
//            $total_data = array();
//            $total = 0;
//            $taxes = $this->cart->getTaxes();
//
//            $this->load->model('setting/extension');
//
//            $sort_order = array();
//
//            $results = $this->model_setting_extension->getExtensions('total');
//
//            foreach ($results as $key => $value) {
//                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
//            }
//
//            array_multisort($sort_order, SORT_ASC, $results);
//
//            foreach ($results as $result) {
//                if ($this->config->get($result['code'] . '_status')) {
//                    $this->load->model('total/' . $result['code']);
//
//                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
//                }
//            }
//            // Payment Methods
            $method_data = array();

            $this->load->model('setting/extension');

            $results = $this->model_setting_extension->getExtensions('payment');

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('payment/' . $result['code']);

                    $method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);

                    if ($method) {
                        $method_data[$result['code']] = $method;
                    }
                }
            }

            $sort_order = array();

            foreach ($method_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $method_data);

            $this->session->data['payment_methods'] = $method_data;

            if (isset($this->session->data['payment_methods'])) {
                $this->data['payment_methods'] = $this->session->data['payment_methods'];
            } else {
                $this->data['payment_methods'] = array();
            }

            if (isset($this->session->data['payment_method']['code'])) {
                $this->data['payment_code'] = $this->session->data['payment_method']['code'];
            } else {
                $this->data['payment_code'] = '';
            }
        }

        //$this->data['payment'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/order.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/order.tpl';
        } else {
            $this->template = 'default/template/checkout/order.tpl';
        }
        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

}

?>