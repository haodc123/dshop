<?php

class ControllerCatalogColor extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('catalog/color');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/color');

        $this->getList();
    }

    public function insert() {
        $this->language->load('catalog/color');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/color');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm() && $this->validateInsert()) {
            $this->model_catalog_color->addColor($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->language->load('catalog/color');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/color');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm() && $this->validateEdit()) {

            $this->model_catalog_color->editColor($this->request->get['color_id'], $this->request->get['color'], $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->language->load('catalog/color');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/color');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $color_id) {
                $this->model_catalog_color->deleteColor($color_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['insert'] = $this->url->link('catalog/color/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('catalog/color/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['colors'] = array();

        $data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

        $color_total = $this->model_catalog_color->getTotalColors();

        $results = $this->model_catalog_color->getColors($data);

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('catalog/color/update', 'token=' . $this->session->data['token'] . '&color_id=' . $result['color_id'] . '&color=' . $result['color'] . $url, 'SSL')
            );

            $this->data['colors'][] = array(
                'color_id' => $result['color_id'],
                'color' => $result['color'],
                'code' => $result['code'],
                'status' => $result['status'],
                'name' => $result['name'],
                'sort_order' => $result['sort_order'],
                'selected' => isset($this->request->post['selected']) && in_array($result['color_id'], $this->request->post['selected']),
                'action' => $action
            );
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');

        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_status'] = $this->language->get('column_status');
        $this->data['column_action'] = $this->language->get('column_action');
        $this->data['column_sort_order'] = $this->language->get('column_sort_order');
        $this->data['column_code'] = $this->language->get('column_code');
         $this->data['column_color'] = $this->language->get('column_color');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['sort_name'] = $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
        $this->data['sort_status'] = $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . '&sort=sort_status' . $url, 'SSL');
        $this->data['sort_sort_order'] = $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $color_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;

        $this->template = 'catalog/color_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function getForm() {
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['entry_name'] = $this->language->get('entry_name');
        $this->data['entry_color'] = $this->language->get('entry_color');
         $this->data['entry_code'] = $this->language->get('entry_code');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_keyword'] = $this->language->get('entry_keyword');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $this->data['error_name'] = $this->error['name'];
        } else {
            $this->data['error_name'] = '';
        }
        if (isset($this->error['color'])) {
            $this->data['error_color'] = $this->error['color'];
        } else {
            $this->data['error_color'] = '';
        }
         if (isset($this->error['code'])) {
            $this->data['error_code'] = $this->error['code'];
        } else {
            $this->data['error_code'] = '';
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['color_id'])) {
            $this->data['action'] = $this->url->link('catalog/color/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('catalog/color/update', 'token=' . $this->session->data['token'] . '&color_id=' . $this->request->get['color_id'] . '&color=' . $this->request->get['color'] . $url, 'SSL');
        }

        $this->data['cancel'] = $this->url->link('catalog/color', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['color_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $color_info = $this->model_catalog_color->getColor($this->request->get['color_id']);
        }

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } elseif (!empty($color_info)) {
            $this->data['name'] = $color_info['name'];
        } else {
            $this->data['name'] = '';
        }
         if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } elseif (!empty($color_info)) {
            $this->data['status'] = $color_info['status'];
        } else {
            $this->data['status'] =0;
        }
        if (isset($this->request->post['color'])) {
            $this->data['color'] = $this->request->post['color'];
        } elseif (!empty($color_info)) {
            $this->data['color'] = $color_info['color'];
        } else {
            $this->data['color'] = '';
        }
        if (isset($this->request->post['code'])) {
            $this->data['code'] = $this->request->post['code'];
        } elseif (!empty($color_info)) {
            $this->data['code'] = $color_info['code'];
        } else {
            $this->data['code'] = '';
        }
        if (isset($this->request->post['sort_order'])) {
            $this->data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($color_info)) {
            $this->data['sort_order'] = $color_info['sort_order'];
        } else {
            $this->data['sort_order'] =0;
        }

        $this->template = 'catalog/color_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
      protected function validateInsert() {
        if (!$this->user->hasPermission('modify', 'catalog/color')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
         $this->load->model('catalog/color');
        if (!empty($this->request->post['color'])) {
            $colors = $this->model_catalog_color->getColors();
            foreach ($colors as $color) {
                if (strtoupper($this->request->post['color']) == strtoupper($color['color'])) {
                    $this->error['color'] = $this->language->get('error_exists');
                    break;
                }
            }
        }
         if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
     protected function validateEdit() {
        if (!$this->user->hasPermission('modify', 'catalog/color')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
       $this->load->model('catalog/color');
        if (!empty($this->request->post['color'])) {
            $colors = $this->model_catalog_color->getColors();
            foreach ($colors as $color) {
                if (strtoupper($this->request->post['color']) == strtoupper($color['color']) && $this->request->get['color_id']!=$color['color_id']) {
                    $this->error['color'] = $this->language->get('error_exists');
                    break;
                }
            }
        }
         if (!$this->error) {
            return true;
        } else {
            return false;
        }
       
    }
    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/color')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }
        if ((utf8_strlen($this->request->post['color']) < 1) || (utf8_strlen($this->request->post['color']) > 64)) {
            $this->error['color'] = $this->language->get('error_color');
        }
        if ((utf8_strlen($this->request->post['code']) < 1) || (utf8_strlen($this->request->post['code']) > 10)) {
            $this->error['code'] = $this->language->get('error_code');
        }
       
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'catalog/color')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        $this->load->model('catalog/color');

        foreach ($this->request->post['selected'] as $color_id) {
            $product_total = $this->model_catalog_color->getTotalProductsByColorId($color_id);

            if ($product_total) {
                $this->error['warning'] = sprintf($this->language->get('error_product'), $product_total);
            }
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>