<?php

class ControllerSeoSeoEditor extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('seo/seo_editor');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('seo/seo_editor');
        $this->getList();
    }

//    public function insert() {
//        $this->language->load('seo/seo_editor');
//        $this->document->setTitle($this->language->get('heading_title'));
//        $this->load->model('catalog/tag');
//
//        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
//            $this->model_catalog_seo_editor->addSeoEditor($this->request->post);
//            $this->session->data['success'] = $this->language->get('text_success');
//
//            $url = '';
//
//            if (isset($this->request->get['page'])) {
//                $url .= '&page=' . $this->request->get['page'];
//            }
//
//            $this->redirect($this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'] . $url, 'SSL'));
//        }
//
//        $this->getForm();
//    }

//    public function update() {
//        $this->language->load('seo/seo_editor');
//
//        $this->document->setTitle($this->language->get('heading_title'));
//
//        $this->load->model('catalog/tag');
//
//        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
//            $this->model_catalog_seo_editor->editSeoEditor($this->request->get['tag_id'], $this->request->post);
//
//            $this->session->data['success'] = $this->language->get('text_success');
//
//            $url = '';
//
//            if (isset($this->request->get['page'])) {
//                $url .= '&page=' . $this->request->get['page'];
//            }
//
//            $this->redirect($this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'] . $url, 'SSL'));
//        }
//
//        $this->getForm();
//    }

//    public function delete() {
//        $this->language->load('seo/seo_editor');
//        $this->document->setTitle($this->language->get('heading_title'));
//        $this->load->model('catalog/tag');
//        if (isset($this->request->post['selected']) && $this->validateDelete()) {
//            foreach ($this->request->post['selected'] as $tag_id) {
//                $this->model_catalog_seo_editor->deleteSeoEditor($tag_id);
//            }
//
//            $this->session->data['success'] = $this->language->get('text_success');
//
//            $url = '';
//
//            if (isset($this->request->get['page'])) {
//                $url .= '&page=' . $this->request->get['page'];
//            }
//            $this->redirect($this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'] . $url, 'SSL'));
//        }
//
//        $this->getList();
//    }

    protected function getList() {
        
         if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }
        
        if (isset($this->request->get['filter_keyword'])) {
            $filter_keyword = $this->request->get['filter_keyword'];
        } else {
            $filter_keyword = null;
        }
        if (isset($this->request->get['filter_meta_keyword'])) {
            $filter_meta_keyword = $this->request->get['filter_meta_keyword'];
        } else {
            $filter_meta_keyword = null;
        }
        if (isset($this->request->get['filter_meta_description'])) {
            $filter_meta_description = $this->request->get['filter_meta_description'];
        } else {
            $filter_meta_description = null;
        }
        if (isset($this->request->get['filter_tag'])) {
            $filter_tags = $this->request->get['filter_tags'];
        } else {
            $filter_tags = null;
        }
         if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'pd.name';
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
            'href' => $this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['insert'] = $this->url->link('seo/seo_editor/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('seo/seo_editor/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['repair'] = $this->url->link('seo/seo_editor/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');
        
        $this->data['seo_editors'] = array();

        $data = array(
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

       
        if (isset($this->request->get['filter_type'])) {
            $filter_type = $this->request->get['filter_type'];
        } else {
            $filter_type =0;
        }
         $data = array(
            'filter_type' => $filter_type,
            'filter_name' => $filter_name,
            'filter_keyword' => $filter_keyword,
            'filter_meta_keyword' => $filter_meta_keyword,
            'filter_meta_description' => $filter_meta_description,
            'filter_tags' => $filter_tags,
            
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );
        $tag_total=0;
         if ($filter_type ==0) {
            $results = $this->model_seo_seo_editor->getSeoCategories($data);
            foreach ($results as $result) {
                $action = array();

                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['category_id'] . $url, 'SSL')
                );
                $this->data['seo_editors'][] = array(
                    'type'=>$result['type'],
                    'id' => $result['category_id'],
                    'name' => $result['name'],
                    'keyword' => $result['keyword'],
                    'meta_keyword' => $result['meta_keyword'],
                    'meta_description' => $result['meta_description'],
                    'selected' => isset($this->request->post['selected']) && in_array($result['category_id'], $this->request->post['selected']),
                    'action' => $action
                );
            }
             $results = $this->model_seo_seo_editor->getSeoProducts($data);
            foreach ($results as $result) {
                $action = array();

                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['product_id'] . $url, 'SSL')
                );
                $this->data['seo_editors'][] = array(
                      'type'=>$result['type'],
                  
                    'id' => $result['product_id'],
                    'name' => $result['name'],
                    'keyword' => $result['keyword'],
                    'meta_keyword' => $result['meta_keyword'],
                    'meta_description' => $result['meta_description'],
                    'selected' => isset($this->request->post['selected']) && in_array($result['product_id'], $this->request->post['selected']),
                    'action' => $action
                );
            }
             $results = $this->model_seo_seo_editor->getSeoTags($data);
            foreach ($results as $result) {
                $action = array();

                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['tag_id'] . $url, 'SSL')
                );
                $this->data['seo_editors'][] = array(
                    'type'=>$result['type'],
                    'id' => $result['tag_id'],
                    'name' => $result['name'],
                    'keyword' => $result['keyword'],
                    'meta_keyword' => $result['meta_keyword'],
                    'meta_description' => $result['meta_description'],
                    'selected' => isset($this->request->post['selected']) && in_array($result['tag_id'], $this->request->post['selected']),
                    'action' => $action
                );
            }
             
         }elseif ($filter_type ==1) {
            $tag_total = $this->model_seo_seo_editor->getTotalSeoCategories($data);
          
            $results = $this->model_seo_seo_editor->getSeoCategories($data);
            foreach ($results as $result) {
                $action = array();

                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['category_id'] . $url, 'SSL')
                );
                $this->data['seo_editors'][] = array(
                    'type'=>$result['type'],
                    'id' => $result['category_id'],
                    'name' => $result['name'],
                    'keyword' => $result['keyword'],
                    'meta_keyword' => $result['meta_keyword'],
                    'meta_description' => $result['meta_description'],
                    'selected' => isset($this->request->post['selected']) && in_array($result['category_id'], $this->request->post['selected']),
                    'action' => $action
                );
            }
           
            
        }elseif ($filter_type ==2){
            $tag_total = $this->model_seo_seo_editor->getTotalSeoProducts($data);
            $results = $this->model_seo_seo_editor->getSeoProducts($data);
            foreach ($results as $result) {
                $action = array();

                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['product_id'] . $url, 'SSL')
                );
                $this->data['seo_editors'][] = array(
                      'type'=>$result['type'],
                  
                    'id' => $result['product_id'],
                    'name' => $result['name'],
                    'keyword' => $result['keyword'],
                    'meta_keyword' => $result['meta_keyword'],
                    'meta_description' => $result['meta_description'],
                    'selected' => isset($this->request->post['selected']) && in_array($result['product_id'], $this->request->post['selected']),
                    'action' => $action
                );
            }
        }else if($filter_type ==3){
            $tag_total = $this->model_seo_seo_editor->getTotalSeoTags($data);
             $results = $this->model_seo_seo_editor->getSeoTags($data);
            foreach ($results as $result) {
                $action = array();

                $action[] = array(
                    'text' => $this->language->get('text_edit'),
                    'href' => $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['tag_id'] . $url, 'SSL')
                );
                $this->data['seo_editors'][] = array(
                    'type'=>$result['type'],
                    'id' => $result['tag_id'],
                    'name' => $result['name'],
                    'keyword' => $result['keyword'],
                    'meta_keyword' => $result['meta_keyword'],
                    'meta_description' => $result['meta_description'],
                    'selected' => isset($this->request->post['selected']) && in_array($result['tag_id'], $this->request->post['selected']),
                    'action' => $action
                );
            }
            
        }
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['column_type'] = $this->language->get('column_type');
        $this->data['column_tags'] = $this->language->get('column_tags');
        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_keyword'] = $this->language->get('column_keyword');
        $this->data['column_meta_keyword'] = $this->language->get('column_meta_keyword');
        $this->data['column_meta_description'] = $this->language->get('column_meta_description');
        $this->data['column_action'] = $this->language->get('column_action');
        $this->data['entry_all'] = $this->language->get('entry_all');
        $this->data['entry_product'] = $this->language->get('entry_product');
        $this->data['entry_category'] = $this->language->get('entry_category');
        $this->data['entry_tags'] = $this->language->get('entry_tags');
        

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');
        $this->data['button_repair'] = $this->language->get('button_repair');
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

        $pagination = new Pagination();
        $pagination->total =$tag_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

         $this->data['filter_name'] = $filter_name;
        $this->data['filter_keyword'] = $filter_keyword;
        $this->data['filter_meta_keyword'] = $filter_meta_keyword;
        $this->data['filter_meta_description'] = $filter_meta_description;
        $this->data['filter_tags'] = $filter_tags;
       
        $this->data['pagination'] = $pagination->render();

        $this->template = 'seo/seo_editor_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

//    protected function getForm() {
//        $this->data['heading_title'] = $this->language->get('heading_title');
//        $this->data['text_none'] = $this->language->get('text_none');
//        $this->data['text_default'] = $this->language->get('text_default');
//        $this->data['entry_name'] = $this->language->get('entry_name');
//        $this->data['entry_keyword'] = $this->language->get('entry_keyword');
//        $this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
//        $this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
//        $this->data['button_save'] = $this->language->get('button_save');
//        $this->data['button_cancel'] = $this->language->get('button_cancel');
//
//        if (isset($this->error['warning'])) {
//            $this->data['error_warning'] = $this->error['warning'];
//        } else {
//            $this->data['error_warning'] = '';
//        }
//
//        if (isset($this->error['name'])) {
//            $this->data['error_name'] = $this->error['name'];
//        } else {
//            $this->data['error_name'] = '';
//        }
//
//        $this->data['breadcrumbs'] = array();
//
//        $this->data['breadcrumbs'][] = array(
//            'text' => $this->language->get('text_home'),
//            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
//            'separator' => false
//        );
//
//        $this->data['breadcrumbs'][] = array(
//            'text' => $this->language->get('heading_title'),
//            'href' => $this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'], 'SSL'),
//            'separator' => ' :: '
//        );
//
//        if (!isset($this->request->get['tag_id'])) {
//            $this->data['action'] = $this->url->link('seo/seo_editor/insert', 'token=' . $this->session->data['token'], 'SSL');
//        } else {
//            $this->data['action'] = $this->url->link('seo/seo_editor/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $this->request->get['tag_id'], 'SSL');
//        }
//
//        $this->data['cancel'] = $this->url->link('seo/seo_editor', 'token=' . $this->session->data['token'], 'SSL');
//
//        if (isset($this->request->get['tag_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
//            $tag_info = $this->model_catalog_seo_editor->getSeoEditor($this->request->get['tag_id']);
//        }
//
//        $this->data['token'] = $this->session->data['token'];
//
//        if (isset($this->request->post['name'])) {
//            $this->data['name'] = $this->request->post['name'];
//        } elseif (!empty($tag_info)) {
//            $this->data['name'] = $tag_info['name'];
//        } else {
//            $this->data['name'] = '';
//        }
//        if (isset($this->request->post['keyword'])) {
//            $this->data['keyword'] = $this->request->post['keyword'];
//        } elseif (!empty($tag_info)) {
//            $this->data['keyword'] = $tag_info['keyword'];
//        } else {
//            $this->data['keyword'] = '';
//        }
//        if (isset($this->request->post['meta_keyword'])) {
//            $this->data['meta_keyword'] = $this->request->post['meta_keyword'];
//        } elseif (!empty($tag_info)) {
//            $this->data['meta_keyword'] = $tag_info['meta_keyword'];
//        } else {
//            $this->data['meta_keyword'] = '';
//        }
//
//        if (isset($this->request->post['meta_description'])) {
//            $this->data['meta_description'] = $this->request->post['meta_description'];
//        } elseif (!empty($tag_info)) {
//            $this->data['meta_description'] = $tag_info['meta_description'];
//        } else {
//            $this->data['meta_description'] = '';
//        }
//
//
//        $this->load->model('design/layout');
//
//        //  $this->data['layouts'] = $this->model_design_layout->getLayouts();
//
//        $this->template = 'seo/seo_editor_form.tpl';
//        $this->children = array(
//            'common/header',
//            'common/footer'
//        );
//        $this->response->setOutput($this->render());
//    }

//    protected function validateForm() {
//        if (!$this->user->hasPermission('modify', 'seo/seo_editor')) {
//            $this->error['warning'] = $this->language->get('error_permission');
//        }
//
//
//        if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 255)) {
//            $this->error['name'] = $this->language->get('error_name');
//        }
//
//
//        if ($this->error && !isset($this->error['warning'])) {
//            $this->error['warning'] = $this->language->get('error_warning');
//        }
//
//        if (!$this->error) {
//            return true;
//        } else {
//            return false;
//        }
//    }

//    protected function validateDelete() {
//        if (!$this->user->hasPermission('modify', 'seo/seo_editor')) {
//            $this->error['warning'] = $this->language->get('error_permission');
//        }
//
//        if (!$this->error) {
//            return true;
//        } else {
//            return false;
//        }
//    }
//    public function autocomplete() {
//		$json = array();
//		
//		if (isset($this->request->get['tag_name'])) {
//			$this->load->model('catalog/tag');
//			
//			$data = array(
//				'filter_name' => $this->request->get['tag_name'],
//				'start'       => 0,
//				'limit'       => 20
//			);
//			
//			$tags = $this->model_catalog_seo_editor->getSeoEditors($data);
//			
//			foreach ($tags as $tag) {				
//				$json[] = array(
//					'tag_id' => $tag['tag_id'],
//					'name'      => $tag['name']
//				);
//			}
//		}
//
//		$sort_order = array();
//	  
//		foreach ($json as $key => $value) {
//			$sort_order[$key] = $value['name'];
//		}
//
//		array_multisort($sort_order, SORT_ASC, $json);
//				
//		$this->response->setOutput(json_encode($json));
//	}

}

?>