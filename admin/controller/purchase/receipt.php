<?php
class ControllerPurchaseReceipt extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('purchase/receipt');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('purchase/receipt');
        $this->getList();
    }

    public function insert() {
        $this->language->load('purchase/receipt');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('purchase/receipt');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_purchase_receipt->addReceipt($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }
            if (isset($this->request->get['filter_warehouse'])) {
                $url .= '&filter_warehouse=' . urlencode(html_entity_decode($this->request->get['filter_warehouse'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }

            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }
            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
            }
            

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['purchase'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->language->load('purchase/receipt');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('purchase/receipt');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_purchase_receipt->editReceipt($this->request->get['purchase_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }
           
            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }
            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }
            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }
            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }
            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
            $this->redirect($this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->language->load('purchase/receipt');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('purchase/receipt');

        if (isset($this->request->post['selected']) && ($this->validateDelete())) {
            foreach ($this->request->post['selected'] as $purchase_id) {
                $this->model_purchase_receipt->deleteReceipt($purchase_id);
            }
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }
          
            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }
            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }
            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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

            $this->redirect($this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        } elseif (isset($this->request->get['purchase_id']) && ($this->validateDelete())) {
            $this->model_purchase_receipt->deleteReceipt($this->request->get['purchase_id']);
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }
           
            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }

            if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }
            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
            $this->redirect($this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['filter_purchase_id'])) {
            $filter_purchase_id = $this->request->get['filter_purchase_id'];
        } else {
            $filter_purchase_id = null;
        }
        if (isset($this->request->get['filter_warehouse'])) {
            $filter_warehouse = $this->request->get['filter_warehouse'];
        } else {
            $filter_warehouse = null;
        }
        if (isset($this->request->get['filter_reference_no'])) {
            $filter_reference_no = $this->request->get['filter_reference_no'];
        } else {
            $filter_reference_no = null;
        }
        if (isset($this->request->get['filter_supplier'])) {
            $filter_supplier = $this->request->get['filter_supplier'];
        } else {
            $filter_supplier = null;
        }
        if (isset($this->request->get['filter_quantity'])) {
            $filter_quantity = $this->request->get['filter_quantity'];
        } else {
            $filter_quantity = null;
        }
        if (isset($this->request->get['filter_total'])) {
            $filter_total = $this->request->get['filter_total'];
        } else {
            $filter_total = null;
        }

        if (isset($this->request->get['filter_date_added'])) {
            $filter_date_added = $this->request->get['filter_date_added'];
        } else {
            $filter_date_added = null;
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $filter_date_modified = $this->request->get['filter_date_modified'];
        } else {
            $filter_date_modified = null;
        }
        if (isset($this->request->get['filter_date_start'])) {
            $filter_date_start = $this->request->get['filter_date_start'];
        } else {
            $filter_date_start = null;
        }
        if (isset($this->request->get['filter_date_end'])) {
            $filter_date_end = $this->request->get['filter_date_end'];
        } else {
            $filter_date_end = null;
        }
      
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'purchase_id';
        }
        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_purchase_id'])) {
            $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
        }
       
        if (isset($this->request->get['filter_reference_no'])) {
            $url .= '&filter_reference_no=' . urlencode(html_entity_decode($this->request->get['filter_reference_no'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_warehouse'])) {
            $url .= '&filter_warehouse=' . $this->request->get['filter_warehouse'];
        }
        if (isset($this->request->get['filter_supplier'])) {
            $url .= '&filter_supplier=' . $this->request->get['filter_supplier'];
        }
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
        }
        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }
        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }
        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
            'href' => $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['invoice'] = $this->url->link('purchase/receipt/invoice', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['insert'] = $this->url->link('purchase/receipt/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('purchase/receipt/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['confirm'] = $this->url->link('purchase/receipt/confirm', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->load->model('purchase/warehouse');
        $this->data['warehouses'] = $this->model_purchase_warehouse->getWarehouses();

        $this->load->model('catalog/supplier');
        $this->data['suppliers'] = $this->model_catalog_supplier->getSuppliers();

        $this->load->model('localisation/purchase_status');
        $this->data['purchase_statuses'] = $this->model_localisation_purchase_status->getPurchaseStatuses();

        $this->data['purchases'] = array();
        $data = array(
           
            'filter_purchase_id' => $filter_purchase_id,
            'filter_supplier' => $filter_supplier,
            'filter_warehouse' => $filter_warehouse,
            'filter_reference_no' => $filter_reference_no,
            'filter_quantity' => $filter_quantity,
            'filter_total' => $filter_total,
            'filter_date_added' => $filter_date_added,
            'filter_date_modified' => $filter_date_modified,
            'filter_date_start' => $filter_date_start,
            'filter_date_end' => $filter_date_end,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );
        $purchase_total = $this->model_purchase_receipt->getTotalReceipts($data);
        $results = $this->model_purchase_receipt->getReceipts($data);
        $i = 1;
        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'index' => 0,
                'text' => $this->language->get('text_view'),
                'href' => $this->url->link('purchase/receipt/invoice', 'token=' . $this->session->data['token'] . '&purchase_id=' . $result['purchase_id'] . $url, 'SSL')
            );
            $action[] = array(
                'index' => 1,
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('purchase/receipt/update', 'token=' . $this->session->data['token'] . '&purchase_id=' . $result['purchase_id'] . $url, 'SSL')
            );
            $action[] = array(
                'index' => 2,
                'text' => $this->language->get('text_delete'),
                'href' => $this->url->link('purchase/receipt/delete', 'token=' . $this->session->data['token'] . '&purchase_id=' . $result['purchase_id'] . $url, 'SSL')
            );
              $action[] = array(
                'index' => 3,
                'text' => $this->language->get('text_comfirm'),
                'href' => $this->url->link('purchase/receipt/confirm', 'token=' . $this->session->data['token'] . '&purchase_id=' . $result['purchase_id'] . $url, 'SSL')
            );
            $this->data['purchases'][] = array(
                'index' => $i++,
                'purchase_id' => $result['purchase_id'],
                'supplier' => $result['supplier'],
                'reference_no' => $result['reference_no'],
                'quantity' => $result['quantity'],
                'total' => $this->currency->format($result['total']),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
                'selected' => isset($this->request->post['selected']) && in_array($result['purchase_id'], $this->request->post['selected']),
                'action' => $action
            );
        }

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['text_missing'] = $this->language->get('text_missing');
        $this->data['text_all_status'] = $this->language->get('text_all_status');
        $this->data['text_all_warehouse'] = $this->language->get('text_all_warehouse');
        $this->data['text_all_supplier'] = $this->language->get('text_all_supplier');

        $this->data['entry_warehouse'] = $this->language->get('entry_warehouse');
        $this->data['entry_supplier'] = $this->language->get('entry_supplier');
        $this->data['entry_date_start'] = $this->language->get('entry_date_start');
        $this->data['entry_date_end'] = $this->language->get('entry_date_end');
        $this->data['entry_group'] = $this->language->get('entry_group');
        $this->data['entry_status'] = $this->language->get('entry_status');

        $this->data['column_purchase_id'] = $this->language->get('column_purchase_id');
        $this->data['column_supplier'] = $this->language->get('column_supplier');
        $this->data['column_warehouse'] = $this->language->get('column_warehouse');
        $this->data['column_index'] = $this->language->get('column_index');
        $this->data['column_reference_no'] = $this->language->get('column_reference_no');
        $this->data['column_total'] = $this->language->get('column_total');
        $this->data['column_quantity'] = $this->language->get('column_quantity');
        $this->data['column_date_added'] = $this->language->get('column_date_added');
        $this->data['column_date_modified'] = $this->language->get('column_date_modified');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_invoice'] = $this->language->get('button_invoice');
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
        if (isset($this->request->get['filter_purchase_id'])) {
            $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
        }
      
        if (isset($this->request->get['filter_supplier'])) {
            $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_warehouse'])) {
            $url .= '&filter_warehouse=' . urlencode(html_entity_decode($this->request->get['filter_warehouse'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_reference_no'])) {
            $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
        }
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
        }
        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }
        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }
        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }
        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }
        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $this->data['sort_quantity'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . '&sort=quantity' . $url, 'SSL');
        $this->data['sort_purchase_id'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . '&sort=purchase_id' . $url, 'SSL');
        $this->data['sort_reference_no'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . '&sort=reference_no' . $url, 'SSL');
        $this->data['sort_total'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . '&sort=total' . $url, 'SSL');
        $this->data['sort_date_added'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');
        $this->data['sort_date_modified'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . '&sort=date_modified' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['filter_purchase_id'])) {
            $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
        }
       
        if (isset($this->request->get['filter_supplier'])) {
            $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_warehouse'])) {
            $url .= '&filter_warehouse=' . urlencode(html_entity_decode($this->request->get['filter_warehouse'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_reference_no'])) {
            $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
        }
        if (isset($this->request->get['filter_quantity'])) {
            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
        }
        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }
        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }
        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }
        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }
        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $purchase_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();
        $this->data['filter_purchase_id'] = $filter_purchase_id;
        $this->data['filter_supplier'] = $filter_supplier;
        $this->data['filter_quantity'] = $filter_quantity;
        $this->data['filter_warehouse'] = $filter_warehouse;
        $this->data['filter_reference_no'] = $filter_reference_no;
        $this->data['filter_total'] = $filter_total;
        $this->data['filter_date_added'] = $filter_date_added;
        $this->data['filter_date_modified'] = $filter_date_modified;
        $this->data['filter_date_start'] = $filter_date_start;
        $this->data['filter_date_end'] = $filter_date_end;

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;

        $this->template = 'purchase/receipt_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function getForm() {

        $this->data['text_size'] = $this->language->get('text_size');
        $this->data['text_color'] = $this->language->get('text_color');

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        //  $this->data['text_default'] = $this->language->get('text_default');
        $this->data['text_select'] = $this->language->get('text_select');
        //  $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_wait'] = $this->language->get('text_wait');
        $this->data['text_purchase'] = $this->language->get('text_purchase');
        $this->data['text_product'] = $this->language->get('text_product');
        $this->data['text_voucher'] = $this->language->get('text_voucher');

        $this->data['entry_supplier'] = $this->language->get('entry_supplier');
        $this->data['entry_name'] = $this->language->get('entry_name');

        $this->data['entry_note'] = $this->language->get('entry_note');
        $this->data['entry_code'] = $this->language->get('entry_code');
        $this->data['entry_quantity'] = $this->language->get('entry_quantity');

        $this->data['column_mc'] = $this->language->get('column_mc');
        $this->data['column_mcs'] = $this->language->get('column_mcs');
        $this->data['column_purchase'] = $this->language->get('column_purchase');
        $this->data['column_product'] = $this->language->get('column_product');
        $this->data['column_model'] = $this->language->get('column_model');
        $this->data['column_quantity'] = $this->language->get('column_quantity');
        $this->data['column_price'] = $this->language->get('column_price');
        $this->data['column_total'] = $this->language->get('column_total');
        $this->data['total'] = $this->language->get('total');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_product'] = $this->language->get('button_add_product');
        $this->data['button_remove'] = $this->language->get('button_remove');
        $this->data['button_upload'] = $this->language->get('button_upload');

        $this->data['entry_date'] = $this->language->get('entry_date');
        $this->data['entry_reference_no'] = $this->language->get('entry_reference_no');
        $this->data['entry_warehouse'] = $this->language->get('entry_warehouse');
        $this->data['entry_supplier'] = $this->language->get('entry_supplier');

        $this->data['tab_name'] = $this->language->get('tab_name');
        $this->data['tab_code'] = $this->language->get('tab_code');


        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        if (isset($this->error['reference_no'])) {
            $this->data['error_reference_no'] = $this->error['reference_no'];
        } else {
            $this->data['error_reference_no'] = '';
        }
        if (isset($this->error['warehouse'])) {
            $this->data['error_warehouse'] = $this->error['warehouse'];
        } else {
            $this->data['error_warehouse'] = '';
        }
        if (isset($this->error['supplier'])) {
            $this->data['error_supplier'] = $this->error['supplier'];
        } else {
            $this->data['error_supplier'] = '';
        }
        if (isset($this->error['date_modified'])) {
            $this->data['error_date_modified'] = $this->error['date_modified'];
        } else {
            $this->data['error_date_modified'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_purchase_id'])) {
            $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
        }

        if (isset($this->request->get['filter_supplier'])) {
            $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_reference_no'])) {
            $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
        }

        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
            'href' => $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['purchase_id'])) {
            $this->data['action'] = $this->url->link('purchase/receipt/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('purchase/receipt/update', 'token=' . $this->session->data['token'] . '&purchase_id=' . $this->request->get['purchase_id'] . $url, 'SSL');
        }

        $this->data['cancel'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['purchase_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);
        }

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->get['purchase_id'])) {
            $this->data['purchase_id'] = $this->request->get['purchase_id'];
        } else {
            $this->data['purchase_id'] = 0;
        }
        if (isset($this->request->post['supplier'])) {
            $this->data['supplier'] = $this->request->post['supplier'];
        } elseif (!empty($purchase_info)) {
            $this->data['supplier'] = $purchase_info['supplier'];
        } else {
            $this->data['supplier'] = '';
        }
        if (isset($this->request->post['note'])) {
            $this->data['note'] = $this->request->post['note'];
        } elseif (!empty($purchase_info)) {
            $this->data['note'] = $purchase_info['note'];
        } else {
            $this->data['note'] = '';
        }
        if (isset($this->request->post['quantity'])) {
            $this->data['quantity'] = $this->request->post['quantity'];
        } elseif (!empty($purchase_info)) {
            $this->data['quantity'] = $purchase_info['quantity'];
        } else {
            $this->data['quantity'] = '';
        }
        if (isset($this->request->post['total'])) {
            $this->data['total'] = $this->request->post['total'];
        } elseif (!empty($purchase_info)) {
            $this->data['total'] = $purchase_info['total'];
        } else {
            $this->data['total'] = '';
        }
        if (isset($this->request->post['total'])) {
            $this->data['total_text'] = $this->currency->format($this->request->post['total']);
        } elseif (!empty($purchase_info)) {
            $this->data['total_text'] = $this->currency->format($purchase_info['total']);
        } else {
            $this->data['total_text'] = '';
        }

        if (isset($this->request->post['supplier_id'])) {
            $this->data['supplier_id'] = $this->request->post['supplier_id'];
        } elseif (!empty($purchase_info)) {
            $this->data['supplier_id'] = $purchase_info['supplier_id'];
        } else {
            $this->data['supplier_id'] = '';
        }
        if (isset($this->request->post['warehouse_id'])) {
            $this->data['warehouse_id'] = $this->request->post['warehouse_id'];
        } elseif (!empty($purchase_info)) {
            $this->data['warehouse_id'] = $purchase_info['warehouse_id'];
        } else {
            $this->data['warehouse_id'] = '';
        }

        $this->load->model('purchase/warehouse');
        $this->data['warehouses'] = array();
        $this->data['warehouses'] = $this->model_purchase_warehouse->getWarehouses();

        if (isset($this->request->post['date_added'])) {
            $this->data['date_added'] = $this->request->post['date_added'];
        } elseif (!empty($purchase_info)) {
            $this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($purchase_info['date_added']));
        } else {
            $this->data['date_added'] = date($this->language->get('date_format_short'));
        }
        if (isset($this->request->post['reference_no'])) {
            $this->data['reference_no'] = $this->request->post['reference_no'];
        } elseif (!empty($purchase_info)) {
            $this->data['reference_no'] = $purchase_info['reference_no'];
        } else {
            $this->data['reference_no'] = $this->config->get('config_receipt_prefix') . $this->model_purchase_receipt->getTotalDate($this->data['date_added']);
        }

        $this->load->model('purchase/receipt');
        $this->document->addScript('view/javascript/jquery/ajaxupload.js');

        //  $color = $this->model_catalog_product->getColorName($result['color']);
          //  $size = $this->model_catalog_product->getSizeName($result['size']);
        $this->data['purchase_products'] = array();
        $purchase_products = $this->model_purchase_receipt->getReceiptProducts($this->data['purchase_id']);

        foreach ($purchase_products as $purchase_product) {
            $this->data['purchase_products'][] = array(
                'product_id' => $purchase_product['product_id'],
                'name' => $purchase_product['name'],
                'model' => $purchase_product['model'],
                'mc' => $purchase_product['mc'],
                'mcs' => $purchase_product['mcs'],
                'size' => $purchase_product['size'],
                'color' => $purchase_product['color'],
                'quantity' => $purchase_product['quantity'],
                'price' => $purchase_product['price'],
                'total' => $purchase_product['total'],
                'price_text' => $this->currency->format($purchase_product['price']),
                'total_text' => $this->currency->format($purchase_product['total']),
            );
        }

        $this->template = 'purchase/receipt_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function addProduct() {

        $json = array();
        $this->language->load('purchase/receipt');
        $json['text_color'] = $this->language->get('text_color');
        $json['text_size'] = $this->language->get('text_size');

        $this->load->library('receipt');
        $this->receipt = new Receipt($this->registry);
        if ($this->user->isLogged() && $this->user->hasPermission('modify', 'purchase/receipt')) {
            // Product
            $this->load->model('purchase/receipt');
            if (isset($this->request->post['product_id'])) {
                $product_info = $this->model_purchase_receipt->getProduct($this->request->post['product_id']);
                if ($product_info) {
                    if (isset($this->request->post['quantity'])) {
                        $quantity = $this->request->post['quantity'];
                    } else {
                        $quantity = 1;
                    }
                    $this->receipt->add($this->request->post['product_id'], $quantity);
                }
            }
            if (isset($this->request->post['purchase_product'])) {
                foreach ($this->request->post['purchase_product'] as $purchase_product) {
                    $product_info = $this->model_purchase_receipt->getProduct($purchase_product['product_id']);
                    if ($product_info) {
                        $this->receipt->add($purchase_product['product_id'], $purchase_product['quantity']);
                    }
                }
            }

            // Products
            $json['purchase_product'] = array();
            $products = $this->receipt->getProducts();
            foreach ($products as $product) {
                $json['purchase_product'][] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'mcs' => $product['mcs'],
                    'mc' => $product['mc'],
                    'size' => $product['size'],
                    'color' => $product['color'],
                    'quantity' => $product['quantity'],
                    'stock' => $product['stock'],
                    'price' => $product['price'],
                    'total' => $product['total'],
                    'price_text' => $this->currency->format($product['price']),
                    'total_text' => $this->currency->format($product['total'])
                );
            }
            $json['total'] = $this->receipt->getSubTotal();
            $json['quantity'] = $this->receipt->countProducts();
            $json['total_text'] = $this->currency->format($this->receipt->getSubTotal());
            $this->receipt->clear();
        } else {
            $json['error']['warning'] = $this->language->get('error_permission');
        }

        $this->response->setOutput(json_encode($json));
    }

    public function barcode() {

        $json = array();
        $this->language->load('purchase/receipt');
        $json['text_color'] = $this->language->get('text_color');
        $json['text_size'] = $this->language->get('text_size');

        $this->load->library('receipt');
        $this->receipt = new Receipt($this->registry);

        if ($this->user->isLogged() && $this->user->hasPermission('modify', 'purchase/receipt')) {
            // Product
            $this->load->model('purchase/receipt');

            if (isset($this->request->get['barcode'])) {
                $product_info = $this->model_purchase_receipt->getProductBarcode($this->request->get['barcode']);

                if ($product_info) {
                    $this->receipt->add($product_info['product_id'], 1);
                }
            }
            if (isset($this->request->post['purchase_product'])) {
                foreach ($this->request->post['purchase_product'] as $purchase_product) {
                    $product_info = $this->model_purchase_receipt->getProduct($purchase_product['product_id']);

                    if ($product_info) {
                        $this->receipt->add($purchase_product['product_id'], $purchase_product['quantity']);
                    }
                }
            }
            // Products
            $json['purchase_product'] = array();
            $products = $this->receipt->getProducts();
            foreach ($products as $product) {

                $json['purchase_product'][] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'mcs' => $product['mcs'],
                    'mc' => $product['mc'],
                    'size' => $product['size'],
                    'color' => $product['color'],
                    'quantity' => $product['quantity'],
                    'stock' => $product['stock'],
                    'price' => $product['price'],
                    'total' => $product['total'],
                    'price_text' => $this->currency->format($product['price']),
                    'total_text' => $this->currency->format($product['total'])
                );
            }
            $json['total'] = $this->receipt->getSubTotal();
            $json['quantity'] = $this->receipt->countProducts();
            $json['total_text'] = $this->currency->format($this->receipt->getSubTotal());
            $this->receipt->clear();
        } else {
            $json['error']['warning'] = $this->language->get('error_permission');
        }

        $this->response->setOutput(json_encode($json));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $this->error['warning'] = $this->language->get('error_permission');
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
      protected function validateConfirm() {
        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
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

    public function info() {
        $this->load->model('purchase/receipt');

        if (isset($this->request->get['purchase_id'])) {
            $purchase_id = $this->request->get['purchase_id'];
        } else {
            $purchase_id = 0;
        }

        $purchase_info = $this->model_purchase_receipt->getReceipt($purchase_id);

        if ($purchase_info) {
            $this->language->load('purchase/receipt');

            $this->document->setTitle($this->language->get('heading_title'));

            $this->data['heading_title'] = $this->language->get('heading_title');

            $this->data['text_purchase_id'] = $this->language->get('text_purchase_id');
            $this->data['text_invoice_no'] = $this->language->get('text_invoice_no');
            $this->data['text_invoice_date'] = $this->language->get('text_invoice_date');
            $this->data['text_store_name'] = $this->language->get('text_store_name');
            $this->data['text_store_url'] = $this->language->get('text_store_url');
            $this->data['text_supplier'] = $this->language->get('text_supplier');
            $this->data['text_supplier_group'] = $this->language->get('text_supplier_group');
            $this->data['text_email'] = $this->language->get('text_email');
            $this->data['text_telephone'] = $this->language->get('text_telephone');
            $this->data['text_fax'] = $this->language->get('text_fax');
            $this->data['text_total'] = $this->language->get('text_total');
            $this->data['text_reward'] = $this->language->get('text_reward');
            $this->data['text_purchase_status'] = $this->language->get('text_purchase_status');
            //    $this->data['text_note'] = $this->language->get('text_note');
            $this->data['text_affiliate'] = $this->language->get('text_affiliate');
            $this->data['text_commission'] = $this->language->get('text_commission');
            $this->data['text_ip'] = $this->language->get('text_ip');
            $this->data['text_forwarded_ip'] = $this->language->get('text_forwarded_ip');
            $this->data['text_user_agent'] = $this->language->get('text_user_agent');
            $this->data['text_accept_language'] = $this->language->get('text_accept_language');
            $this->data['text_date_added'] = $this->language->get('text_date_added');
            $this->data['text_date_modified'] = $this->language->get('text_date_modified');
            $this->data['text_firstname'] = $this->language->get('text_firstname');
            $this->data['text_lastname'] = $this->language->get('text_lastname');
            $this->data['text_company'] = $this->language->get('text_company');
            $this->data['text_company_id'] = $this->language->get('text_company_id');
            $this->data['text_tax_id'] = $this->language->get('text_tax_id');
            $this->data['text_address_1'] = $this->language->get('text_address_1');
            $this->data['text_address_2'] = $this->language->get('text_address_2');
            $this->data['text_city'] = $this->language->get('text_city');
            $this->data['text_postcode'] = $this->language->get('text_postcode');
            $this->data['text_zone'] = $this->language->get('text_zone');
            $this->data['text_zone_code'] = $this->language->get('text_zone_code');
            $this->data['text_country'] = $this->language->get('text_country');
            $this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
            $this->data['text_payment_method'] = $this->language->get('text_payment_method');
            $this->data['text_download'] = $this->language->get('text_download');
            $this->data['text_wait'] = $this->language->get('text_wait');
            $this->data['text_generate'] = $this->language->get('text_generate');
            $this->data['text_reward_add'] = $this->language->get('text_reward_add');
            $this->data['text_reward_remove'] = $this->language->get('text_reward_remove');
            $this->data['text_commission_add'] = $this->language->get('text_commission_add');
            $this->data['text_commission_remove'] = $this->language->get('text_commission_remove');
            $this->data['text_credit_add'] = $this->language->get('text_credit_add');
            $this->data['text_credit_remove'] = $this->language->get('text_credit_remove');
            $this->data['text_country_match'] = $this->language->get('text_country_match');
            $this->data['text_country_code'] = $this->language->get('text_country_code');
            $this->data['text_high_risk_country'] = $this->language->get('text_high_risk_country');
            $this->data['text_distance'] = $this->language->get('text_distance');
            $this->data['text_ip_region'] = $this->language->get('text_ip_region');
            $this->data['text_ip_city'] = $this->language->get('text_ip_city');
            $this->data['text_ip_latitude'] = $this->language->get('text_ip_latitude');
            $this->data['text_ip_longitude'] = $this->language->get('text_ip_longitude');
            $this->data['text_ip_isp'] = $this->language->get('text_ip_isp');
            $this->data['text_ip_org'] = $this->language->get('text_ip_org');
            $this->data['text_ip_asnum'] = $this->language->get('text_ip_asnum');
            $this->data['text_ip_user_type'] = $this->language->get('text_ip_user_type');
            $this->data['text_ip_country_confidence'] = $this->language->get('text_ip_country_confidence');
            $this->data['text_ip_region_confidence'] = $this->language->get('text_ip_region_confidence');
            $this->data['text_ip_city_confidence'] = $this->language->get('text_ip_city_confidence');
            $this->data['text_ip_postal_confidence'] = $this->language->get('text_ip_postal_confidence');
            $this->data['text_ip_postal_code'] = $this->language->get('text_ip_postal_code');
            $this->data['text_ip_accuracy_radius'] = $this->language->get('text_ip_accuracy_radius');
            $this->data['text_ip_net_speed_cell'] = $this->language->get('text_ip_net_speed_cell');
            $this->data['text_ip_metro_code'] = $this->language->get('text_ip_metro_code');
            $this->data['text_ip_area_code'] = $this->language->get('text_ip_area_code');
            $this->data['text_ip_time_zone'] = $this->language->get('text_ip_time_zone');
            $this->data['text_ip_region_name'] = $this->language->get('text_ip_region_name');
            $this->data['text_ip_domain'] = $this->language->get('text_ip_domain');
            $this->data['text_ip_country_name'] = $this->language->get('text_ip_country_name');
            $this->data['text_ip_continent_code'] = $this->language->get('text_ip_continent_code');
            $this->data['text_ip_corporate_proxy'] = $this->language->get('text_ip_corporate_proxy');
            $this->data['text_anonymous_proxy'] = $this->language->get('text_anonymous_proxy');
            $this->data['text_proxy_score'] = $this->language->get('text_proxy_score');
            $this->data['text_is_trans_proxy'] = $this->language->get('text_is_trans_proxy');
            $this->data['text_free_mail'] = $this->language->get('text_free_mail');
            $this->data['text_carder_email'] = $this->language->get('text_carder_email');
            $this->data['text_high_risk_username'] = $this->language->get('text_high_risk_username');
            $this->data['text_high_risk_password'] = $this->language->get('text_high_risk_password');
            $this->data['text_bin_match'] = $this->language->get('text_bin_match');
            $this->data['text_bin_country'] = $this->language->get('text_bin_country');
            $this->data['text_bin_name_match'] = $this->language->get('text_bin_name_match');
            $this->data['text_bin_name'] = $this->language->get('text_bin_name');
            $this->data['text_bin_phone_match'] = $this->language->get('text_bin_phone_match');
            $this->data['text_bin_phone'] = $this->language->get('text_bin_phone');
            //   $this->data['text_supplier'] = $this->language->get('text_supplier');
            $this->data['text_ship_forward'] = $this->language->get('text_ship_forward');
            $this->data['text_city_postal_match'] = $this->language->get('text_city_postal_match');
            $this->data['text_ship_city_postal_match'] = $this->language->get('text_ship_city_postal_match');
            $this->data['text_score'] = $this->language->get('text_score');
            $this->data['text_explanation'] = $this->language->get('text_explanation');
            $this->data['text_risk_score'] = $this->language->get('text_risk_score');
            $this->data['text_queries_remaining'] = $this->language->get('text_queries_remaining');
            $this->data['text_maxmind_id'] = $this->language->get('text_maxmind_id');
            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['column_purchase_id'] = $this->language->get('column_purchase_id');
            $this->data['column_mc'] = $this->language->get('column_mc');
            $this->data['column_mcs'] = $this->language->get('column_mcs');
            $this->data['column_model'] = $this->language->get('column_model');
            $this->data['column_quantity'] = $this->language->get('column_quantity');
            $this->data['column_price'] = $this->language->get('column_price');
            $this->data['column_total'] = $this->language->get('column_total');
            $this->data['column_download'] = $this->language->get('column_download');
            $this->data['column_filename'] = $this->language->get('column_filename');
            $this->data['column_remaining'] = $this->language->get('column_remaining');

            $this->data['entry_purchase_status'] = $this->language->get('entry_purchase_status');
            $this->data['entry_notify'] = $this->language->get('entry_notify');
            $this->data['entry_note'] = $this->language->get('entry_note');

            $this->data['button_invoice'] = $this->language->get('button_invoice');
            $this->data['button_cancel'] = $this->language->get('button_cancel');
            $this->data['button_add_history'] = $this->language->get('button_add_history');

            $this->data['tab_purchase'] = $this->language->get('tab_purchase');
            $this->data['tab_payment'] = $this->language->get('tab_payment');
            $this->data['tab_shipping'] = $this->language->get('tab_shipping');
            $this->data['tab_purchase'] = $this->language->get('tab_purchase');
            $this->data['tab_history'] = $this->language->get('tab_history');
            $this->data['tab_fraud'] = $this->language->get('tab_fraud');

            $this->data['token'] = $this->session->data['token'];

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }

            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }

            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
                'href' => $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'),
                'separator' => ' :: '
            );

            $this->data['invoice'] = $this->url->link('purchase/receipt/invoice', 'token=' . $this->session->data['token'] . '&purchase_id=' . (int) $this->request->get['purchase_id'], 'SSL');
            $this->data['cancel'] = $this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL');
            $this->data['purchase_id'] = $this->request->get['purchase_id'];


            $this->data['purchases'] = array();

            $purchases = $this->model_purchase_receipt->getReceiptProducts($this->request->get['purchase_id']);

            foreach ($purchases as $purchase) {
                $this->data['purchases'][] = array(
                    'product_id' => $purchase['product_id'],
                    'purchase_id' => $purchase['purchase_id'],
                    'name' => $purchase['name'],
                    'model' => $purchase['model'],
                    'mcs' => $purchase['mcs'],
                    'mc' => $purchase['mc'],
                    'color' => $purchase['color'],
                    'size' => $purchase['size'],
                    'quantity' => $purchase['quantity'],
                    'price' => $purchase['price'],
                    'total' => $purchase['total'],
                    'price_text' => $this->currency->format($purchase['price']),
                    'total_text' => $this->currency->format($purchase['total']),);
            }

            $this->template = 'purchase/receipt_info.tpl';
            $this->children = array(
                'common/header',
                'common/footer'
            );

            $this->response->setOutput($this->render());
        } else {
            $this->language->load('error/not_found');

            $this->document->setTitle($this->language->get('heading_title'));

            $this->data['heading_title'] = $this->language->get('heading_title');

            $this->data['text_not_found'] = $this->language->get('text_not_found');

            $this->data['breadcrumbs'] = array();

            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => false
            );

            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );

            $this->template = 'error/not_found.tpl';
            $this->children = array(
                'common/header',
                'common/footer'
            );

            $this->response->setOutput($this->render());
        }
    }

    public function createInvoiceNo() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $invoice_no = $this->model_purchase_receipt->createInvoiceNo($this->request->get['purchase_id']);

            if ($invoice_no) {
                $json['invoice_no'] = $invoice_no;
            } else {
                $json['error'] = $this->language->get('error_action');
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    public function addCredit() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);

            if ($purchase_info && $purchase_info['supplier_id']) {
                $this->load->model('sale/supplier');

                $credit_total = $this->model_sale_supplier->getTotalTransactionsByReceiptId($this->request->get['purchase_id']);

                if (!$credit_total) {
                    $this->model_sale_supplier->addTransaction($purchase_info['supplier_id'], $this->language->get('text_purchase_id') . ' #' . $this->request->get['purchase_id'], $purchase_info['total'], $this->request->get['purchase_id']);

                    $json['success'] = $this->language->get('text_credit_added');
                } else {
                    $json['error'] = $this->language->get('error_action');
                }
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    public function removeCredit() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);

            if ($purchase_info && $purchase_info['supplier_id']) {
                $this->load->model('sale/supplier');

                $this->model_sale_supplier->deleteTransaction($this->request->get['purchase_id']);

                $json['success'] = $this->language->get('text_credit_removed');
            } else {
                $json['error'] = $this->language->get('error_action');
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    public function addReward() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);

            if ($purchase_info && $purchase_info['supplier_id']) {
                $this->load->model('sale/supplier');

                $reward_total = $this->model_sale_supplier->getTotalCustomerRewardsByReceiptId($this->request->get['purchase_id']);

                if (!$reward_total) {
                    $this->model_sale_supplier->addReward($purchase_info['supplier_id'], $this->language->get('text_purchase_id') . ' #' . $this->request->get['purchase_id'], $purchase_info['reward'], $this->request->get['purchase_id']);

                    $json['success'] = $this->language->get('text_reward_added');
                } else {
                    $json['error'] = $this->language->get('error_action');
                }
            } else {
                $json['error'] = $this->language->get('error_action');
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    public function removeReward() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);

            if ($purchase_info && $purchase_info['supplier_id']) {
                $this->load->model('sale/supplier');

                $this->model_sale_supplier->deleteReward($this->request->get['purchase_id']);

                $json['success'] = $this->language->get('text_reward_removed');
            } else {
                $json['error'] = $this->language->get('error_action');
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    public function addCommission() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);

            if ($purchase_info && $purchase_info['affiliate_id']) {
                $this->load->model('sale/affiliate');

                $affiliate_total = $this->model_sale_affiliate->getTotalTransactionsByReceiptId($this->request->get['purchase_id']);

                if (!$affiliate_total) {
                    $this->model_sale_affiliate->addTransaction($purchase_info['affiliate_id'], $this->language->get('text_purchase_id') . ' #' . $this->request->get['purchase_id'], $purchase_info['commission'], $this->request->get['purchase_id']);

                    $json['success'] = $this->language->get('text_commission_added');
                } else {
                    $json['error'] = $this->language->get('error_action');
                }
            } else {
                $json['error'] = $this->language->get('error_action');
            }
        }

        $this->response->setOutput(json_encode($json));
    }

    public function removeCommission() {
        $this->language->load('purchase/receipt');

        $json = array();

        if (!$this->user->hasPermission('modify', 'purchase/receipt')) {
            $json['error'] = $this->language->get('error_permission');
        } elseif (isset($this->request->get['purchase_id'])) {
            $this->load->model('purchase/receipt');

            $purchase_info = $this->model_purchase_receipt->getReceipt($this->request->get['purchase_id']);

            if ($purchase_info && $purchase_info['affiliate_id']) {
                $this->load->model('sale/affiliate');

                $this->model_sale_affiliate->deleteTransaction($this->request->get['purchase_id']);

                $json['success'] = $this->language->get('text_commission_removed');
            } else {
                $json['error'] = $this->language->get('error_action');
            }
        }

        $this->response->setOutput(json_encode($json));
    }
    public function invoice() {
        $this->language->load('purchase/receipt');

        $this->data['title'] = $this->language->get('heading_title');

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }
        $this->data['direction'] = $this->language->get('direction');
        $this->data['language'] = $this->language->get('code');
        $this->data['text_color'] = $this->language->get('text_color');
        $this->data['text_size'] = $this->language->get('text_size');
        $this->data['text_invoice'] = $this->language->get('text_invoice');
        $this->data['text_purchase_id'] = $this->language->get('text_purchase_id');
        $this->data['text_reference_no'] = $this->language->get('text_reference_no');
        $this->data['text_invoice_date'] = $this->language->get('text_invoice_date');
        $this->data['text_date_added'] = $this->language->get('text_date_added');
        $this->data['text_telephone'] = $this->language->get('text_telephone');
        $this->data['text_fax'] = $this->language->get('text_fax');
        $this->data['text_to'] = $this->language->get('text_to');
        $this->data['text_company_id'] = $this->language->get('text_company_id');
        $this->data['text_tax_id'] = $this->language->get('text_tax_id');
        $this->data['text_ship_to'] = $this->language->get('text_ship_to');
        $this->data['text_address'] = $this->language->get('text_address');
        $this->data['text_email'] = $this->language->get('text_email');
        $this->data['text_url'] = $this->language->get('text_url');
        $this->data['text_total'] = $this->language->get('text_total');
        $this->data['text_owner'] = $this->language->get('text_owner');
        $this->data['text_store'] = $this->language->get('text_store');
        $this->data['column_product'] = $this->language->get('column_product');
        $this->data['column_model'] = $this->language->get('column_model');
        $this->data['column_mc'] = $this->language->get('column_mc');
        $this->data['column_mcs'] = $this->language->get('column_mcs');
        $this->data['column_quantity'] = $this->language->get('column_quantity');
        $this->data['column_price'] = $this->language->get('column_price');
        $this->data['column_total'] = $this->language->get('column_total');
        $this->data['column_note'] = $this->language->get('column_note');
        $this->load->model('purchase/receipt');
        $this->load->model('setting/setting');
        $this->data['purchases'] = array();
        $purchases = array();
        if (isset($this->request->post['selected'])) {
            $purchases = $this->request->post['selected'];
        } elseif (isset($this->request->get['purchase_id'])) {
            $purchases[] = $this->request->get['purchase_id'];
        }
        foreach ($purchases as $purchase_id) {
            $purchase_info = $this->model_purchase_receipt->getReceipt($purchase_id);
            if ($purchase_info['reference_no']) {
                $reference_no = $purchase_info['reference_no'];
            } else {
                $reference_no = '';
            }
            if ($purchase_info['warehouse_id']) {
                $warehouse = $purchase_info['warehouse_id'];
            } else {
                $warehouse = '';
            }
            if ($purchase_info['supplier']) {
                $supplier = $purchase_info['supplier'];
            } else {
                $supplier = '';
            }
            if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
                $store_url = HTTPS_CATALOG;
            } else {
                $store_url = HTTP_CATALOG;
            }
            $store_address = $this->config->get('config_address');
            $store_email = $this->config->get('config_email');
            $store_telephone = $this->config->get('config_telephone');
            $store_fax = $this->config->get('config_fax');
            $store_name = $this->config->get('config_name');
            $store_owner = $this->config->get('config_owner');
            $purchase_data = array();
            $purchases = $this->model_purchase_receipt->getReceiptProducts($purchase_id);
            foreach ($purchases as $purchase) {
                $purchase_data[] = array(
                    'name' => $purchase['name'],
                    'model' => $purchase['model'],
                    'mc' => $purchase['mc'],
                    'mcs' => $purchase['mcs'],
                    'size' => $purchase['size'],
                    'color' => $purchase['color'],
                    'quantity' => $purchase['quantity'],
                    'price' => $this->currency->format($purchase['price']),
                    'total' => $this->currency->format($purchase['total'])
                );
            }
            $this->data['purchases'][] = array(
                'purchase_id' => $purchase_id,
                'reference_no' => $purchase_info['reference_no'],
                'warehouse' => $warehouse,
                'supplier' => $purchase_info['supplier'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($purchase_info['date_added'])),
                'store_name' => $store_name,
                'store_url' => rtrim($store_url, '/'),
                'store_address' => nl2br($store_address),
                'store_email' => $store_email,
                'store_telephone' => $store_telephone,
                'store_fax' => $store_fax,
                'store_owner' => $store_owner,
                'purchase' => $purchase_data,
                'total' => $this->currency->format($purchase_info['total']),
            );
        }
        $this->template = 'purchase/receipt_invoice.tpl';
        $this->response->setOutput($this->render());
    }

    public function autocomplete() {
        $json = array();

        if (isset($this->request->get['filter_supplier']) || isset($this->request->get['filter_reference_no']) || isset($this->request->get['filter_warehouse'])) {
            $this->load->model('purchase/receipt');
            if (isset($this->request->get['filter_supplier'])) {
                $filter_supplier = $this->request->get['filter_supplier'];
            } else {
                $filter_supplier = '';
            }
            if (isset($this->request->get['filter_reference_no'])) {
                $filter_reference_no = $this->request->get['filter_reference_no'];
            } else {
                $filter_reference_no = '';
            }
            if (isset($this->request->get['filter_warehouse'])) {
                $filter_warehouse = $this->request->get['filter_warehouse'];
            } else {
                $filter_warehouse = '';
            }
            $data = array(
                'filter_supplier' => $filter_supplier,
                'filter_reference_no' => $filter_reference_no,
                'filter_warehouse' => $filter_warehouse,
                'start' => 0,
                'limit' => 20
            );
            $results = $this->model_purchase_receipt->getReceipts($data);
            foreach ($results as $result) {
                $json[] = array(
                    'purchase_id' => $result['purchase_id'],
                    'warehouse' => $result['name'],
                    'reference_no' => $result['reference_no'],
                    'supplier' => strip_tags(html_entity_decode($result['supplier'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }
        $this->response->setOutput(json_encode($json));
    }

public function confirm() {
        $this->language->load('purchase/receipt');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('purchase/receipt');

        if (isset($this->request->post['selected']) && ($this->validateConfirm())) {
            foreach ($this->request->post['selected'] as $purchase_id) {
                $this->model_purchase_receipt->confirmReceipt($purchase_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }

            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }
             if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }
            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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

            $this->redirect($this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        } elseif (isset($this->request->get['purchase_id']) && ($this->validateConfirm())) {
            $this->model_purchase_receipt->comfirmReceipt($this->request->get['purchase_id']);
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_purchase_id'])) {
                $url .= '&filter_purchase_id=' . $this->request->get['filter_purchase_id'];
            }

            if (isset($this->request->get['filter_supplier'])) {
                $url .= '&filter_supplier=' . urlencode(html_entity_decode($this->request->get['filter_supplier'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_reference_no'])) {
                $url .= '&filter_reference_no=' . $this->request->get['filter_reference_no'];
            }
             if (isset($this->request->get['filter_quantity'])) {
                $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
            }
            if (isset($this->request->get['filter_total'])) {
                $url .= '&filter_total=' . $this->request->get['filter_total'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['filter_date_modified'])) {
                $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
            
            
            $this->redirect($this->url->link('purchase/receipt', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }
}
?>
