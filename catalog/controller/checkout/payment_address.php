<?php

class ControllerCheckoutPaymentAddress extends Controller {

    public function index() {
        $this->language->load('checkout/checkout');

        $this->data['text_address_existing'] = $this->language->get('text_address_existing');
        $this->data['text_address_new'] = $this->language->get('text_address_new');
        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_payment_note'] = $this->language->get('text_payment_note');

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
        $this->data['button_continue'] = $this->language->get('button_continue');
        
        // Get customer
        $this->load->model('checkout/address');
        $this->data['addresses'] = array();
        $this->data['addresses'] = $this->model_checkout_address->getAddresses();
        
       $this->data['payment_address_id'] = $this->customer->getAddressId();
       $payment_address_info = $this->model_checkout_address->getAddress($this->data['payment_address_id']);
        
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
            $this->data['payment_telephone'] = $this->customer->getTelephone();
        } else {
              $this->data['payment_telephone']='';
        }
     
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/payment_address.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/payment_address.tpl';
        } else {
            $this->template = 'default/template/checkout/payment_address.tpl';
        }

        $this->response->setOutput($this->render());
    }

    public function validate() {
        $this->language->load('checkout/payment_address');
        $json = array();
        $this->load->model('account/address');
        if (empty($this->request->post['payment_address_id'])) {
            $json['error']['warning'] = $this->language->get('error_address');
        } elseif (!in_array($this->request->post['payment_address_id'], array_keys($this->model_checkout_address->getAddresses()))) {
            $json['error']['warning'] = $this->language->get('error_address');
        }
        if(!$json){
            $this->session->data['payment_address_id']=$this->request->post['payment_address_id'];
        }  else {
            unset($this->session->data['payment_address_id']);	
        }


        $this->response->setOutput(json_encode($json));
    }

}

?>