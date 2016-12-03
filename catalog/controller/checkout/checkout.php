<?php

class ControllerCheckoutCheckout extends Controller {

    public function index() {
        // Validate if customer is logged in.
        if (!$this->customer->isLogged()) {
            $this->redirect($this->url->link('account/login'));
        }
        // Validate cart has products and has stock.
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $this->redirect($this->url->link('checkout/cart'));
        }
          unset($this->session->data['shipping_method']);
          unset($this->session->data['shipping_methods']);
          unset($this->session->data['payment_method']);
          unset($this->session->data['payment_methods']);
          unset($this->session->data['reward']);
        $this->language->load('checkout/checkout');

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
        $this->document->setTitle($this->language->get('heading_title'));

        // Text
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_product'] = $this->language->get('text_product');
        $this->data['text_product_code'] = $this->language->get('text_product_code');
        $this->data['text_item'] = $this->language->get('text_item');
        $this->data['text_color'] = $this->language->get('text_color');
        $this->data['text_size'] = $this->language->get('text_size');
        $this->data['text_quantity'] = $this->language->get('text_quantity');
        $this->data['text_existing'] = $this->language->get('text_existing');
        $this->data['text_checkout_option'] = $this->language->get('text_checkout_option');
        $this->data['text_checkout_checkout'] = $this->language->get('text_checkout_checkout');
        $this->data['text_checkout_your_cart'] = $this->language->get('text_checkout_your_cart');
        $this->data['text_edit_cart'] = $this->language->get('text_edit_cart');
        $this->data['text_checkout_payment_address'] = $this->language->get('text_checkout_payment_address');
        $this->data['text_checkout_shipping_address'] = $this->language->get('text_checkout_shipping_address');
        $this->data['text_checkout_shipping_method'] = $this->language->get('text_checkout_shipping_method');
        $this->data['text_checkout_payment_method'] = $this->language->get('text_checkout_payment_method');
        $this->data['text_checkout_confirm'] = $this->language->get('text_checkout_confirm');
        $this->data['text_payment_note'] = $this->language->get('text_payment_note');
        $this->data['text_modify'] = $this->language->get('text_modify');
        $this->data['text_address_edit'] = $this->language->get('text_address_edit');
        $this->data['text_address_existing'] = $this->language->get('text_address_existing');
        $this->data['text_address_new'] = $this->language->get('text_address_new');
        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_payment_method'] = $this->language->get('text_payment_method');
        $this->data['text_shipping_method'] = $this->language->get('text_shipping_method');

        // Entry
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_company'] = $this->language->get('entry_company');
        $this->data['entry_company_id'] = $this->language->get('entry_company_id');
        $this->data['entry_tax_id'] = $this->language->get('entry_tax_id');
        $this->data['entry_address_1'] = $this->language->get('entry_address_1');
        $this->data['entry_address_2'] = $this->language->get('entry_address_2');
        $this->data['entry_postcode'] = $this->language->get('entry_postcode');
        $this->data['entry_city'] = $this->language->get('entry_city');
        $this->data['entry_country'] = $this->language->get('entry_country');
        $this->data['entry_phone'] = $this->language->get('entry_phone');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_zone'] = $this->language->get('entry_zone');

        $this->data['shipping_required'] = $this->cart->hasShipping();
        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_order'] = $this->url->link('checkout/order');
        $this->data['button_edit_cart'] = $this->url->link('checkout/cart');
        
        // your cart summary
        $this->load->model('tool/image');
        $this->data['products'] = array();
        $products = $this->cart->getProducts();
        
        foreach ($products as $product) {

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
                'mc' => $product['mc'],
                'mcs' => $product['mcs'],
                'color' => $product['color'],
                'size' => $product['size'],
                'model' => $product['model'],
                'option' => $option_data,
                'quantity' => $product['quantity'],
                'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                'reward' => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                'price' => $price,
                'total' => $total,
                'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
            );
        }
        // End your card summary
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

        
        // Get payment address
        $this->load->model('checkout/address');
        $payment_address_info = $this->model_checkout_address->getAddress($this->customer->getAddressId());
        if ($payment_address_info) {
            $this->data['payment_address_id'] = $payment_address_info['address_id'];
            $this->data['payment_firstname']  = $payment_address_info['firstname'];
            $this->data['payment_lastname']   = $payment_address_info['lastname'];
            $this->data['payment_address_1']  = $payment_address_info['address_1'];
            $this->data['payment_address_2']  = $payment_address_info['address_2'];
            $this->data['payment_country']    = $payment_address_info['country'];
            $this->data['payment_country_id'] = $payment_address_info['country_id'];
            $this->data['payment_postcode']   = $payment_address_info['postcode'];
            $this->data['payment_city']       = $payment_address_info['city'];
            $this->data['payment_zone_id']    = $payment_address_info['zone_id'];
            $this->data['payment_zone']       = $payment_address_info['zone'];
            $this->data['payment_telephone'] = $this->customer->getTelephone();
            $this->session->data['payment_address_id']=$this->customer->getAddressId();
        } 

        // Shipping address
        $this->data['shipping_addresses'] = array();
        $this->data['shipping_addresses'] = $this->model_checkout_address->getShippingAddresses($this->customer->getAddressId());
        $this->data['shipping_address_id'] =$this->customer->getAddressId();
        $this->session->data['shipping_address_id']=$this->customer->getAddressId();
        
        $shipping_address = $this->model_checkout_address->getAddress($this->customer->getAddressId());
        if (!empty($shipping_address)) {
            // Shipping Methods
            $quote_data = array();

            $this->load->model('setting/extension');

            $results = $this->model_setting_extension->getExtensions('shipping');

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('shipping/' . $result['code']);

                    $quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address);

                    if ($quote) {
                        $quote_data[$result['code']] = array(
                            'title' => $quote['title'],
                            'quote' => $quote['quote'],
                            'sort_order' => $quote['sort_order'],
                            'error' => $quote['error']
                        );
                    }
                }
            }

            $sort_order = array();

            foreach ($quote_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $quote_data);

            $this->session->data['shipping_methods'] = $quote_data;

            if (isset($this->session->data['shipping_methods'])) {
                $this->data['shipping_methods'] = $this->session->data['shipping_methods'];
            } else {
                $this->data['shipping_methods'] = array();
            }
            if (isset($this->session->data['shipping_method']['code'])) {
                $this->data['shipping_code'] = $this->session->data['shipping_method']['code'];
            } else {
                $this->data['shipping_code'] = '';
            }
            
        }
        
        if ($this->config->get('config_checkout_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
            if ($information_info) {
                $this->data['text_agree'] = $this->language->get('text_agree');
                $this->data['href'] = $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL');
                $this->data['title'] = $information_info['title'];
            } else {
                $this->data['text_agree'] = '';
            }
        } else {
            $this->data['text_agree'] = '';
        }
        if (isset($this->session->data['agree'])) {
            $this->data['agree'] = $this->session->data['agree'];
        } else {
            $this->data['agree'] = '';
        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/checkout.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/checkout.tpl';
        } else {
            $this->template = 'default/template/checkout/checkout.tpl';
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

    public function validate() {
        $json = array();
        $this->language->load('checkout/checkout');
        

            $this->load->model('account/address');

          if (empty($this->request->post['payment_address_id'])) {
               
                $json['error']['warning'] = $this->language->get('error_address');
            } elseif (!in_array($this->request->post['payment_address_id'], array_keys($this->model_account_address->getAddresses()))) {
                
                $json['error']['warning'] = $this->language->get('error_address');
            } else {
                // Default Payment Address

                $address_info = $this->model_account_address->getAddress($this->request->post['payment_address_id']);
                if ($address_info) {
                    $this->load->model('account/customer_group');

                    $customer_group_info = $this->model_account_customer_group->getCustomerGroup($this->customer->getCustomerGroupId());
                    // Company ID
                    if ($customer_group_info['company_id_display'] && $customer_group_info['company_id_required'] && !$address_info['company_id']) {
                        $json['error']['warning'] = $this->language->get('error_company_id');
                    }
                    // Tax ID
                    if ($customer_group_info['tax_id_display'] && $customer_group_info['tax_id_required'] && !$address_info['tax_id']) {
                        $json['error']['warning'] = $this->language->get('error_tax_id');
                    }
                }
                if (!$json) {
                    $this->session->data['payment_address_id'] = $this->request->post['payment_address_id'];

                    if ($address_info) {
                        $this->session->data['payment_country_id'] = $address_info['country_id'];
                        $this->session->data['payment_zone_id'] = $address_info['zone_id'];
                    } else {
                        unset($this->session->data['payment_country_id']);
                        unset($this->session->data['payment_zone_id']);
                    }

                  //  unset($this->session->data['payment_method']);
                    //unset($this->session->data['payment_methods']);
                }
        }
        
        // Shipping address
        // if Shipping address not existing then shipping address id is payment address id.
        if (isset($this->request->post['shipping_address']) && $this->request->post['shipping_address'] == 'existing') {

            $this->session->data['shipping_address_id'] = $this->request->post['payment_address_id'];

            // Default Shipping Address
            $this->load->model('account/address');

            $address_info = $this->model_account_address->getAddress($this->request->post['payment_address_id']);

            if ($address_info) {
                $this->session->data['shipping_country_id'] = $address_info['country_id'];
                $this->session->data['shipping_zone_id'] = $address_info['zone_id'];
                $this->session->data['shipping_postcode'] = $address_info['postcode'];
            } else {
                unset($this->session->data['shipping_country_id']);
                unset($this->session->data['shipping_zone_id']);
                unset($this->session->data['shipping_postcode']);
            }

            //  unset($this->session->data['shipping_method']);
            //   unset($this->session->data['shipping_methods']);
        } else {

            $this->load->model('account/address');
            if (empty($this->request->post['shipping_address_id'])) {
                $json['error']['warning'] = $this->language->get('error_address');
            } elseif (!in_array($this->request->post['shipping_address_id'], array_keys($this->model_account_address->getAddresses()))) {
                  $json['error']['warning'] = $this->language->get('error_address');
            }

            if (!$json) {
                       $this->session->data['shipping_address_id'] = $this->request->post['shipping_address_id'];
                // Default Shipping Address
                $this->load->model('account/address');
                //   $address_info = $this->model_account_address->getAddress($this->request->post['shipping_address_id']);
                $address_info = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
                if ($address_info) {
                    $this->session->data['shipping_country_id'] = $address_info['country_id'];
                    $this->session->data['shipping_zone_id'] = $address_info['zone_id'];
                    $this->session->data['shipping_postcode'] = $address_info['postcode'];
                } else {
                    unset($this->session->data['shipping_country_id']);
                    unset($this->session->data['shipping_zone_id']);
                    unset($this->session->data['shipping_postcode']);
                }

//                unset($this->session->data['shipping_method']);
//                unset($this->session->data['shipping_methods']);
            }
        }
        // Shipping method  
        if (!$json) {

            if (!isset($this->request->post['shipping_method'])) {
               $json['error']['warning'] = $this->language->get('error_shipping');
            } else {
                $shipping = explode('.', $this->request->post['shipping_method']);
              
                if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
                   $json['error']['warning'] = isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]]);
                }
            }

            if (!$json) {
                $shipping = explode('.', $this->request->post['shipping_method']);
                $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
            }
        }
//         Payment method
        if (!$json) {

            if ($this->config->get('config_checkout_id')) {
                $this->load->model('catalog/information');

                $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

                if ($information_info && !isset($this->request->post['agree'])) {
                  
                    $json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
                } else {
                    
                    $this->session->data['agree'] = $this->request->post['agree'];
                }
            }
        }
        // Create order
        if (!$json) {


            $total_data = array();
            $total = 0;
            $taxes = $this->cart->getTaxes();

            $this->load->model('setting/extension');

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
            }

            $sort_order = array();

            foreach ($total_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $total_data);

            $this->language->load('checkout/checkout');

            $data = array();

            $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
            $data['store_id'] = $this->config->get('config_store_id');
            $data['store_name'] = $this->config->get('config_name');

            if ($data['store_id']) {
                $data['store_url'] = $this->config->get('config_url');
            } else {
                $data['store_url'] = HTTP_SERVER;
            }

            if ($this->customer->isLogged()) {

                $data['customer_id'] = $this->customer->getId();
                $data['customer_group_id'] = $this->customer->getCustomerGroupId();
                $data['firstname'] = $this->customer->getFirstName();
                $data['lastname'] = $this->customer->getLastName();
                $data['email'] = $this->customer->getEmail();
                $data['telephone'] = $this->customer->getTelephone();
                $data['fax'] = $this->customer->getFax();
                $this->load->model('account/address');
                $payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
              
            }
//            } elseif (isset($this->session->data['guest'])) {
//                $data['customer_id'] = 0;
//                $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
//                $data['firstname'] = $this->session->data['guest']['firstname'];
//                $data['lastname'] = $this->session->data['guest']['lastname'];
//                $data['email'] = $this->session->data['guest']['email'];
//                $data['telephone'] = $this->session->data['guest']['telephone'];
//                $data['fax'] = $this->session->data['guest']['fax'];
//
//                $payment_address = $this->session->data['guest']['payment'];
//            }

            $data['payment_firstname'] = $payment_address['firstname'];
            $data['payment_lastname'] = $payment_address['lastname'];
            $data['payment_company'] = $payment_address['company'];
            $data['payment_company_id'] = $payment_address['company_id'];
            $data['payment_tax_id'] = $payment_address['tax_id'];
            $data['payment_address_1'] = $payment_address['address_1'];
            $data['payment_address_2'] = $payment_address['address_2'];
            $data['payment_city'] = $payment_address['city'];
            $data['payment_postcode'] = $payment_address['postcode'];
            $data['payment_zone'] = $payment_address['zone'];
            $data['payment_zone_id'] = $payment_address['zone_id'];
            $data['payment_country'] = $payment_address['country'];
            $data['payment_country_id'] = $payment_address['country_id'];
            $data['payment_address_format'] = $payment_address['address_format'];

            if (isset($this->session->data['payment_method']['title'])) {
                $data['payment_method'] = $this->session->data['payment_method']['title'];
            } else {
                $data['payment_method'] = '';
            }

            if (isset($this->session->data['payment_method']['code'])) {
                $data['payment_code'] = $this->session->data['payment_method']['code'];
            } else {
                $data['payment_code'] = '';
            }

            if ($this->cart->hasShipping()) {
                if ($this->customer->isLogged()) {
                    $this->load->model('account/address');
                    $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
                } elseif (isset($this->session->data['guest'])) {
                    $shipping_address = $this->session->data['guest']['shipping'];
                }

                $data['shipping_firstname'] = $shipping_address['firstname'];
                $data['shipping_lastname'] = $shipping_address['lastname'];
                $data['shipping_company'] = $shipping_address['company'];
                $data['shipping_address_1'] = $shipping_address['address_1'];
                $data['shipping_address_2'] = $shipping_address['address_2'];
                $data['shipping_city'] = $shipping_address['city'];
                $data['shipping_postcode'] = $shipping_address['postcode'];
                $data['shipping_zone'] = $shipping_address['zone'];
                $data['shipping_zone_id'] = $shipping_address['zone_id'];
                $data['shipping_country'] = $shipping_address['country'];
                $data['shipping_country_id'] = $shipping_address['country_id'];
                $data['shipping_address_format'] = $shipping_address['address_format'];

                if (isset($this->session->data['shipping_method']['title'])) {
                    $data['shipping_method'] = $this->session->data['shipping_method']['title'];
                } else {
                    $data['shipping_method'] = '';
                }

                if (isset($this->session->data['shipping_method']['code'])) {
                    $data['shipping_code'] = $this->session->data['shipping_method']['code'];
                } else {
                    $data['shipping_code'] = '';
                }
            } else {
                $data['shipping_firstname'] = '';
                $data['shipping_lastname'] = '';
                $data['shipping_company'] = '';
                $data['shipping_address_1'] = '';
                $data['shipping_address_2'] = '';
                $data['shipping_city'] = '';
                $data['shipping_postcode'] = '';
                $data['shipping_zone'] = '';
                $data['shipping_zone_id'] = '';
                $data['shipping_country'] = '';
                $data['shipping_country_id'] = '';
                $data['shipping_address_format'] = '';
                $data['shipping_method'] = '';
                $data['shipping_code'] = '';
            }

            $product_data = array();

            foreach ($this->cart->getProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['option_value'];
                    } else {
                        $value = $this->encryption->decrypt($option['option_value']);
                    }

                    $option_data[] = array(
                        'product_option_id' => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id' => $option['option_id'],
                        'option_value_id' => $option['option_value_id'],
                        'name' => $option['name'],
                        'value' => $value,
                        'type' => $option['type']
                    );
                }

                $product_data[] = array(
                    
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'mc' => $product['mc'],
                    'mcs' => $product['mcs'],
                    'color' => $product['color'],
                    'size' => $product['size'],
                    'option' => $option_data,
                    'download' => $product['download'],
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $product['price'],
                    'total' => $product['total'],
                    'tax' => $this->tax->getTax($product['price'], $product['tax_class_id']),
                    'reward' => $product['reward']
                );
            }

            // Gift Voucher
            $voucher_data = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $voucher_data[] = array(
                        'description' => $voucher['description'],
                        'code' => substr(md5(mt_rand()), 0, 10),
                        'to_name' => $voucher['to_name'],
                        'to_email' => $voucher['to_email'],
                        'from_name' => $voucher['from_name'],
                        'from_email' => $voucher['from_email'],
                        'voucher_theme_id' => $voucher['voucher_theme_id'],
                        'message' => $voucher['message'],
                        'amount' => $voucher['amount']
                    );
                }
            }

            $data['products'] = $product_data;
            $data['vouchers'] = $voucher_data;
            $data['totals'] = $total_data;
            $data['comment'] = ''; //$this->session->data['comment'];
            $data['total'] = $total;

            if (isset($this->request->cookie['tracking'])) {
                $this->load->model('affiliate/affiliate');

                $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
                $subtotal = $this->cart->getSubTotal();

                if ($affiliate_info) {
                    $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                    $data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                } else {
                    $data['affiliate_id'] = 0;
                    $data['commission'] = 0;
                }
            } else {
                $data['affiliate_id'] = 0;
                $data['commission'] = 0;
            }
            $data['language_id'] = $this->config->get('config_language_id');
            $data['currency_id'] = $this->currency->getId();
            $data['currency_code'] = $this->currency->getCode();
            $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
            $data['ip'] = $this->request->server['REMOTE_ADDR'];

            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
            } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
            } else {
                $data['forwarded_ip'] = '';
            }
            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
            } else {
                $data['user_agent'] = '';
            }
            if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
                $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
            } else {
                $data['accept_language'] = '';
            }
            $this->load->model('checkout/order');
            $this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);
            $json['redirect'] = $this->url->link('checkout/order');
        }
        $this->response->setOutput(json_encode($json));
    }
}
?>