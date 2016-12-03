<?php

class ControllerCheckoutShippingMethod extends Controller {

    public function index() {
        $this->language->load('checkout/checkout');
        $this->load->model('account/address');
        
//        if ($this->request->get['shipping_address'] == 'existing') {
//
//            $shipping_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
//          // $this->session->data['shipping_address_id'] = $this->request->post['payment_address_id'];
//        } else {
//           
//                if(isset($this->request->post['shipping_address_id'])){
//                    $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
//                   //   $this->session->data['shipping_address_id'] = $this->request->post['shipping_address_id'];
//                }
//                else{
//                    $shipping_address = $this->model_account_address->getAddress(0);
//                  //  $this->session->data['shipping_address_id'] = $this->request->post['payment_address_id'];
//                }
//        }
        
        if ($this->request->get['shipping_address'] == 'existing') {

            $shipping_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
          
        } else {
             $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
               
        }
        
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
        }

        $this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $this->data['text_comments'] = $this->language->get('text_comments');
        $this->data['text_checkout_shipping_method'] = $this->language->get('text_checkout_shipping_method');
        $this->data['button_continue'] = $this->language->get('button_continue');

        if (empty($this->session->data['shipping_methods'])) {
            $this->data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['shipping_methods'])) {
            $this->data['shipping_methods'] = $this->session->data['shipping_methods'];
        } else {
            $this->data['shipping_methods'] = array();
        }
        $this->data['code'] = '';
//        if (isset($this->session->data['shipping_method']['code'])) {
//            $this->data['code'] = $this->session->data['shipping_method']['code'];
//        } else {
//            $this->data['code'] = '';
//        }

//        if (isset($this->session->data['comment'])) {
//            $this->data['comment'] = $this->session->data['comment'];
//        } else {
//            $this->data['comment'] = '';
//        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/shipping_method.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/shipping_method.tpl';
        } else {
            $this->template = 'default/template/checkout/shipping_method.tpl';
        }
        $this->response->setOutput($this->render());
    }

}
?>