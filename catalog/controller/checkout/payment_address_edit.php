<?php

class ControllerCheckoutPaymentAddressEdit extends Controller {

    private $error = array();

    public function index() {
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/address', '', 'SSL');
            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }
        $this->data['payment_address_id']=$this->request->get['payment_address_id'];
        
        $this->language->load('checkout/payment_address');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('checkout/address');

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_edit_address'] = $this->language->get('text_edit_address');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_none'] = $this->language->get('text_none');

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
        $this->data['entry_zone'] = $this->language->get('entry_zone');
        $this->data['entry_phone'] = $this->language->get('entry_phone');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_default'] = $this->language->get('entry_default');
        $this->data['button_update'] = $this->language->get('button_update');
        $this->data['error_empty'] = $this->language->get('error_empty');
      
     
        
        // Get customer
        $this->data['telephone'] =  $this->customer->getTelephone();
        
        if (isset($this->request->get['payment_address_id'])) {
            $address_info = $this->model_checkout_address->getAddress($this->request->get['payment_address_id']);
        }

        if (isset($this->request->post['firstname'])) {
            $this->data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($address_info)) {
            $this->data['firstname'] = $address_info['firstname'];
        } else {
            $this->data['firstname'] = '';
        }

        if (isset($this->request->post['lastname'])) {
            $this->data['lastname'] = $this->request->post['lastname'];
        } elseif (!empty($address_info)) {
            $this->data['lastname'] = $address_info['lastname'];
        } else {
            $this->data['lastname'] = '';
        }
        if (isset($this->request->post['address_1'])) {
            $this->data['address_1'] = $this->request->post['address_1'];
        } elseif (!empty($address_info)) {
            $this->data['address_1'] = $address_info['address_1'];
        } else {
            $this->data['address_1'] = '';
        }

        if (isset($this->request->post['address_2'])) {
            $this->data['address_2'] = $this->request->post['address_2'];
        } elseif (!empty($address_info)) {
            $this->data['address_2'] = $address_info['address_2'];
        } else {
            $this->data['address_2'] = '';
        }

        if (isset($this->request->post['postcode'])) {
            $this->data['postcode'] = $this->request->post['postcode'];
        } elseif (!empty($address_info)) {
            $this->data['postcode'] = $address_info['postcode'];
        } else {
            $this->data['postcode'] = '';
        }

        if (isset($this->request->post['city'])) {
            $this->data['city'] = $this->request->post['city'];
        } elseif (!empty($address_info)) {
            $this->data['city'] = $address_info['city'];
        } else {
            $this->data['city'] = '';
        }

        if (isset($this->request->post['country_id'])) {
            $this->data['country_id'] = $this->request->post['country_id'];
        } elseif (!empty($address_info)) {
            $this->data['country_id'] = $address_info['country_id'];
        } else {
            $this->data['country_id'] = $this->config->get('config_country_id');
        }

        if (isset($this->request->post['zone_id'])) {
            $this->data['zone_id'] = $this->request->post['zone_id'];
        } elseif (!empty($address_info)) {
            $this->data['zone_id'] = $address_info['zone_id'];
        } else {
            $this->data['zone_id'] = '';
        }

        $this->load->model('localisation/country');

        $this->data['countries'] = $this->model_localisation_country->getCountries();

        if (isset($this->request->post['default'])) {
            $this->data['default'] = $this->request->post['default'];
        } elseif (isset($this->request->get['payment_address_id'])) {
            $this->data['default'] = $this->customer->getAddressId() == $this->request->get['payment_address_id'];
        } else {
            $this->data['default'] = false;
        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/payment_address_edit.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/payment_address_edit.tpl';
        } else {
            $this->template = 'default/template/checkout/payment_address_edit.tpl';
        }
        $this->response->setOutput($this->render());
    }

    public function update() {
         $json = array();
        
        $this->language->load('checkout/checkout');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('checkout/address');
        
        
        if (utf8_strlen($this->request->post['firstname']) < 1) {
            $json['error']['firstname'] = $this->language->get('error_empty');
        } elseif (utf8_strlen($this->request->post['firstname']) > 32) {
            $json['error']['firstname'] = $this->language->get('error_firstname');
        }

        if (utf8_strlen($this->request->post['lastname']) < 1) {
            $json['error']['lastname'] = $this->language->get('error_empty');
        } elseif (utf8_strlen($this->request->post['lastname']) > 32) {
            $json['error']['lastname'] = $this->language->get('error_lastname');
        }
        if (utf8_strlen($this->request->post['address_1']) < 1) {
            $json['error']['address_1'] = $this->language->get('error_empty');
        } elseif (utf8_strlen($this->request->post['address_1']) < 3) {
            $json['error']['address_1'] = $this->language->get('error_address_1');
        } elseif (utf8_strlen($this->request->post['address_1']) > 128) {
            $json['error']['address_1'] = $this->language->get('error_address_1');
        }

        if (utf8_strlen($this->request->post['address_2']) > 128) {
            $json['error']['address_2'] = $this->language->get('error_address_2');
        }

         if (utf8_strlen($this->request->post['city']) < 1) {
            $json['error']['city'] = $this->language->get('error_empty');
        } elseif (utf8_strlen($this->request->post['city']) < 2) {
            $json['error']['city'] = $this->language->get('error_city');
        } elseif (utf8_strlen($this->request->post['city']) > 128) {
            $json['error']['city'] = $this->language->get('error_city');
        }

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

        if ($country_info) {
            if ($country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 1)) {
                $json['error']['postcode'] = $this->language->get('error_empty');
            } elseif ($country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2)) {
                $json['error']['postcode'] =  $this->language->get('error_postcode');
            } elseif ($country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) > 10)) {
                $json['error']['postcode'] = $this->language->get('error_postcode');
            }
        }
        if ($this->request->post['country_id'] == '') {
                $json['error']['country'] = $this->language->get('error_country');
            }

            if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
                $json['error']['zone'] = $this->language->get('error_zone');
            }
        if (utf8_strlen($this->request->post['telephone']) < 1) {
                    $json['error']['telephone'] =$this->language->get('error_empty');
              }elseif (utf8_strlen($this->request->post['telephone']) < 3) {
                $json['error']['telephone'] = $this->language->get('error_telephone');
            }elseif (utf8_strlen($this->request->post['telephone']) > 32) {
                $json['error']['telephone'] = $this->language->get('error_telephone');
            }
        if(!$json){
            $this->model_checkout_address->editAddress($this->request->get['payment_address_id'], $this->request->post);
           
//            // Default Shipping Address
//            if (isset($this->session->data['shipping_address_id']) && ($this->request->get['address_id'] == $this->session->data['shipping_address_id'])) {
//                $this->session->data['shipping_country_id'] = $this->request->post['country_id'];
//                $this->session->data['shipping_zone_id'] = $this->request->post['zone_id'];
//                $this->session->data['shipping_postcode'] = $this->request->post['postcode'];
//
//                unset($this->session->data['shipping_method']);
//                unset($this->session->data['shipping_methods']);
//            }

            // Default Payment Address
            if (isset($this->session->data['payment_address_id']) && ($this->request->get['payment_address_id'] == $this->session->data['payment_address_id'])) {
                $this->session->data['payment_country_id'] = $this->request->post['country_id'];
                $this->session->data['payment_zone_id'] = $this->request->post['zone_id'];

                unset($this->session->data['payment_method']);
                unset($this->session->data['payment_methods']);
            }

        }
        $this->response->setOutput(json_encode($json));
        
    }

    public function country() {
        $json = array();

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

        if ($country_info) {
            $this->load->model('localisation/zone');

            $json = array(
                'country_id' => $country_info['country_id'],
                'name' => $country_info['name'],
                'iso_code_2' => $country_info['iso_code_2'],
                'iso_code_3' => $country_info['iso_code_3'],
                'address_format' => $country_info['address_format'],
                'postcode_required' => $country_info['postcode_required'],
                'zone' => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
                'status' => $country_info['status']
            );
        }

        $this->response->setOutput(json_encode($json));
    }

    public function validate() {
       
        $json = array();
        if ($this->customer->isLogged()) {
            $json['error']= false;
        }else {
                $json['error']= true;
        }

        $this->response->setOutput(json_encode($json));
    }
    


}

?>