<?php

class ControllerWarehouseReceiptNote extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('warehouse/receipt_note');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('warehouse/receipt_note');

        $this->getList();
    }

    public function insert() {
        $this->language->load('warehouse/receipt_note');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('warehouse/receipt_note');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm() && $this->validateInsert()) {
            $this->model_warehouse_receipt_note->addReceiptNote($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_code'])) {
                $url .= '&filter_code=' . urlencode(html_entity_decode($this->request->get['filter_code'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->language->load('warehouse/receipt_note');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('warehouse/receipt_note');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm() && $this->validateUpDate()) {
            $this->model_warehouse_receipt_note->editReceiptNote($this->request->get['receipt_note_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_code'])) {
                $url .= '&filter_code=' . urlencode(html_entity_decode($this->request->get['filter_code'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_date'])) {
                $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_date'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->language->load('warehouse/receipt_note');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('warehouse/receipt_note');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $receipt_note_id) {
                $this->model_warehouse_receipt_note->deleteReceiptNote($receipt_note_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_code'])) {
                $url .= '&filter_code=' . urlencode(html_entity_decode($this->request->get['filter_code'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_date'])) {
                $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_date'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['filter_code'])) {
            $filter_code = $this->request->get['filter_code'];
        } else {
            $filter_code = null;
        }

        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }

        if (isset($this->request->get['filter_date'])) {
            $filter_date = $this->request->get['filter_date'];
        } else {
            $filter_date = null;
        }
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

        if (isset($this->request->get['filter_code'])) {
            $url .= '&filter_code=' . urlencode(html_entity_decode($this->request->get['filter_code'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_date'])) {
            $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_date'], ENT_QUOTES, 'UTF-8'));
        }

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
            'href' => $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['insert'] = $this->url->link('warehouse/receipt_note/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('warehouse/receipt_note/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['receipt_notes'] = array();

        $data = array(
            'filter_code' => $filter_code,
            'filter_name' => $filter_name,
            'filter_date' => $filter_date,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1),
            'limit' => 1
        );

        $this->load->model('tool/image');

        $receipt_note_total = $this->model_warehouse_receipt_note->getTotalReceiptNotes($data);

        $results = $this->model_warehouse_receipt_note->getReceiptNotes($data);

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('warehouse/receipt_note/update', 'token=' . $this->session->data['token'] . '&receipt_note_id=' . $result['receipt_note_id'] . $url, 'SSL')
            );
            $this->data['receipt_notes'][] = array(
                'receipt_note_id' => $result['receipt_note_id'],
                'code' => $result['code'],
                'name' => $result['name'],
                'date' => $result['date'],
                'price' => $result['price'],
                'quantity' => $result['quantity'],
                //   'status' => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                'selected' => isset($this->request->post['selected']) && in_array($result['receipt_note_id'], $this->request->post['selected']),
                'action' => $action
            );
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['text_image_manager'] = $this->language->get('text_image_manager');

        $this->data['column_code'] = $this->language->get('column_code');
        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_date'] = $this->language->get('column_date');
        $this->data['column_price'] = $this->language->get('column_price');
        $this->data['column_quantity'] = $this->language->get('column_quantity');
        $this->data['column_status'] = $this->language->get('column_status');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');
        $this->data['button_filter'] = $this->language->get('button_filter');

        $this->data['token'] = $this->session->data['token'];

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

        if (isset($this->request->get['filter_code'])) {
            $url .= '&filter_code=' . urlencode(html_entity_decode($this->request->get['filter_code'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_date'])) {
            $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_date'], ENT_QUOTES, 'UTF-8'));
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $this->data['sort_code'] = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . '&sort=code' . $url, 'SSL');
        $this->data['sort_name'] = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
        $this->data['sort_data'] = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . '&sort=date' . $url, 'SSL');
//        $this->data['sort_quantity'] = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, 'SSL');
//        $this->data['sort_status'] = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, 'SSL');
//        $this->data['sort_order'] = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['filter_code'])) {
            $url .= '&filter_code=' . urlencode(html_entity_decode($this->request->get['filter_code'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_date'])) {
            $url .= '&filter_date=' . urlencode(html_entity_decode($this->request->get['filter_date'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $receipt_note_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('warehouse/receipt_note', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['filter_code'] = $filter_code;
        $this->data['filter_name'] = $filter_name;
        $this->data['filter_date'] = $filter_date;
//        $this->data['filter_quantity'] = $filter_quantity;
//        $this->data['filter_status'] = $filter_status;

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;

        $this->template = 'warehouse/receipt_note_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function getForm() {

        // Get ReceiptNotes
       
        
        $this->data['heading_title'] = $this->language->get('heading_title');
        
        // ReceiptNote
        $this->data['column_image'] = $this->language->get('column_image');
        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_model'] = $this->language->get('column_model');
        // Receipt note
        $this->data['entry_code'] = $this->language->get('entry_code');
        $this->data['entry_name'] = $this->language->get('entry_name');
        $this->data['entry_date'] = $this->language->get('entry_date');
        $this->data['entry_supplier'] = $this->language->get('entry_supplier');
        $this->data['entry_manufacture'] = $this->language->get('entry_manufacture');
        //Product 
         $this->data['column_index'] = $this->language->get('column_index');
         $this->data['column_image'] = $this->language->get('column_image');
         $this->data['column_code'] = $this->language->get('column_code');
         $this->data['column_name'] = $this->language->get('column_name');
         $this->data['column_color'] = $this->language->get('column_color');
         $this->data['column_size'] = $this->language->get('column_size');
         $this->data['column_quantity'] = $this->language->get('column_quantity');
         $this->data['column_price'] = $this->language->get('column_price');
         $this->data['column_action'] = $this->language->get('column_action');
        //Buttion 
        $this->data['button_new'] = $this->language->get('button_new');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_edit'] = $this->language->get('button_edit');
        $this->data['button_delete'] = $this->language->get('button_delete');
       
        
        
        
         $this->data['token'] = $this->session->data['token'];
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['code'])) {
            $this->data['error_code'] = $this->error['code'];
        } else {
            $this->data['error_code'] = array();
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
//        if (!isset($this->request->get['receipt_note_id'])) {
//            $this->data['action'] = $this->url->link('catalog/product/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
//        } else {
//            $this->data['action'] = $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&receipt_note_id=' . $this->request->get['receipt_note_id'] . $url, 'SSL');
//        }

      //  $this->data['cancel'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['receipt_note_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $receipt_note_info = $this->model_warehouse_receipt_note->getReceiptNote($this->request->get['receipt_note_id']);
        }

        $this->data['token'] = $this->session->data['token'];
        
        if (isset($this->request->post['code'])) {
            $this->data['code'] = $this->request->post['code'];
        } elseif (!empty($receipt_note_info)) {
            $this->data['code'] = $receipt_note_info['code'];
        } else {
            $this->data['code'] = '';
        }
        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } elseif (!empty($receipt_note_info)) {
            $this->data['name'] = $receipt_note_info['name'];
        } else {
            $this->data['name'] = '';
        }
        if (isset($this->request->post['date'])) {
            $this->data['date_available'] = $this->request->post['date_available'];
        } elseif (!empty($receipt_note_info)) {
            $this->data['date_available'] = date('Y-m-d', strtotime($receipt_note_info['date_available']));
        } else {
            $this->data['date_available'] = date('Y-m-d', time() - 86400);
        }
      
         $this->load->model('catalog/manufacturer');

        if (isset($this->request->post['manufacturer_id'])) {
            $this->data['manufacturer_id'] = $this->request->post['manufacturer_id'];
        } elseif (!empty($receipt_note_info)) {
            $this->data['manufacturer_id'] = $receipt_note_info['manufacturer_id'];
        } else {
            $this->data['manufacturer_id'] = 0;
        }
        
        if (isset($this->request->post['manufacturer'])) {
            $this->data['manufacturer'] = $this->request->post['manufacturer'];
        } elseif (!empty($receipt_note_info)){
            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($receipt_note_info['manufacturer_id']);

            if ($manufacturer_info) {
                $this->data['manufacturer'] = $manufacturer_info['name'];
            } else {
                $this->data['manufacturer'] = '';
            }
        } else {
            $this->data['manufacturer'] = '';
        }
        
        $this->load->model('catalog/supplier');

        if (isset($this->request->post['supplier_id'])) {
            $this->data['supplier_id'] = $this->request->post['supplier_id'];
        } elseif (!empty($receipt_note_info)) {
            $this->data['supplier_id'] = $receipt_note_info['supplier_id'];
        } else {
            $this->data['supplier_id'] = 0;
        }
        if (isset($this->request->post['supplier'])) {
            $this->data['supplier'] = $this->request->post['supplier'];
        } elseif (!empty($receipt_note_info)){
            $supplier_info = $this->model_catalog_supplier->getSupplier($receipt_note_info['supplier_id']);

            if ($supplier_info) {
                $this->data['supplier'] = $supplier_info['name'];
            } else {
                $this->data['supplier'] = '';
            }
        } else {
            $this->data['supplier'] = '';
        }
        // Get ReceiptNote
        $this->data['products'] = array();
        $this->load->model('tool/image');
        
        $results = $this->model_warehouse_receipt_note->getProducts();
        foreach ($results as $result) {
            if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
            }
            $this->data['products'][] = array(
                'product_id' => $result['product_id'],
                'name' => $result['name'],
                'model' => $result['model'],
                'image' => $image,
            );
        }
       $this->template = 'warehouse/receipt_note_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'warehouse/receipt_note')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['receipt_note_description'] as $language_id => $value) {
            if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }
        }

        if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
            $this->error['model'] = $this->language->get('error_model');
        }

        if ($this->request->post['color'] == "0") {
            $this->error['model'] = $this->language->get('error_model');
        }


        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateUpDate() {
        if (!$this->user->hasPermission('modify', 'warehouse/receipt_note')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        $receipt_note_total = $this->model_warehouse_receipt_note->getEditTotalReceiptNotesByModelColor($this->request->post['color'], $this->request->post['model']);
        if ($receipt_note_total) {
            $this->error['warning'] = sprintf($this->language->get('error_color_model'), $receipt_note_total);
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateInsert() {
        if (!$this->user->hasPermission('modify', 'warehouse/receipt_note')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        $receipt_note_total = $this->model_warehouse_receipt_note->getTotalReceiptNotesByModelColor($this->request->post['color'], $this->request->post['model']);
        if ($receipt_note_total) {
            $this->error['warning'] = sprintf($this->language->get('error_color_model'), $receipt_note_total);
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'warehouse/receipt_note')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateCopy() {
        if (!$this->user->hasPermission('modify', 'warehouse/receipt_note')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function autocomplete() {
        $json = array();

        if (isset($this->request->get['model_color'])) {
            
            $this->load->model('warehouse/receipt_note');
            if (!isset($this->request->get['model_color']) || empty($this->request->get['model_color'])) {
                $model_color = 0;
            } else {
                 $model_color  = $this->request->get['model_color'];
            }
            if (isset($this->request->get['limit'])) {
                $limit = $this->request->get['limit'];
            } else {
                $limit = 20;
            }

            $data = array(
                'filter_model_color' => $model_color ,
                'start' => 0,
                'limit' => $limit
            );

            $results = $this->model_warehouse_receipt_note->getProducts($data);
            $this->load->model('tool/image');
            foreach ($results as $result) {
                if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
                    $image = $this->model_tool_image->resize($result['image'], 40, 40);
                } else {
                    $image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
                }
                $json[] = array(
                    'product_id' => $result['product_id'],
                     'model_color' => $result['model_color'],
                    'image' => $image,
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'model' => $result['model'],
                    'price' => $result['price']
                );
            }
        }

        $this->response->setOutput(json_encode($json));
    }

}

?>
