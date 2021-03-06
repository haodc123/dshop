<?php

class ControllerCheckoutForgotten extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('account/forgotten');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_your_email'] = $this->language->get('text_your_email');
        $this->data['text_email'] = $this->language->get('text_email');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_back'] = $this->language->get('button_back');

        
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['action'] = $this->url->link('account/forgotten', '', 'SSL');

        $this->data['back'] = $this->url->link('account/login', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/forgotten.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/checkout/forgotten.tpl';
        } else {
            $this->template = 'default/template/checkout/forgotten.tpl';
        }
    $this->response->setOutput($this->render());
    }
    public function validate() {
        $json = array();
         $this->language->load('account/forgotten');
           $this->load->model('account/customer');
        if ($this->customer->isLogged()) {
            $json['redirect'] = false;
        }

        if (!$json) {
            
            if (!isset($this->request->post['email'])) {
                $json['error']['warning'] = $this->language->get('error_email');
            } elseif (!$this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
                $json['error']['warning'] = $this->language->get('error_email');
            }
        }
        if (!$json) {

          

            $this->language->load('mail/forgotten');

            $password = substr(sha1(uniqid(mt_rand(), true)), 0, 10);

            $this->model_account_customer->editPassword($this->request->post['email'], $password);

            $subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

            $message = sprintf($this->language->get('text_greeting'), $this->config->get('config_name')) . "\n\n";
            $message .= $this->language->get('text_password') . "\n\n";
            $message .= $password;

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->hostname = $this->config->get('config_smtp_host');
            $mail->username = $this->config->get('config_smtp_username');
            $mail->password = $this->config->get('config_smtp_password');
            $mail->port = $this->config->get('config_smtp_port');
            $mail->timeout = $this->config->get('config_smtp_timeout');
            $mail->setTo($this->request->post['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($this->config->get('config_name'));
            $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
            
            $this->session->data['success'] = $this->language->get('text_success');
            $json['redirect'] = true;
        }
           $this->response->setOutput(json_encode($json));
    }
   

}

?>