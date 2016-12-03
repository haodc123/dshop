<?php

class ControllerCheckoutShippingAddress extends Controller {

    public function index() {
        $this->language->load('checkout/shipping_address');

     //   $this->data['text_address_existing'] = $this->language->get('text_address_existing');
        $this->data['text_address_new'] = $this->language->get('text_address_new');
        $this->data['text_address_edit'] = $this->language->get('text_address_edit');
        
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
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['button_continue'] = $this->language->get('button_continue');
        
       
         
        $this->load->model('checkout/address');
        
        $this->data['shipping_addresses'] = array();
        $this->data['shipping_addresses'] = $this->model_checkout_address->getShippingAddresses( $this->customer->getAddressId());
        if (isset($this->session->data['shipping_address_id'])) {
            $this->data['shipping_address_id'] = $this->session->data['shipping_address_id'];
        } else {
             $this->data['shipping_address_id'] = $this->request->post['shipping_address_id'];
            
        }
        if (isset($this->session->data['payment_address_id'])) {
            $this->data['payment_address_id'] = $this->session->data['payment_address_id'];
        } else {
            $this->data['payment_address_id'] = $this->customer->getAddressId();
        }
        
        
        $address_info = $this->model_checkout_address->getAddress($this->data['shipping_address_id']);
        
        if ($address_info) {
            $this->data['shipping_firstname'] = $address_info['firstname'];
        } else {
            $this->data['shipping_firstname'] = '';
        }
        if ($address_info) {
            $this->data['shipping_lastname'] = $address_info['lastname'];
        } else {
            $this->data['shipping_lastname'] = '';
        }
        if ($address_info) {
            $this->data['shipping_address_1'] = $address_info['address_1'];
        } else {
            $this->data['shipping_address_1'] = '';
        }
        if ($address_info) {
            $this->data['shipping_address_2'] = $address_info['address_2'];
        } else {
            $this->data['shipping_address_2'] = '';
        }
        if ($address_info) {
            $this->data['shipping_country'] = $address_info['country'];
        } else {
            $this->data['shipping_country'] = '';
        }
        if ($address_info) {
            $this->data['shipping_country_id'] = $address_info['country_id'];
        } else {
            $this->data['shipping_country_id'] = '';
        }
        if ($address_info) {
            $this->data['shipping_postcode'] = $address_info['postcode'];
        } else {
            $this->data['shipping_postcode'] = '';
        }

        if ($address_info) {
            $this->data['shipping_city'] = $address_info['city'];
        } else {
            $this->data['shipping_city'] = '';
        }
        if ($address_info) {
            $this->data['shipping_city'] = $address_info['city'];
        } else {
            $this->data['shipping_city'] = '';
        }
        if ($address_info) {
            $this->data['shipping_zone_id'] = $address_info['zone_id'];
        } else {
            $this->data['shipping_zone_id'] = '';
        }
        if ($address_info) {
            $this->data['shipping_zone'] = $address_info['zone'];
        } else {
            $this->data['shipping_zone'] = '';
        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/shipping_address.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/shipping_address.tpl';
        } else {
            $this->template = 'default/template/checkout/shipping_address.tpl';
        }

        $this->response->setOutput($this->render());
    }

    public function validate() {
        $this->language->load('checkout/shipping_address');
        $json = array();
        $this->load->model('account/address');
        if (empty($this->request->post['shipping_address_id'])) {
            $json['error']['warning'] = $this->language->get('error_address');
        } elseif (!in_array($this->request->post['shipping_address_id'], array_keys($this->model_checkout_address->getAddresses()))) {
            $json['error']['warning'] = $this->language->get('error_address');
        }
        if(!$json){
            $this->session->data['shipping_address_id']=$this->request->post['shipping_address_id'];
        }  else {
            unset($this->session->data['shipping_address_id']);	
        }
        $this->response->setOutput(json_encode($json));
    }

}

?>